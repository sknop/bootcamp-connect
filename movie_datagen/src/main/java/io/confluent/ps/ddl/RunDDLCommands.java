package io.confluent.ps.ddl;

import picocli.CommandLine;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.regex.Pattern;

abstract class ApplicableStatement {
    protected final String statement;

    ApplicableStatement(String statement) {
        this.statement = statement;
    }

    void apply(Connection connection) throws SQLException {
        internalApply(connection, statement);
    }

    public void apply(Connection connection, String username) throws SQLException {
        var newStatement = statement.
                replace("{{user}}", username).
                replace("{{user:upper}}", username.toUpperCase());
        internalApply(connection, newStatement);
    }

    abstract void internalApply(Connection connection, String statement) throws SQLException;

    @Override public String toString() {
        return statement;
    }
}

class DDLStatement extends ApplicableStatement {

    DDLStatement(String s) {
        super(s);
    }

    @Override
    public void internalApply(Connection connection, String newStatement) throws SQLException {
        try (Statement stmt = connection.createStatement()) {
            stmt.execute(newStatement);
        }
        catch (SQLException e) {
            if (e.getMessage().contains("ORA-01920")) {
                System.err.println("Ignoring the following error:");
                System.err.println(e.getMessage());
            }
            else
                throw e;
        }
    }
}

class PLSQLStatement extends ApplicableStatement {

    PLSQLStatement(String s) {
        super(s);
    }

    @Override
    public void internalApply(Connection connection, String newStatement) throws SQLException {
        try (var stmt = connection.prepareCall(newStatement)) {
            stmt.executeUpdate();
        }
    }
}

@CommandLine.Command(name = "RunDDLCommands",
        version = "RunDDLCommands 0.0.1",
        mixinStandardHelpOptions = true,
        description = "Execute DDL Commands for any database via JDBC"
)
public class RunDDLCommands implements Callable<Integer> {

    @CommandLine.Option(names = { "-d", "--database-url"}, required = true, description = "The JDBC connection string")
    private String databaseUrl;

    @CommandLine.Option(names = { "-u", "--user"}, required = true, description = "The database user")
    private String username;

    @CommandLine.Option(names = { "-p", "--password"}, required = true, description = "The database user's password")
    private String password;

    @CommandLine.Option(names = { "-t", "--template"}, required = true, description = "The database DDL template")
    private String templateFile;

    @CommandLine.Option(names = { "-s", "--students"}, description = "The list of students")
    private String studentFile;

    final private List<ApplicableStatement> statements = new ArrayList<>();
    final private List<String> students = new ArrayList<>();


    private void loadStatements() {
        boolean inProcedure = false;
        StringBuilder statement = new StringBuilder();

        String delimiter = ";";
        try {
            var lines = Files.readAllLines(Paths.get(templateFile), StandardCharsets.UTF_8);

            for (var line: lines) {
                if (!line.isEmpty() && !line.trim().startsWith("--")) {
                    if (line.trim().toUpperCase().startsWith("DELIMITER")) {
                        var pattern = Pattern.compile("\\s*DELIMITER\\s+(\\S+)",Pattern.CASE_INSENSITIVE);
                        var matcher = pattern.matcher(line);
                        if (matcher.find()) {
                            delimiter = matcher.group(1);
                        }
                    }
                    else {
                        if (!inProcedure &&
                                (
                                        line.trim().toUpperCase().startsWith("BEGIN") ||
                                        line.trim().toUpperCase().startsWith("CREATE PROCEDURE") ||
                                        line.trim().toUpperCase().startsWith("DECLARE")
                                )) {
                            inProcedure = true;
                            statement.append(line);
                        } else {
                            if (statement.isEmpty() && !inProcedure) {
                                statement.append(line);
                            } else {
                                if (!line.startsWith("/")) {
                                    statement.append("\n");
                                    statement.append(line);
                                }
                            }
                            if (inProcedure) {
                                // This does not work yet with MySQL, the statement ends with END and not /
                                // I would  have to use information about the Connection to distinguish them both
                                if (line.startsWith("/")) {
                                    inProcedure = false;
                                    statements.add(new PLSQLStatement(statement.toString()));
                                    statement.setLength(0);
                                }
                            } else {
                                if (line.endsWith(delimiter)) {
                                    statement.setLength(statement.length() - delimiter.length()); // removes the last delimiter
                                    statements.add(new DDLStatement(statement.toString()));
                                    statement.setLength(0);
                                }
                            }
                        }
                    }
                }
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void loadStudents() {
        try {
            var studentNames = Files.readAllLines(Paths.get(studentFile));

            students.addAll(studentNames);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Integer call() throws Exception {
        // Load template
        loadStatements();

        // Load students
        if (studentFile != null) {
            loadStudents();
        }

        try (Connection connection = DriverManager.getConnection(databaseUrl, username, password)) {

            for (var statement: statements) {
                System.out.println("---------");
                System.out.println(statement);

                statement.apply(connection);
            }
        }

        return null;
    }

    public static void main(String[] args) {
        try {
            new CommandLine(new RunDDLCommands()).execute(args);
        }
        catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }
    }
}
