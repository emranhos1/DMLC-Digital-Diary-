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
import javax.servlet.http.HttpSession;

public class AllEmpUnderEmp extends HttpServlet {
    private String userId;
    private String columnName;
    private String tableName;
    private String whereCondition;
    private int empOrgId;
    private int orgRow;
    private int[] employeeId;
    private String[] uName;
    private String[] designation;
    private String[] department;
    private int[] hasParent;
    private int[] parentId;
    private int i;
    private conRs conrs1, conrs2;
    private Connection con1, con2;
    private ResultSet rs1, rs2;
    private PreparedStatement pstm1, pstm2;

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
            conrs1 = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
            
            con1 = conrs1.getCon();
            rs1 = conrs1.getRs();
            pstm1 = conrs1.getPstm();
            
            while (rs1.next()){
                empOrgId = rs1.getInt("employee_organogram_id");
            }
            
            columnName = " * ";
            tableName = " employee_emp_org ";
            whereCondition = " parent_id = '" + empOrgId + "'";
            conrs2 = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
            
            con2 = conrs2.getCon();
            rs2 = conrs2.getRs();
            pstm2 = conrs2.getPstm();
            
            rs2.last();
            orgRow = rs2.getRow();
            employeeId = new int[orgRow];
            uName = new String[orgRow];
            designation = new String[orgRow];
            department = new String[orgRow];
            hasParent = new int[orgRow];
            parentId = new int[orgRow];
            rs2.beforeFirst();
            while (rs2.next()) {
                employeeId[i] = rs2.getInt("employee_id");
                uName[i] = rs2.getString("user_name");
                designation[i] = rs2.getString("designation");
                department[i] = rs2.getString("department");
                hasParent[i] = rs2.getInt("has_parent");
                parentId[i] = rs2.getInt("parent_id");
                i++;
            }
            for (i = 0; i < orgRow; i++) {
                response.setContentType("text/plain");
                response.getWriter().write("<option value='" + employeeId[i] + "'>'" + uName[i] + "' : '" + designation[i] + "' ('" + department[i] + "')</option>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AllEmpUnderEmp.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstm1.close();
                pstm2.close();
                rs1.close();
                rs2.close();
                con1.close();
                con2.close();
            } catch (SQLException ex) {
                Logger.getLogger(LoginBean.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}