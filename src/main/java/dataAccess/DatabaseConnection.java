package dataAccess;

import oracle.jdbc.pool.OracleDataSource;
import ui.Main;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Objects;
import java.util.Properties;

/**
 * The type Database connection.
 */
public class DatabaseConnection {

    /**
     * The constant CONNECTION_SUCCESS.
     */
    public static final int CONNECTION_SUCCESS = 1;
    /**
     * The constant CONNECTION_FAILURE.
     */
    public static final int CONNECTION_FAILURE = -1;
    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521/xe";
    private static final String USERNAME = "loc";
    private static final String PASSWORD = "basedados";

    private static DatabaseConnection instance;
    private OracleDataSource oracleDataSource;
    private Connection connection;
    private SQLException error;

    /**
     * Instantiates a new Database connection.
     *
     * @throws SQLException the sql exception
     */
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

    /**
     * Gets connection.
     *
     * @return the connection
     */
    public Connection getConnection() {
        if (Objects.isNull(connection)) {
            throw new RuntimeException("Connection does not exit");
        }
        return connection;
    }

    /**
     * Test connection int.
     *
     * @return the int
     */
    public int testConnection(){
        if (Objects.isNull(connection)) {
            return CONNECTION_FAILURE;
        }
        return CONNECTION_SUCCESS;
    }

    /**
     * Close connection.
     *
     * @throws SQLException the sql exception
     */
    public void closeConnection() throws SQLException {
        if(!connection.isClosed())
            connection.close();
    }

    /**
     * Url string.
     *
     * @return the string
     */
    public String url() {
        return System.getProperty("database.url");
    }

    /**
     * User string.
     *
     * @return the string
     */
    public String user() {
        return System.getProperty("database.user");
    }

    /**
     * Password string.
     *
     * @return the string
     */
    public String password() {
        return System.getProperty("database.password");
    }

    /**
     * Gets instance.
     *
     * @return the instance
     * @throws SQLException the sql exception
     */
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
