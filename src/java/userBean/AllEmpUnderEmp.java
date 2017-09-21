package userBean;

import dao.SelectQueryDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AllEmpUnderEmp extends HttpServlet {
    private String userId;
    private String columnName;
    private String tableName;
    private String whereCondition;
    private ResultSet rs;
    private int empOrgId;
    private int orgRow;
    private int[] employeeId;
    private String[] uName;
    private String[] designation;
    private String[] department;
    private int[] hasParent;
    private int[] parentId;
    private int i;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            i = 0;
            HttpSession session = request.getSession();
            userId = session.getAttribute("idUser").toString();
            
            columnName = " * ";
            tableName = " employee ";
            whereCondition = " employee_id = '" + userId + "'";
            rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
            
            while (rs.next()){
                empOrgId = rs.getInt("employee_organogram_id");
            }
            
            columnName = " * ";
            tableName = " employee_emp_org ";
            whereCondition = " parent_id = '" + empOrgId + "'";
            rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
            
            rs.last();
            orgRow = rs.getRow();
            employeeId = new int[orgRow];
            uName = new String[orgRow];
            designation = new String[orgRow];
            department = new String[orgRow];
            hasParent = new int[orgRow];
            parentId = new int[orgRow];
            rs.beforeFirst();
            while (rs.next()) {
                employeeId[i] = rs.getInt("employee_id");
                uName[i] = rs.getString("user_name");
                designation[i] = rs.getString("designation");
                department[i] = rs.getString("department");
                hasParent[i] = rs.getInt("has_parent");
                parentId[i] = rs.getInt("parent_id");
                i++;
            }
            for (i = 0; i < orgRow; i++) {
                response.setContentType("text/plain");
                response.getWriter().write("<option value='" + employeeId[i] + "'>'" + uName[i] + "' : '" + designation[i] + "' ('" + department[i] + "')</option>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AllEmpUnderEmp.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}