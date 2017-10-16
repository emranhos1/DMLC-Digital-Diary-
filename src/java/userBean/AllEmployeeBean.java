package userBean;

import dao.SelectQueryDao;
import dbConnection.conRs;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AllEmployeeBean extends HttpServlet {

    private int i;
    private String columnName;
    private String tableName;
    private String whereCondition;
    private ResultSet rs;
    private int dataRow;
    private String[] userName;
    private String[] fullName;
    private String[] contactInfo;
    private String[] contactCell;
    private String[] contactEmail;
    private int[] numCompleatedTask;
    private int[] isActive;
    private int[] empOrgId;
    private String Report;
    private String[] department;
    private String[] designation;
    private conRs conrs;
    private Connection con;
    private PreparedStatement pstm;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            i = 0;
            columnName = "*";
            tableName = " employee_emp_org ";
            whereCondition = " user_name != 'null' ";
            conrs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);

            con = conrs.getCon();
            rs = conrs.getRs();
            pstm = conrs.getPstm();
            
            rs.last();
            dataRow = rs.getRow();
            userName = new String[dataRow];
            fullName = new String[dataRow];
            contactInfo = new String[dataRow];
            contactCell = new String[dataRow];
            contactEmail = new String[dataRow];
            numCompleatedTask = new int[dataRow];
            isActive = new int[dataRow];
            empOrgId = new int[dataRow];
            department = new String[dataRow];
            designation = new String[dataRow];
            rs.beforeFirst();
            while (rs.next()) {
                userName[i] = rs.getString("user_name");
                fullName[i] = rs.getString("full_name");
                contactInfo[i] = rs.getString("contact_info");
                contactCell[i] = rs.getString("contact_cell");
                contactEmail[i] = rs.getString("contact_email");
                numCompleatedTask[i] = rs.getInt("num_compleated_task");
                isActive[i] = rs.getInt("is_active");
                empOrgId[i] = rs.getInt("employee_organogram_id");
                department[i] = rs.getString("department");
                designation[i] = rs.getString("designation");
                i++;
            }
            
            for (i = 0; i < dataRow; i++) {
                if(isActive[i] < 1){
                    Report = "Inactive";
                } else{
                    Report = "Active";
                }
                response.setContentType("text/plain");
                response.getWriter().write("<tr>"
                        + "<td>" + (i + 1) + "</td><td>" + userName[i] + "</td><td>" + fullName[i] + "</td><td> Address : " + contactInfo[i]+"<br/> Cell No : "+contactCell[i] +"<br/> Email : "+ contactEmail[i] + "</td><td>" + department[i] + "</td><td>"+ designation[i] +"</td><td>"+ Report +"</td>"
                        + "</tr>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AllEmployeeBean.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstm.close();
                rs.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(LoginBean.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}