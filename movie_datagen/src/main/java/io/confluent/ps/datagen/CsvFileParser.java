package io.confluent.ps.datagen;

import io.confluent.ps.datagen.model.Genre;
import io.confluent.ps.datagen.model.Movie;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;

import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.function.Function;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

public class CsvFileParser {

    Pattern movieTitlePattern;

    public CsvFileParser() {
        String pattern = "(.*)\\((\\d+)\\)";
        movieTitlePattern = Pattern.compile(pattern);
    }

    public List<Entry<Movie, List<Genre>>> loadFile(String path) throws IOException {

        Reader in = new FileReader(path);
        CSVParser parser = CSVFormat.RFC4180.withFirstRecordAsHeader().parse(in);
        List<Entry<Movie, List<Genre>>> movies;
        try {
            movies = parser.stream().map(new Function<CSVRecord, Entry<Movie, List<Genre>>>() {
                @Override
                public Entry<Movie, List<Genre>> apply(CSVRecord record) {
                    var movie = new Movie();
                    movie.setId(Long.parseLong(record.get("movieId")));
                    var titleAndYear = getTitleAndYear(record.get("title").trim());
                    if (titleAndYear.length == 2) {
                        movie.setTitle(titleAndYear[0]);
                        movie.setYear(titleAndYear[1]);
                    } else {
                        movie.setTitle(record.get("title"));
                        movie.setYear("-1");
                    }

                    var listOfGenres = record.get("genres").split("\\|");
                    var genres = Arrays.stream(listOfGenres)
                            .map(genre -> new Genre(genre))
                            .collect(Collectors.toList());

                    return Map.entry(movie, genres);
                }
            }).collect(Collectors.toList());
        } finally {
            parser.close();
            in.close();
        }
        return movies;
    }

    private String[] getTitleAndYear(String title) {
        Matcher matcher = movieTitlePattern.matcher(title);
        if (matcher.matches()) {
            return new String[]{matcher.group(1).trim(), matcher.group(2).trim()};
        }
        return new String[0];
    }
}
