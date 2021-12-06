package io.confluent.ps.datagen;

import com.j256.ormlite.jdbc.JdbcConnectionSource;
import com.j256.ormlite.support.ConnectionSource;
import io.confluent.ps.datagen.model.Genre;
import io.confluent.ps.datagen.model.Movie;
import org.apache.commons.collections4.ListUtils;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.function.Consumer;
import java.util.stream.Collector;
import java.util.stream.Collectors;

public class Store {

    MovieStore movieStore;
    ScheduledExecutorService threadPool;
    CountDownLatch latch;

    private Store(ConnectionSource connectionSource) {
        this.movieStore = new MovieStore(connectionSource);
        this.threadPool = Executors.newScheduledThreadPool(10);
        this.latch = new CountDownLatch(2);
    }

    public static Store build(String databaseUrl) throws SQLException {
        ConnectionSource connectionSource = new JdbcConnectionSource(databaseUrl);
        return new Store(connectionSource);

    }

    public void process(List<Map.Entry<Movie, List<Genre>>> movies) throws InterruptedException {
        ScheduledFuture<String> load = threadPool.schedule(mainLoad(movies), 2, TimeUnit.SECONDS);
        var refreshment = threadPool.scheduleAtFixedRate(doUpdates(), 5, 5, TimeUnit.SECONDS);
        // wait for termination
        latch.await();
    }

    public void close() throws InterruptedException {
        threadPool.shutdown();
        threadPool.awaitTermination(2, TimeUnit.MINUTES);
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
