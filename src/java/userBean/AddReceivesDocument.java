package userBean;

import dao.*;
import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class AddReceivesDocument extends HttpServlet {

    private SimpleDateFormat dateFormate;
    private Date date;
    private String userId;
    private String goingToUserId;
    private String letterId;
    private String comment;
    private int status;
    private String priority;
    private String columnName;
    private String tableName;
    private String whereCondition;
    private ResultSet selectAcknowledgedUserName;
    private String acknowledgedByEmployeeUserName;
    private ResultSet selectForwardedUserName;
    private String forwardedToEmployeeUsername;
    private String forwardingDateTime;
    private String columnNameANDcolumnValue;
    private boolean updateLetterTable;
    private String values;
    private boolean insertReceivesDocumentTable;
    private ResultSet selectDocumentId;
    private int documentId;
    private boolean insertCommentTable;
    private String endDate;
    private String recivedStatus;
    private String currentDate;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
            date = new Date();

            HttpSession session = request.getSession();
            userId = session.getAttribute("idUser").toString();

            comment = new String(request.getParameter("comment").getBytes("ISO-8859-1"), "UTF-8");
            status = Integer.parseInt(request.getParameter("status"));
            priority = new String(request.getParameter("priority").getBytes("ISO-8859-1"), "UTF-8");
            goingToUserId = new String(request.getParameter("goingTo").getBytes("ISO-8859-1"), "UTF-8");
            letterId = new String(request.getParameter("letterId").getBytes("ISO-8859-1"), "UTF-8");
            endDate = new String(request.getParameter("endDate").getBytes("ISO-8859-1"), "UTF-8");
            recivedStatus = "Active";

            columnName = " user_name ";
            tableName = " employee ";
            whereCondition = " employee_id = '" + userId + "'";

            selectAcknowledgedUserName = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);

            while (selectAcknowledgedUserName.next()) {
                acknowledgedByEmployeeUserName = selectAcknowledgedUserName.getString("user_name");
            }

            columnName = " user_name ";
            tableName = " employee ";
            whereCondition = " employee_id = '" + goingToUserId + "'";

            selectForwardedUserName = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);

            while (selectForwardedUserName.next()) {
                forwardedToEmployeeUsername = selectForwardedUserName.getString("user_name");
            }

            forwardingDateTime = dateFormate.format(date);
            currentDate = dateFormate.format(date);

            if (status == 2) {
                columnNameANDcolumnValue = " current_status = '" + status + "', end_date ='" + endDate + "', priority = '" + priority + "' ";
                tableName = " letter ";
                whereCondition = " letter_id = '" + letterId + "'";
                updateLetterTable = UpdateQueryDao.updateQueryWithWhereClause(tableName, columnNameANDcolumnValue, whereCondition);

                tableName = " receives_document ";
                columnName = " forwarding_date_time, forwarded_to_employee_id, acknowledged_by_employee_id, forwarded_to_employee_username, acknowledged_by_employee_username, letter_id, status ";
                values = " '" + forwardingDateTime + "', '" + goingToUserId + "', '" + userId + "', '" + forwardedToEmployeeUsername + "', '" + acknowledgedByEmployeeUserName + "', '" + letterId + "', '" + recivedStatus + "' ";
                insertReceivesDocumentTable = InsertQueryDao.insertQueryWithOutWhereClause(tableName, columnName, values);

                tableName = " letter ";
                columnName = " document_id ";
                whereCondition = " letter_id = '" + letterId + "'";
                selectDocumentId = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
                while (selectDocumentId.next()) {
                    documentId = selectDocumentId.getInt("document_id");
                }

                tableName = " comments_on ";
                columnName = " comment, employee_name, date_time, document_id, employee_id ";
                values = " '" + comment + "', '" + acknowledgedByEmployeeUserName + "', '" + forwardingDateTime + "', '" + documentId + "', '" + userId + "'";
                insertCommentTable = InsertQueryDao.insertQueryWithOutWhereClause(tableName, columnName, values);

                if (updateLetterTable) {
                    if (insertReceivesDocumentTable) {
                        if (insertCommentTable) {
                            String sendDocSuccess = "<p class='alert-info'>চিঠিটি সফলভাবে পাঠানো হয়েছে</p>";
                            request.getSession().setAttribute("message", sendDocSuccess);
                            response.sendRedirect("director_general/allNewDocument.jsp");
                        } else {
                            String sendDocError = "<p class='alert-danger'>চিঠিটি সফলভাবে পাঠানো হয়নি</p>";
                            request.getSession().setAttribute("message", sendDocError);
                            response.sendRedirect("director_general/allNewDocument.jsp");
                        }
                    } else {
                        String sendDocError = "<p class='alert-danger'>চিঠিটি সফলভাবে পাঠানো হয়নি</p>";
                        request.getSession().setAttribute("message", sendDocError);
                        response.sendRedirect("director_general/allNewDocument.jsp");
                    }
                } else {
                    String sendDocError = "<p class='alert-danger'>চিঠিটি সফলভাবে পাঠানো হয়নি</p>";
                    request.getSession().setAttribute("message", sendDocError);
                    response.sendRedirect("director_general/allNewDocument.jsp");
                }
            } else {
                columnNameANDcolumnValue = " current_status = '" + status + "', end_date ='" + currentDate + "' ";
                tableName = " letter ";
                whereCondition = " letter_id = '" + letterId + "'";
                updateLetterTable = UpdateQueryDao.updateQueryWithWhereClause(tableName, columnNameANDcolumnValue, whereCondition);
                if (updateLetterTable) {
                    String sendDocSuccess = "<p class='alert-info'>চিঠিটি সফলভাবে নিষ্পন্ন করা হয়েছে</p>";
                    request.getSession().setAttribute("message", sendDocSuccess);
                    response.sendRedirect("director_general/allNewDocument.jsp");
                } else {
                    String sendDocError = "<p class='alert-info'>চিঠিটি সফলভাবে নিষ্পন্ন করা হয়নি</p>";
                    request.getSession().setAttribute("message", sendDocError);
                    response.sendRedirect("director_general/allNewDocument.jsp");
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(AddReceivesDocument.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
