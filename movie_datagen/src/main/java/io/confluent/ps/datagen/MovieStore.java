package io.confluent.ps.datagen;

import io.confluent.ps.datagen.dao.GenresDao;
import io.confluent.ps.datagen.dao.MovieDao;
import io.confluent.ps.datagen.dao.TagDao;
import io.confluent.ps.datagen.model.Genre;
import io.confluent.ps.datagen.model.Movie;
import io.confluent.ps.datagen.model.MovieGenre;
import io.confluent.ps.datagen.model.Tag;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class MovieStore {
    private final TagDao tagDao;
    private final MovieDao movieDao;
    private final GenresDao genreDao;

    public MovieStore(Connection[] connections) {
        this.genreDao = new GenresDao(connections[0]);
        this.tagDao = new TagDao(connections[1]);
        this.movieDao = new MovieDao(connections[2]);
    }

    public void store(Movie movie, List<Genre> genres) throws SQLException {
        movieDao.createOrUpdate(movie);
        for(Genre genre : genres) {
            var retrievedGenre = genreDao.createIfNotExists(genre);
            var movieGenre = new MovieGenre(movie, retrievedGenre);
            movieDao.createGenreMap(Collections.singletonList(movieGenre));
        }
    }

    public void batchStoreTags(List<Tag> tags) throws Exception {
        tagDao.create(tags);
    }

    public void batchStoreGenres(List<Genre> genres) throws Exception {
        var uniques = genres.stream()
                .distinct()
                .collect(Collectors.toList());
        genreDao.create(uniques);
    }

    public void batchStore(List<Map.Entry<Movie, List<Genre>>> entries) throws Exception {
        var movies = entries.stream()
                .map(Map.Entry::getKey)
                .peek(movie -> {
                    var createTime = new Timestamp(System.currentTimeMillis());
                    movie.setCreatedAt(createTime);
                    movie.setUpdatedAt(createTime);
                })
                .collect(Collectors.toList());
        movieDao.create(movies);

        var movieGenresMap = new ArrayList<MovieGenre>();

        for(Map.Entry<Movie, List<Genre>> entry : entries) {
            for(Genre genre : entry.getValue()) {
                var movieGenre = new MovieGenre(entry.getKey(), genre);
                movieGenresMap.add(movieGenre);
            }
        }
        movieDao.createGenreMap(movieGenresMap);
    }

    public void doUpdate() throws SQLException {
        long latestId = movieDao.getLatestId();
        if (latestId > 0) {
            long idToUpdate = (long)((Math.random() * (latestId-1)) + 1);
            Movie movie = movieDao.queryForId(idToUpdate);
            if (movie != null) {
                var instant = Instant.now().truncatedTo(ChronoUnit.MICROS);
                movie.setUpdatedAt(Timestamp.from(instant));
                System.out.println("Movies: updated '" + movie + "'");
                movieDao.update(movie);
            }
        }
    }
}
