package dataAccess;

import oracle.jdbc.pool.OracleDataSource;
import ui.Main;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Objects;
import java.util.Properties;

public class DatabaseConnection {

    public static final int CONNECTION_SUCCESS = 1;
    public static final int CONNECTION_FAILURE = -1;
    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521/xe";
    private static final String USERNAME = "loc";
    private static final String PASSWORD = "basedados";

    private static DatabaseConnection instance;
    private OracleDataSource oracleDataSource;
    private Connection connection;
    private SQLException error;

    public DatabaseConnection() throws SQLException {
        try {
            loadProperties();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        oracleDataSource = new OracleDataSource();
        oracleDataSource.setURL(url());
        connection = oracleDataSource.getConnection(user(), password());
        connection.setAutoCommit(false);
    }

    public Connection getConnection() {
        if (Objects.isNull(connection)) {
            throw new RuntimeException("Connection does not exit");
        }
        return connection;
    }

    public int testConnection(){
        if (Objects.isNull(connection)) {
            return CONNECTION_FAILURE;
        }
        return CONNECTION_SUCCESS;
    }

    public void closeConnection() throws SQLException {
        if(!connection.isClosed())
            connection.close();
    }

    public String url() {
        return System.getProperty("database.url");
    }

    public String user() {
        return System.getProperty("database.user");
    }

    public String password() {
        return System.getProperty("database.password");
    }

    public static DatabaseConnection getInstance() throws SQLException {
        if(Objects.isNull(instance))
            instance = new DatabaseConnection();
        return instance;
    }

    private void loadProperties() throws IOException {
        Properties properties = new Properties(System.getProperties());

        InputStream inputStream = new Main().getClass().getClassLoader().getResourceAsStream("application.properties");
        properties.load(inputStream);
        inputStream.close();

        System.setProperties(properties);
    }

}
