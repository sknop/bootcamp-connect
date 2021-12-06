package io.confluent.ps.datagen;

import com.j256.ormlite.jdbc.JdbcConnectionSource;
import com.j256.ormlite.support.ConnectionSource;
import io.confluent.ps.datagen.model.Genre;
import io.confluent.ps.datagen.model.Movie;
import io.confluent.ps.datagen.model.Tag;
import org.apache.commons.collections4.ListUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.function.Consumer;
import java.util.stream.Collectors;

public class Store {

    MovieStore movieStore;
    ScheduledExecutorService threadPool;
    CountDownLatch latch;
    Connection[] connections;

    private Store(ConnectionSource connectionSource, Connection[] connections) {
        this.movieStore = new MovieStore(connectionSource, connections);
        this.threadPool = Executors.newScheduledThreadPool(10);
        this.latch = new CountDownLatch(4);
        this.connections = connections;
    }

    public static Store build(String databaseUrl) throws SQLException {
        ConnectionSource connectionSource = new JdbcConnectionSource(databaseUrl);
        Connection[] connections = new Connection[]{
                DriverManager.getConnection(databaseUrl),
                DriverManager.getConnection(databaseUrl),
                DriverManager.getConnection(databaseUrl)
        };
        return new Store(connectionSource, connections);

    }

    public void process(List<Map.Entry<Movie, List<Genre>>> movies, List<Tag> tags) throws InterruptedException {
        threadPool.schedule(mainLoad(movies), 2, TimeUnit.SECONDS);
        threadPool.schedule(loadTags(tags), 1, TimeUnit.SECONDS);
        threadPool.scheduleAtFixedRate(doUpdates(), 5, 5, TimeUnit.SECONDS);
        // wait for termination
        latch.await();
    }

    public void close() throws Exception {
        threadPool.shutdown();
        threadPool.awaitTermination(2, TimeUnit.MINUTES);
        for(Connection con : connections) {
            con.close();
        }
    }

    public Callable<String> loadTags(List<Tag> tags) {
        return () -> {
            ListUtils.partition(tags, 500)
                    .forEach(new Consumer<List<Tag>>() {
                        @Override
                        public void accept(List<Tag> tags) {
                            try {
                                movieStore.batchStoreTags(tags);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                    });
            latch.countDown();
            return "done";
        };
    }

    public Callable<String> mainLoad(List<Map.Entry<Movie, List<Genre>>> movies) {
        return () -> {
            try {
                var genres = movies.stream()
                        .map(Map.Entry::getValue)
                        .flatMap(Collection::stream)
                        .collect(Collectors.toList());

                movieStore.batchStoreGenres(genres);

                ListUtils
                        .partition(movies, 100)
                        .forEach(new Consumer<List<Map.Entry<Movie, List<Genre>>>>() {
                            @Override
                            public void accept(List<Map.Entry<Movie, List<Genre>>> entries) {
                                try {
                                    movieStore.batchStore(entries);
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            }
                        });


            } catch (Exception ex) {
                ex.printStackTrace();
            } finally {
                latch.countDown();
            }
            return "done";
        };
    }

    public Runnable doUpdates() {
        return () -> {
            try {
                System.out.println("Doing an update");
                movieStore.doUpdate();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        };
    }
}
