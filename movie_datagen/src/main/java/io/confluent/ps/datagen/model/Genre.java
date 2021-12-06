package io.confluent.ps.datagen.model;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;

import java.util.Objects;

@DatabaseTable(tableName = "genres", schemaName = "movielens")
@NoArgsConstructor
@ToString
public class Genre {

    @DatabaseField(id = true)
    @Getter @Setter private int id;

    @DatabaseField(canBeNull = false, columnName = "name")
    @NonNull
    @Getter @Setter private String name;

    public Genre(String name) {
        this.name = name;
        this.id = name.hashCode() & 0xfffffff;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Genre)) return false;
        Genre genre = (Genre) o;
        return Objects.equals(getName(), genre.getName());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getName());
    }

    public static String getTable() {
        return "genres";
    }

}
