
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author ANNAIENG
 */
public class Utilities {

    public static Connection getConnection() throws SQLException {

        Connection conn = null;
        Properties connectionProps = new Properties();
        connectionProps.put("user", "root");
        connectionProps.put("password", "");


        conn = DriverManager.getConnection(
                "jdbc:" + "mysql" + "://"
                + "localhost"
                + ":" + "3306" + "/db_for_bis_mb",
                connectionProps);

        System.out.println("Connected to database");
        return conn;
    }
}
