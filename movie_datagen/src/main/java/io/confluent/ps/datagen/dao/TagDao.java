package io.confluent.ps.datagen.dao;

import io.confluent.ps.datagen.model.Tag;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class TagDao {

    private final Connection connection;

    public TagDao(Connection connection) {
        this.connection = connection;
    }


    public void create(List<Tag> tags) throws SQLException {
        try {
            connection.setAutoCommit(false);
            String table = Tag.getTable();
            String sql = "insert into " + table + " (user_id, movie_id, tag, timestamp) values (?,?,?,?)";
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                for (Tag tag : tags) {
                    ps.setLong(1, tag.getUserId());
                    ps.setLong(2, tag.getMovieId());
                    ps.setString(3, tag.getTag());
                    ps.setTimestamp(4, tag.getTimestamp());
                    ps.addBatch();
                }
                ps.executeBatch();
                connection.commit();
            }
        } finally {
            connection.setAutoCommit(true);
        }
    }
}
