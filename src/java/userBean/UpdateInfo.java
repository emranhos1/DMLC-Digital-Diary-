package userBean;

import dao.UpdateQueryDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateInfo extends HttpServlet {

    private String fullName;
    private String contactInfo;
    private String contactCell;
    private String contactEmail;
    private String password;
    private String columnNameANDcolumnValue;
    private String tableName;
    private String whereCondition;
    private boolean updateInfo;
    private String userId;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();
            userId = session.getAttribute("idUser").toString();

            fullName = new String(request.getParameter("fullName").getBytes("ISO-8859-1"), "UTF-8");
            contactInfo = new String(request.getParameter("contactInfo").getBytes("ISO-8859-1"), "UTF-8");
            contactCell = new String(request.getParameter("contactCell").getBytes("ISO-8859-1"), "UTF-8");
            contactEmail = new String(request.getParameter("contactEmail").getBytes("ISO-8859-1"), "UTF-8");
            password = new String(request.getParameter("password").getBytes("ISO-8859-1"), "UTF-8");

            columnNameANDcolumnValue = " password = '" + password + "', full_name = '" + fullName + "', contact_info = '" + contactInfo + "', contact_cell = '" + contactCell + "', contact_email = '" + contactEmail + "' ";
            tableName = " employee ";
            whereCondition = " employee_id = '" + userId + "' ";
            updateInfo = UpdateQueryDao.updateQueryWithWhereClause(tableName, columnNameANDcolumnValue, whereCondition);

            if (updateInfo) {
                String sendDocSuccess = "<p class='alert-info'>প্রোফাইল সফলভাবে আপডেট করা হয়েছে</p>";
                request.getSession().setAttribute("message", sendDocSuccess);
                response.sendRedirect("director_general/userProfile.jsp");
            } else {
                String sendDocError = "<p class='alert-danger'>প্রোফাইল সফলভাবে আপডেট করা হয় নি</p>";
                request.getSession().setAttribute("message", sendDocError);
                response.sendRedirect("director_general/userProfile.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UpdateInfo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
