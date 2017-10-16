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

public class UpdateQueryDao {
    
    static DBConnection db = new DBConnection();
    static Connection con;
    static ResultSet rs;
    static PreparedStatement pstm;
    
    public static boolean updateQueryWithWhereClause(String tableName, String columnNameANDcolumnValue, String whereCondition) throws SQLException {
        
        //Update tableName set columnName = ?, columnName = ? where whereCondition
        con = db.myConn();
        pstm = con.prepareStatement("Update "+tableName+" set "+columnNameANDcolumnValue+" where "+whereCondition);
        pstm.executeUpdate();
        pstm.close();
        return true;
    }
}