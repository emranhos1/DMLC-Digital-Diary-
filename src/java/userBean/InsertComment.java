package userBean;

import dao.InsertQueryDao;
import dao.SelectQueryDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InsertComment extends HttpServlet {
    private String comment;
    private String documentId;
    private String userId;
    private String columnName;
    private String tableName;
    private String whereCondition;
    private ResultSet rs;
    private String userName;
    private SimpleDateFormat dateFormat;
    private Date date;
    private String inputDate;
    private String values;
    private boolean addComment;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            comment = new String(request.getParameter("comment").getBytes("ISO-8859-1"), "UTF-8");
            documentId = new String(request.getParameter("documentId").getBytes("ISO-8859-1"), "UTF-8");
            
            HttpSession session = request.getSession();
            userId = session.getAttribute("idUser").toString();
            
            dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
            date = new Date();
            inputDate = dateFormat.format(date);
            
            columnName = " user_name ";
            tableName = " employee ";
            whereCondition = " employee_id = '" + userId + "'";
            rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
            
            while(rs.next()){
                userName = rs.getString("user_name");
            }
            
            tableName = " comments_on ";
            columnName = " comment, employee_name, date_time, document_id, employee_id ";
            values = "'" + comment + "', '" + userName + "', '" + inputDate + "', '" + documentId + "', '" + userId + "'";
            addComment = InsertQueryDao.insertQueryWithOutWhereClause(tableName, columnName, values);
            
            if(!addComment){
                String addCommentError = "<p class='alert-danger'>চিঠিতে মন্তব্য করা হয়নি</p>";
                request.getSession().setAttribute("message", addCommentError);
                response.sendRedirect("employee/allNewWork.jsp");
            } else{
                String addCommentSuccess = "<p class='alert-info'>চিঠিতে মন্তব্য করা হয়েছে</p>";
                request.getSession().setAttribute("message", addCommentSuccess);
                response.sendRedirect("employee/allNewWork.jsp");
            }            
        } catch (SQLException ex) {
            Logger.getLogger(InsertComment.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}