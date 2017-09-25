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

public class AddRecDocForEmp extends HttpServlet {

    private SimpleDateFormat dateFormate;
    private Date date;
    private String userId;
    private String goingToUserId;
    private String letterId;
    private String forwardingId;
    private String status;
    private String columnName;
    private String tableName;
    private String whereCondition;
    private ResultSet selectAcknowledgedUserName;
    private String acknowledgedByEmployeeUserName;
    private ResultSet selectForwardedUserName;
    private String forwardedToEmployeeUsername;
    private String forwardingDateTime;
    private String values;
    private boolean insertReceivesDocumentTable;
    private String columnNameANDcolumnValue;
    private boolean updateRecDocTable;
    private int lastStatus;
    private String currentDate;
    private boolean updateLetterTable;
    private ResultSet selectDocumentId;
    private int documentId;
    private String comment;
    private boolean insertCommentTable;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
            date = new Date();

            HttpSession session = request.getSession();
            userId = session.getAttribute("idUser").toString();

            goingToUserId = new String(request.getParameter("goingTo").getBytes("ISO-8859-1"), "UTF-8");
            lastStatus = Integer.parseInt(request.getParameter("lastStatus"));
            letterId = new String(request.getParameter("letterId").getBytes("ISO-8859-1"), "UTF-8");
            forwardingId = new String(request.getParameter("forwardingId").getBytes("ISO-8859-1"), "UTF-8");
            comment = new String(request.getParameter("comment").getBytes("ISO-8859-1"), "UTF-8");
            status = "Active";

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

            if (lastStatus == 2) {
                tableName = " receives_document ";
                columnName = " forwarding_date_time, forwarded_to_employee_id, acknowledged_by_employee_id, forwarded_to_employee_username, acknowledged_by_employee_username, letter_id, status ";
                values = " '" + forwardingDateTime + "', '" + goingToUserId + "', '" + userId + "', '" + forwardedToEmployeeUsername + "', '" + acknowledgedByEmployeeUserName + "', '" + letterId + "', '" + status + "' ";
                insertReceivesDocumentTable = InsertQueryDao.insertQueryWithOutWhereClause(tableName, columnName, values);

                columnNameANDcolumnValue = " status = 'Inactive' ";
                tableName = " receives_document ";
                whereCondition = " forwarding_id = '" + forwardingId + "'";
                updateRecDocTable = UpdateQueryDao.updateQueryWithWhereClause(tableName, columnNameANDcolumnValue, whereCondition);

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

                if (insertReceivesDocumentTable) {
                    if (updateRecDocTable) {
                        if (updateRecDocTable) {
                            String sendDocSuccess = "<p class='alert-info'>চিঠিটি সফলভাবে পাঠানো হয়েছে</p>";
                            request.getSession().setAttribute("message", sendDocSuccess);
                            response.sendRedirect("employee/allNewWork.jsp");
                        } else {
                            String sendDocError = "<p class='alert-danger'>চিঠিটি সফলভাবে পাঠানো হয় নি</p>";
                            request.getSession().setAttribute("message", sendDocError);
                            response.sendRedirect("employee/allNewWork.jsp");
                        }
                    } else {
                        String sendDocError = "<p class='alert-danger'>চিঠিটি সফলভাবে পাঠানো হয় নি</p>";
                        request.getSession().setAttribute("message", sendDocError);
                        response.sendRedirect("employee/allNewWork.jsp");
                    }
                } else {
                    String sendDocError = "<p class='alert-danger'>চিঠিটি সফলভাবে পাঠানো হয় নি</p>";
                    request.getSession().setAttribute("message", sendDocError);
                    response.sendRedirect("employee/allNewWork.jsp");
                }
            } else if (lastStatus == 3) {

                tableName = "letter";
                columnNameANDcolumnValue = " current_status = '" + lastStatus + "', end_date ='" + currentDate + "' ";
                whereCondition = " letter_id = '" + letterId + "'";
                updateLetterTable = UpdateQueryDao.updateQueryWithWhereClause(tableName, columnNameANDcolumnValue, whereCondition);

                columnNameANDcolumnValue = " status = 'Inactive' ";
                tableName = " receives_document ";
                whereCondition = " forwarding_id = '" + forwardingId + "'";
                updateRecDocTable = UpdateQueryDao.updateQueryWithWhereClause(tableName, columnNameANDcolumnValue, whereCondition);
                if (updateLetterTable) {
                    if (updateLetterTable) {
                        String sendDocSuccess = "<p class='alert-info'>চিঠিটি সফলভাবে নিষ্পন্ন করা হয়েছে</p>";
                        request.getSession().setAttribute("message", sendDocSuccess);
                        response.sendRedirect("employee/allNewWork.jsp");
                    } else {
                        String sendDocError = "<p class='alert-danger'>চিঠিটি সফলভাবে নিষ্পন্ন করা হয়নি</p>";
                        request.getSession().setAttribute("message", sendDocError);
                        response.sendRedirect("employee/allNewWork.jsp");
                    }
                } else {
                    String sendDocError = "<p class='alert-danger'>চিঠিটি সফলভাবে নিষ্পন্ন করা হয়নি</p>";
                    request.getSession().setAttribute("message", sendDocError);
                    response.sendRedirect("employee/allNewWork.jsp");
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(AddRecDocForEmp.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
