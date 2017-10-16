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

public class AllNewWorkEmp extends HttpServlet {

    private int i;
    private String userId;
    private String columnName;
    private String tableName;
    private String whereCondition;
    private ResultSet rs;
    private int dataRow;
    private int[] currentStatus;
    private String[] depOfOrigin;
    private String[] requestId;
    private String[] subjectOfLetter;
    private String[] endDate;
    private String[] shortDesc;
    private String[] scanFile;
    private int[] priority;
    private String prioritys;
    private int[] documentId;
    private int[] letterId;
    private int[] forwardingId;
    private String[] acknowledgedByEmployeeUsername;
    private String[] forwardedToEmployeeUsername;
    private int[] forwardedToEmployeeId;
    private int[] acknowledgedByEmployeeId;
    private String[] receivingDate;
    private conRs conrs;
    private Connection con;
    private PreparedStatement pstm;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            i = 0;

            HttpSession session = request.getSession();
            userId = session.getAttribute("idUser").toString();

            columnName = " * ";
            tableName = " letter_receives_document ";
            whereCondition = " forwarded_to_employee_id = '" + userId + "' and status = 'Active' ";
            conrs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);

            con = conrs.getCon();
            rs = conrs.getRs();
            pstm = conrs.getPstm();
            
            rs.last();
            dataRow = rs.getRow();
            letterId = new int[dataRow];
            receivingDate = new String[dataRow];
            documentId = new int[dataRow];
            currentStatus = new int[dataRow];
            depOfOrigin = new String[dataRow];
            requestId = new String[dataRow];
            subjectOfLetter = new String[dataRow];
            endDate = new String[dataRow];
            shortDesc = new String[dataRow];
            scanFile = new String[dataRow];
            priority = new int[dataRow];
            forwardingId = new int[dataRow];
            forwardedToEmployeeUsername = new String[dataRow];
            acknowledgedByEmployeeUsername = new String[dataRow];
            forwardedToEmployeeId = new int[dataRow];
            acknowledgedByEmployeeId = new int[dataRow];
            rs.beforeFirst();
            while (rs.next()) {
                letterId[i] = rs.getInt("letter_id");
                receivingDate[i] = rs.getString("receiving_date");
                documentId[i] = rs.getInt("document_id");
                currentStatus[i] = rs.getInt("current_status");
                depOfOrigin[i] = rs.getString("department_of_origin");
                requestId[i] = rs.getString("request_id");
                subjectOfLetter[i] = rs.getString("subject_of_letter");
                endDate[i] = rs.getString("end_date");
                shortDesc[i] = rs.getString("short_desc");
                scanFile[i] = rs.getString("scan_file");
                priority[i] = rs.getInt("priority");
                forwardingId[i] = rs.getInt("forwarding_id");
                forwardedToEmployeeUsername[i] = rs.getString("forwarded_to_employee_username");
                acknowledgedByEmployeeUsername[i] = rs.getString("acknowledged_by_employee_username");
                forwardedToEmployeeId[i] = rs.getInt("forwarded_to_employee_id");
                acknowledgedByEmployeeId[i] = rs.getInt("acknowledged_by_employee_id");
                i++;
            }
            
            for (i = 0; i < dataRow; i++) {
                if (priority[i] == 1) {
                    prioritys = "জরুরী";
                } else if (priority[i] == 2) {
                    prioritys = "সাধারণ";
                }

                response.setContentType("text/plain");
                response.getWriter().write("<tr>"
                        + "<td>" + (i + 1) + "<input data-letterid ="+i+" type='hidden' id='letterId"+i+"' name='letterId' class='form-control' value='" + letterId[i] + "'/></td>"
                        + "<td>" + receivingDate[i] + "<input type='hidden' id='docId' value='"+documentId[i]+"'/></td>"
                        + "<td>" + depOfOrigin[i] + "</td>"
                        + "<td>" + requestId[i] + "</td>"
                        + "<td>" + subjectOfLetter[i] + "</td>"
                        + "<td>" + endDate[i] + "<input data-enddate ="+i+" type='hidden' id='endDate"+i+"' name='letterId' class='form-control' value='" + endDate[i] + "'/></td>"
                        + "<td>" + shortDesc[i] + "</td>"
                        + "<td>" + prioritys + "</td>"
                        + "<td><img src='../Uploaded_file/" + scanFile[i] + "' alt='এই ফাইলটি লোড করা যাচ্ছেনা' height='100px' width='100px'/></td>"
                        + "<td>"
                        + "<button class='btn btn-secondary' type='button' data-dismiss='modal'>"
                        + "<a data-toggle='modal' data-documentid='" + documentId[i] + "' data-scanfile='" + scanFile[i] + "' class='btn btn-primary open-spceDialog-comment' href='#addSpecComment' >মন্তব্য করুন</a>"
                        + "</button>        "
                        + "<button class='btn btn-secondary' type='button' data-dismiss='modal'>"
                        + "<a data-toggle='modal' data-forwardingid='" + forwardingId[i] + "' data-letterid='" + letterId[i] + "' data-documentid='" + documentId[i] + "' data-currentstatus='" + currentStatus[i] + "' data-depoforigin='" + depOfOrigin[i] + "' data-requestid='" + requestId[i] + "' data-subjectofletter='" + subjectOfLetter[i] + "' data-enddate='" + endDate[i] + "' data-shortdesc='" + shortDesc[i] + "' data-prioritys='" + prioritys + "' data-scanfile='" + scanFile[i] + "' class='btn btn-primary open-spceDialog' href='#addSpec' >পরবর্তী ধাপে পাঠান</a>"
                        + "</button>        "
                        + "<button class='btn btn-secondary' type='button' data-dismiss='modal'>"
                        + "<a data-toggle='modal' data-letterid='"+letterId[i]+"' data-forwardingid='" + forwardingId[i] + "' data-forwardedtoemployeeusername='"+forwardedToEmployeeUsername[i]+"' data-acknowledgedbyemployeeusername='"+acknowledgedByEmployeeUsername[i]+"' data-forwardedtoemployeeid='"+forwardedToEmployeeId[i]+"' data-acknowledgedbyemployeeid='"+acknowledgedByEmployeeId[i]+"' data-documentid='" + documentId[i] + "' data-scanfile='" + scanFile[i] + "' class='btn btn-primary open-spceDialog-return' href='#addSpecReturn' >ফেরত পাঠান</a>"
                        + "</button>"
                        + "</td>"
                        + "</tr>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AllNewWorkEmp.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                pstm.close();
                rs.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(LoginBean.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}