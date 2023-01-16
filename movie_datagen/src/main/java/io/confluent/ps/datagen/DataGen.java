package io.confluent.ps.datagen;

import java.util.logging.Level;
import java.util.logging.Logger;

import java.io.IOException;
import java.sql.SQLException;

public class DataGen {

    final private double initialPercent;
    final private String databaseUrl;

    final private String username;
    final private String password;
    private Store store;

    public DataGen(double initialPercent, String databaseUrl, String username, String password) {
        this.initialPercent = initialPercent;
        this.databaseUrl = databaseUrl;
        this.username = username;
        this.password = password;
    }

    public void run(String dir) throws IOException, SQLException, InterruptedException {
        CsvFileParser parser = new CsvFileParser();
        var movies = parser.loadFile(dir + "/movies.csv");
        var tags = parser.loadTags(dir + "/tags.csv");

        store = Store.build(databaseUrl, username, password);

        var initialLoadCount = (int)Math.round(movies.size()*initialPercent);
        System.out.println("Loading as initial load: "+initialLoadCount+" movies, rest will be used as future delayed inserts");

        long time = System.currentTimeMillis();
        store.process(movies.subList(0, initialLoadCount), tags.subList(0, 500000));
        long all = System.currentTimeMillis()-time;
        System.out.println("total: "+all);
    }

    public void close() throws Exception {
        store.close();
    }

    public static void main(String[] args) throws Exception {
        Logger.getGlobal().setLevel(Level.INFO);

        if (args.length < 4) {
            System.err.println("Usage: DataGen <database-url> <data-set-base-dir> <username> <password>");
            System.exit(1);
        }

        String databaseUrl = args[0];
        String baseDir = args[1];
        String username = args[2];
        String password = args[3];

        DataGen dataGen = new DataGen(1.0, databaseUrl, username, password);
        dataGen.run(baseDir);

        Runtime.getRuntime().addShutdownHook(new Thread(() -> {
            try {
                dataGen.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }));

    }
}
