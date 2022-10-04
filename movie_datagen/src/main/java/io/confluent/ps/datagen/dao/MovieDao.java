package io.confluent.ps.datagen.dao;

import io.confluent.ps.datagen.model.Movie;
import io.confluent.ps.datagen.model.MovieGenre;
import lombok.SneakyThrows;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class MovieDao {

    private Connection connection;

    public MovieDao(Connection connection) {
        this.connection = connection;
    }

    public void createOrUpdate(Movie movie) throws SQLException {
        if (idExist(movie.getId(), movie.getTable())) {
            update(movie);
        } else {
            create(Collections.singletonList(movie));
        }
    }

    public void create(List<Movie> movies) throws SQLException {
        try {
            connection.setAutoCommit(false);
            String table = Movie.getTable();
            String sql = "insert into " + table + " (id, title, year, created_at, updated_at) values (?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            for (Movie movie : movies) {
                ps.setLong(1, movie.getId());
                ps.setString(2, movie.getTitle());
                ps.setString(3, movie.getYear());
                ps.setTimestamp(4, movie.getCreatedAt());
                ps.setTimestamp(5, movie.getUpdatedAt());
                ps.addBatch();
            }
            ps.executeBatch();
            connection.commit();
            ps.close();
        } finally {
            connection.setAutoCommit(true);
        }
    }

    @SneakyThrows
    private boolean idExist(Long id, String table) {
        Statement stm = connection.createStatement();
        ResultSet rs = stm.executeQuery("SELECT id from "+table+" where id="+id);
        boolean isExist = rs.next();
        rs.close();
        return isExist;
    }

    public Movie queryForId(long id) throws SQLException {
        String table = Movie.getTable();
        Statement stm = connection.createStatement();
        ResultSet rs = stm.executeQuery("SELECT * from "+table+" where id="+id);
        if (rs.next()) {
            Movie movie = new Movie();
            movie.setId(rs.getLong("id"));
            movie.setTitle(rs.getString("title"));
            movie.setYear(rs.getString("year"));
            movie.setCreatedAt(rs.getTimestamp("created_at"));
            movie.setUpdatedAt(rs.getTimestamp("updated_at"));
            rs.close();
            return movie;
        }
        return null;
    }

    public void update(Movie movie) throws SQLException {
        String sql = "update "+Movie.getTable()+"\n" +
                "SET title = ?," +
                "    year  = ?," +
                "    created_at = ?," +
                "    updated_at = ? \n" +
                "WHERE id = ?";

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, movie.getTitle());
        ps.setString(2, movie.getYear());
        ps.setTimestamp(3, movie.getCreatedAt());
        ps.setTimestamp(4, movie.getUpdatedAt());
        ps.setLong(5, movie.getId());
        ps.executeUpdate();
        ps.close();
    }

    public long getLatestId() throws SQLException {
        try(Statement stm = connection.createStatement()) {
            try(ResultSet rs = stm.executeQuery("SELECT MAX(id) as max from " + Movie.getTable())) {
                long latestId = -1;
                if (rs.next()) {
                    latestId = rs.getInt("max");
                }
                return latestId;
            }
        }
    }

    public void createGenreMap(List<MovieGenre> movieGenresMap) throws SQLException {
        try {
            connection.setAutoCommit(false);
            String table = Movie.getGenreMapTable();
            String sql = "insert into " + table + " (movie_id, genre_id) values (?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            for (MovieGenre map : movieGenresMap) {
                ps.setLong(1, map.getMovie().getId());
                ps.setLong(2, map.getGenre().getId());
                ps.addBatch();
            }
            ps.executeBatch();
            connection.commit();
        } finally {
            connection.setAutoCommit(true);
        }
    }
}
