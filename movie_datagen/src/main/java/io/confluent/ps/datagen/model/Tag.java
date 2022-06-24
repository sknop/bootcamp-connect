package io.confluent.ps.datagen.model;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@DatabaseTable(tableName = "tags", schemaName = "movielens")
@NoArgsConstructor
@RequiredArgsConstructor
@ToString
public class Tag {

    @DatabaseField(canBeNull = false)
    @NonNull
    @Getter @Setter private String tag;

    @DatabaseField(columnName = "movie_id")
    @NonNull
    @Setter @Getter private long movieId;

    @DatabaseField(columnName = "user_id")
    @NonNull @Getter @Setter private long userId;

    @DatabaseField(columnName = "timestamp")
    @Getter @Setter private java.sql.Timestamp timestamp;

    public static String getTable() {
        return "movielens.tags";
    }
}
