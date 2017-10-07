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

public class LoginBean extends HttpServlet {

    private String userName;
    private String userPass;
    private String columnName;
    private String tableName;
    private String whereCondition;
    private ResultSet rs;
    private int userId;
    private String designation;
    private String department;
    private String role;
    private String employeeId;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            employeeId = new String(request.getParameter("username").getBytes("ISO-8859-1"), "UTF-8");
            userPass = new String(request.getParameter("password").getBytes("ISO-8859-1"), "UTF-8");

            System.out.println(employeeId);
            System.out.println(userPass);
            columnName = " * ";
            tableName = " employee_emp_org ";
            whereCondition = " employee_id = '" + employeeId + "' and password = '" + userPass + "' ";;

            rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
            if (rs.next()) {
                userId = rs.getInt("employee_id");
                designation = rs.getString("designation");
                department = rs.getString("department");

                System.out.println(designation);
                System.out.println(department);
                if (department.equals("webadmin") && designation.equals("webadmin")) {
                    role = "webadmin";
                } else if (department.equals("frontdesk") && designation.equals("frontdesk")) {
                    role = "frontdesk";
                } else if (designation.equals("মহাপরিচালক") && department.equals("সকল")) {
                    role = "DG";
                } else {
                    role = "employee";
                }
                switch (role) {
                    case "webadmin": {
                        response.sendRedirect("webAdmin/dashboard.jsp");
                        break;
                    }
                    case "frontdesk": {
                        response.sendRedirect("frontDesk/dashboard.jsp");
                        break;
                    }
                    case "DG": {
                        response.sendRedirect("director_general/dashboard.jsp");
                        break;
                    }
                    case "employee": {
                        response.sendRedirect("employee/dashboard.jsp");
                        break;
                    }
                }
            } else {
                String loginError = "<p class='alert-warning'>username or password Incorrect</p>";
                request.getSession().setAttribute("message", loginError);
                response.sendRedirect("login.jsp");
            }

            HttpSession session = request.getSession();
            session.setAttribute("idUser", userId);

        } catch (SQLException ex) {
            Logger.getLogger(LoginBean.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
