/**
 *
 * @author Md. Emran Hossain
 */
package dbConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    Connection con = null;
    static final String url = "jdbc:mysql://localhost:3306/";
    static final String driver = "com.mysql.jdbc.Driver";//it's MySql driver class, make sure MySql JDBC Driver libery add in class path

//    ==============user can chage this vareable value as there need======================
    static final String dbName = "dmlc";//user database name or schema name
    static final String dbUserName = "root";//user database user name 
    static final String dbPassword = "root";//user database password
    static final String unicode = "?useUnicode=yes&characterEncoding=UTF-8";

    public Connection myConn() throws SQLException {

        try {
            Class.forName(driver).newInstance();
            con = DriverManager.getConnection(url + dbName + unicode, dbUserName, dbPassword);
            return con;//it return connection
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
