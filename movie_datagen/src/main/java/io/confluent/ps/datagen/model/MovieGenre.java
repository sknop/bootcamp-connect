package io.confluent.ps.datagen.model;

import com.j256.ormlite.field.DatabaseField;
import com.j256.ormlite.table.DatabaseTable;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@DatabaseTable(tableName = "movies_to_genres")
@NoArgsConstructor
@RequiredArgsConstructor
public class MovieGenre {

    @DatabaseField(generatedId = true)
    int id;

    @DatabaseField(columnName = "movie_id", foreign = true)
    @NonNull
    @Setter @Getter private Movie movie;

    @DatabaseField(columnName = "genre_id", foreign = true)
    @NonNull @Getter @Setter private Genre genre;

}
