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

public class SelectQueryDao {

    static DBConnection db = new DBConnection();
    static Connection con;
    static ResultSet rs;
    static PreparedStatement pstm;

    public static ResultSet selectQueryWithOutWhereClause(String columnName, String tableName) throws SQLException {
        //neededColumn :: company_id & whereClause :: company_id = (Select Max(company_id) from company)
        con = db.myConn();
        pstm = con.prepareStatement("Select " + columnName + " from " + tableName);
        rs = pstm.executeQuery();
        return rs;
    }

    public static ResultSet selectQueryWithWhereClause(String columnName, String tableName, String whereCondition) throws SQLException {
        //neededColumn :: company_id & whereClause :: company_id = (Select Max(company_id) from company)
        con = db.myConn();
        pstm = con.prepareStatement("Select " + columnName + " from " + tableName + " where " + whereCondition);
        rs = pstm.executeQuery();
        return rs;
    }
}
