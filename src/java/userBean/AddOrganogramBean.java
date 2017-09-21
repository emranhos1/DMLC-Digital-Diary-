package userBean;

import dao.InsertQueryDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddOrganogramBean extends HttpServlet {

    private String designation;
    private String depertment;
    private String tableName;
    private String columnName;
    private String values;
    private boolean addOrganogram;
    private String parentId;
    private String hasParent;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            designation = new String(request.getParameter("designation").getBytes("ISO-8859-1"), "UTF-8");
            depertment = new String(request.getParameter("depertment").getBytes("ISO-8859-1"), "UTF-8");
            parentId = new String(request.getParameter("parentId").getBytes("ISO-8859-1"), "UTF-8");
            hasParent = new String(request.getParameter("hasParent").getBytes("ISO-8859-1"), "UTF-8");
            
            tableName = " employee_organogram ";
            columnName = " designation, department, has_parent, parent_id ";
            values = "'" + designation + "'," + "'" + depertment + "',"+ "'" + hasParent + "',"+ "'" + parentId + "'";
            addOrganogram = InsertQueryDao.insertQueryWithOutWhereClause(tableName, columnName, values);

            if (addOrganogram) {
                String addOrgSuccess = "<p class='alert-info'>অর্গানোগ্রাম নিবন্ধিত হয়েছে</p>";
                request.getSession().setAttribute("message", addOrgSuccess);
                response.sendRedirect("webAdmin/addOrganogram.jsp");
            } else {
                String addOrgError = "<p class='alert-danger'>অর্গানোগ্রাম নিবন্ধিত হয়নি</p>";
                request.getSession().setAttribute("message", addOrgError);
                response.sendRedirect("webAdmin/addOrganogram.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddOrganogramBean.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}