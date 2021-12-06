package io.confluent.ps.datagen;

import com.j256.ormlite.logger.Level;
import com.j256.ormlite.logger.Logger;

import java.io.IOException;
import java.sql.SQLException;

public class DataGen {

    private double initialPercent;
    private String databaseUrl;
    private Store store;

    public DataGen(double initialPercent, String databaseUrl) {
        this.initialPercent = initialPercent;
        this.databaseUrl = databaseUrl;
    }

    public void run(String dir) throws IOException, SQLException, InterruptedException {
        CsvFileParser parser = new CsvFileParser();
        var movies = parser.loadFile(dir + "/movies.csv");
        var tags = parser.loadTags(dir + "/tags.csv");

        store = Store.build(databaseUrl);

        var initialLoadCount = (int)Math.round(movies.size()*initialPercent);
        System.out.println("Loading as initial load: "+initialLoadCount+" movies, rest will be used as future delayed inserts");

        long time = System.currentTimeMillis();
        store.process(movies.subList(0, initialLoadCount), tags.subList(0,50000));
        long all = System.currentTimeMillis()-time;
        System.out.println("total: "+all);

    }

    public void close() throws InterruptedException {
        store.close();
    }

    public static void main(String[] args) throws Exception {
        Logger.setGlobalLogLevel(Level.INFO);

        String mySqlDatabaseUrl = "jdbc:mysql://pub-mysql.cmhtgh6yg7h9.eu-west-1.rds.amazonaws.com:3306/movielens?user=foo&password=foobarbaz";
        String baseDir = "/Users/pere/Datasets/movie_lens/ml-latest";

        DataGen dataGen = new DataGen(0.05, mySqlDatabaseUrl);
        dataGen.run(baseDir);

        Runtime.getRuntime().addShutdownHook(new Thread(() -> {
            try {
                dataGen.close();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }));

    }
}
