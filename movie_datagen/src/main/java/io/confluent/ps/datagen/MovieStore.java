package io.confluent.ps.datagen;

import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.dao.DaoManager;
import com.j256.ormlite.stmt.QueryBuilder;
import com.j256.ormlite.support.ConnectionSource;
import io.confluent.ps.datagen.model.Genre;
import io.confluent.ps.datagen.model.Movie;
import io.confluent.ps.datagen.model.MovieGenre;
import io.confluent.ps.datagen.model.Tag;
import lombok.SneakyThrows;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.stream.Collectors;

public class MovieStore {


    private final ConnectionSource connectionSource;
    private final Dao<Movie, Long> movieDao;
    private final Dao<Genre, Long> genreDao;
    private final Dao<MovieGenre, Long> movieGenreDao;
    private final Dao<Tag, Long> tagDao;

    @SneakyThrows
    public MovieStore(ConnectionSource connectionSource) {
        this.connectionSource = connectionSource;
        this.movieDao =
                DaoManager.createDao(connectionSource, Movie.class);
        this.genreDao =
                DaoManager.createDao(connectionSource, Genre.class);
        this.movieGenreDao =
                DaoManager.createDao(connectionSource, MovieGenre.class);
        this.tagDao =
                DaoManager.createDao(connectionSource, Tag.class);
    }

    public void store(Movie movie, List<Genre> genres) throws SQLException {
        movieDao.createOrUpdate(movie);
        for(Genre genre : genres) {
            var retrievedGenre = genreDao.createIfNotExists(genre);
            var movieGenre = new MovieGenre(movie, retrievedGenre);
            movieGenreDao.createOrUpdate(movieGenre);
        }
    }

    public void batchStoreTags(List<Tag> tags) throws Exception {
        tagDao.create(tags);
    }
    public void batchStoreGenres(List<Genre> genres) throws Exception {
        genreDao.callBatchTasks(new Callable<Void>(){
            @Override
            public Void call() throws Exception {
                var uniques = genres.stream()
                        .distinct()
                        .collect(Collectors.toList());
                genreDao.create(uniques);
                return null;
            }
        });
    }

    public void batchStore(List<Map.Entry<Movie, List<Genre>>> entries) throws Exception {

        movieDao.callBatchTasks(new Callable<Void>(){
            @Override
            public Void call() throws Exception {
                var movies = entries.stream()
                        .map(e -> e.getKey())
                        .map(movie -> {
                            var createTime = new Timestamp(System.currentTimeMillis());
                            movie.setCreatedAt(createTime);
                            movie.setUpdatedAt(createTime);
                            return movie;
                        })
                        .collect(Collectors.toList());
                movieDao.create(movies);
                return null;
            }
        });

        movieGenreDao.callBatchTasks(new Callable<Void>() {
            @Override
            public Void call() throws Exception {
                for(Map.Entry<Movie, List<Genre>> entry : entries) {
                    for(Genre genre : entry.getValue()) {
                        var movieGenre = new MovieGenre(entry.getKey(), genre);
                        movieGenreDao.create(movieGenre);
                    }
                }
                return null;
            }
        });
    }

    public void doUpdate() throws SQLException {
        long latestId = getLatestId();
        if (latestId > 0) {
            long idToUpdate = (long)((Math.random() * (latestId-1)) + 1);
            Movie movie = movieDao.queryForId(idToUpdate);
            if (movie != null) {
                var instant = Instant.now().truncatedTo(ChronoUnit.MICROS);
                movie.setUpdatedAt(Timestamp.from(instant));
                System.out.println("updating movie:" + movie);
                movieDao.update(movie);
            }
        }
    }

    private long getLatestId() throws SQLException {
        QueryBuilder<Movie, Long> queryBuilder = movieDao.queryBuilder();
        queryBuilder.selectRaw("MAX(`Id`)");
        var queryResult = movieDao.queryRaw(queryBuilder.prepareStatementString());
        var firstResult = queryResult.getFirstResult()[0];
        if (firstResult == null) {
            return -1;
        } else {
            return Long.parseLong(firstResult);
        }
    }
}
