package userBean;

import dao.InsertQueryDao;
import dao.SelectQueryDao;
import dao.UpdateQueryDao;
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

public class ReturnErrorDocument extends HttpServlet {

    private String documentId;
    private String comment;
    private String letterId;
    private String columnName;
    private String tableName;
    private String whereCondition;
    private ResultSet rs;
    private SimpleDateFormat dateFormate;
    private Date date;
    private String forwardingDateTime;
    private String status;
    private String values;
    private boolean addRecDoc;
    private String forwardingId;
    private String columnNameANDcolumnValue;
    private boolean updateRecDocTable;
    private String userId;
    private boolean addComment;
    private int empOrgId;
    private int parentId;
    private String acknowledgedByEmployeeId;
    private String acknowledgedByEmployeeUsername;
    private int forwardedToEmployeeId;
    private String forwardedToEmployeeUsername;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            documentId = new String(request.getParameter("documentId").getBytes("ISO-8859-1"), "UTF-8");
            letterId = new String(request.getParameter("letterId").getBytes("ISO-8859-1"), "UTF-8");
            forwardingId = new String(request.getParameter("forwardingId").getBytes("ISO-8859-1"), "UTF-8");
            comment = new String(request.getParameter("comment").getBytes("ISO-8859-1"), "UTF-8");
            status = "Active";

            HttpSession session = request.getSession();
            userId = session.getAttribute("idUser").toString();

            dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
            date = new Date();
            forwardingDateTime = dateFormate.format(date);

            columnName = " user_name, employee_organogram_id ";
            tableName = " employee ";
            whereCondition = " employee_id = '" + userId + "' ";
            rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
            
            while (rs.next()){
                acknowledgedByEmployeeId = userId;
                acknowledgedByEmployeeUsername = rs.getString("user_name");
                empOrgId = rs.getInt("employee_organogram_id");
            }
            
            columnName = " parent_id ";
            tableName = " employee_organogram ";
            whereCondition = " employee_organogram_id = '" + empOrgId + "' ";
            rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
            
            while (rs.next()){
                parentId = rs.getInt("parent_id");
            }
            
            columnName = " employee_id, user_name ";
            tableName = " employee ";
            whereCondition = " employee_organogram_id = '" + parentId + "' ";
            rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
            
            while (rs.next()){
                forwardedToEmployeeId = rs.getInt("employee_id");
                forwardedToEmployeeUsername = rs.getString("user_name");
            }
            
            tableName = " receives_document ";
            columnName = " forwarding_date_time, forwarded_to_employee_id, acknowledged_by_employee_id, forwarded_to_employee_username, acknowledged_by_employee_username, letter_id, status ";
            values = "'" + forwardingDateTime + "', '" + forwardedToEmployeeId + "', '" + acknowledgedByEmployeeId + "', '" + forwardedToEmployeeUsername + "', '" + acknowledgedByEmployeeUsername + "', '" + letterId + "', '" + status + "'";
            addRecDoc = InsertQueryDao.insertQueryWithOutWhereClause(tableName, columnName, values);

            columnNameANDcolumnValue = " status = 'Inactive' ";
            tableName = " receives_document ";
            whereCondition = " forwarding_id = '" + forwardingId + "'";
            updateRecDocTable = UpdateQueryDao.updateQueryWithWhereClause(tableName, columnNameANDcolumnValue, whereCondition);

            tableName = " comments_on ";
            columnName = " comment, employee_name, date_time, document_id, employee_id ";
            values = "'" + comment + "', '" + acknowledgedByEmployeeUsername + "', '" + forwardingDateTime + "', '" + documentId + "', '" + acknowledgedByEmployeeId + "'";
            addComment = InsertQueryDao.insertQueryWithOutWhereClause(tableName, columnName, values);

            if (addRecDoc) {
                if (updateRecDocTable) {
                    if (addComment) {
                        String sendDocSuccess = "<p class='alert-info'>চিঠিটি সফলভাবে পাঠানো হয়েছে</p>";
                        request.getSession().setAttribute("message", sendDocSuccess);
                        response.sendRedirect("employee/allNewWork.jsp");
                    } else {
                        String sendDocError = "<p class='alert-danger'>চিঠিটি সফলভাবে পাঠানো হয় নি</p>";
                        request.getSession().setAttribute("message", sendDocError);
                        response.sendRedirect("employee/allNewWork.jsp");
                    }
                } else {
                    String sendDocError = "<p class='alert-danger'>চিঠিটি সফলভাবে পাঠানো হয় নি</p>";
                    request.getSession().setAttribute("message", sendDocError);
                    response.sendRedirect("employee/allNewWork.jsp");
                }
            } else {
                String sendDocError = "<p class='alert-danger'>চিঠিটি সফলভাবে পাঠানো হয় নি</p>";
                request.getSession().setAttribute("message", sendDocError);
                response.sendRedirect("employee/allNewWork.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReturnErrorDocument.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}