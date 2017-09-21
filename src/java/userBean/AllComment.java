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

public class AllComment extends HttpServlet {
    private int i;
    private String userId;
    private String columnName;
    private String tableName;
    private String whereCondition;
    private ResultSet rs;
    private int dataRow;
    private String[] comments;
    private String[] employee_name;
    private String documentId;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            i = 0;
            
            HttpSession session = request.getSession();
            userId = session.getAttribute("idUser").toString();
            
            documentId = request.getParameter("documentId");
            
            columnName = "*";
            tableName = " letter_comments_on_receives_document ";
            whereCondition = " forwarded_to_employee_id = '" + userId + "' and document_id = '"+documentId+"'";
            rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);

            rs.last();
            dataRow = rs.getRow();
            comments = new String[dataRow];
            employee_name = new String[dataRow];
            rs.beforeFirst();
            while (rs.next()) {
                comments[i] = rs.getString("comment");
                employee_name[i] = rs.getString("employee_name");
                i++;
            }
            
            for (i = 0; i < dataRow; i++) {
                response.setContentType("text/plain");
                response.getWriter().write("<tr>"
                        + "<td>" + (i + 1) + "</td>"
                        + "<td>" + employee_name[i] + "</td>"
                        + "<td>" + comments[i] + "</td>"
                        + "</tr>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AllComment.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}