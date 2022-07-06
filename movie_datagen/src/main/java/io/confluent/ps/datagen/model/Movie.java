package io.confluent.ps.datagen.model;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@DatabaseTable(tableName = "movies", schemaName = "movielens")
@NoArgsConstructor
@ToString
public class Movie {

    @DatabaseField(id = true)
    @Getter @Setter private long Id;

    @DatabaseField(canBeNull = false)
    @Getter @Setter private String title;

    @DatabaseField(canBeNull = false)
    @Getter @Setter private String year;

    @DatabaseField( columnName = "created_at")
    @Getter @Setter private java.sql.Timestamp createdAt;

    @DatabaseField(columnName = "updated_at")
    @Getter @Setter private java.sql.Timestamp updatedAt;

    public static String getTable() {
        return "movielens.movies";
    }

    public static String getGenreMapTable() {
        return "movielens.movies_to_genres";
    }
}
