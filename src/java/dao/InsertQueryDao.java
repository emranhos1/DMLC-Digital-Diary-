/**
 *
 * @author Md. Emran Hossain
 */
package dao;

import dbConnection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class InsertQueryDao {

    static DBConnection db = new DBConnection();
    static Connection con;
    static ResultSet rs;
    static PreparedStatement pstm;

    public static boolean insertQueryWithOutWhereClause(String tableName, String columnName, String values) throws SQLException {

        con = db.myConn();
        pstm = con.prepareStatement("Insert into " + tableName + "(" + columnName + ") values(" + values + ")");
        pstm.execute();
        pstm.close();
        return true;
    }
}