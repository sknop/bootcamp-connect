package io.confluent.ps.datagen.dao;

import io.confluent.ps.datagen.model.Genre;
import io.confluent.ps.datagen.model.Movie;
import lombok.SneakyThrows;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Collections;
import java.util.List;

public class GenresDao {

    private Connection connection;

    public GenresDao(Connection connection) {
        this.connection = connection;
    }

    public Genre createIfNotExists(Genre genre) throws SQLException {
        if (!idExist(genre.getId(), Genre.getTable())) {
            create(Collections.singletonList(genre));
        }
        return genre;
    }

    public void create(List<Genre> genres) throws SQLException {
        try {
            connection.setAutoCommit(false);
            String table = Genre.getTable();
            String sql = "insert into " + table + " (id, name) values (?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            for (Genre genre : genres) {
                ps.setInt(1, genre.getId());
                ps.setString(2, genre.getName());
                ps.addBatch();
            }
            ps.executeBatch();
            connection.commit();
            ps.close();
        } finally {
            connection.setAutoCommit(true);
        }
    }

    private boolean idExist(int id, String table) throws SQLException {
        Statement stm = connection.createStatement();
        ResultSet rs = stm.executeQuery("SELECT id from "+table+" where id="+id);
        if (rs.next()) {
            return true;
        }
        return false;
    }
}
