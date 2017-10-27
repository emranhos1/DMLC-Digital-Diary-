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

public class AllNewDocument extends HttpServlet {

    private int i;
    private String columnName;
    private String tableName;
    private String whereCondition;
    ResultSet rs;
    private int dataRow;
    private String[] letterId;
    private int[] currentStatus;
    private String[] receivingDate;
    private String[] depOfOrigin;
    private String[] requestId;
    private String[] subjectOfLetter;
    private int[] documentId;
    private String[] shortDesc;
    private String[] scanFile;
    private String status;
    private conRs conrs;
    private Connection con;
    private PreparedStatement pstm;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            i = 0;
            columnName = "*";
            tableName = " letter ";
            whereCondition = " current_status = 1 ";
            conrs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);

            con = conrs.getCon();
            rs = conrs.getRs();
            pstm = conrs.getPstm();
            
            rs.last();
            dataRow = rs.getRow();
            letterId = new String[dataRow];
            currentStatus = new int[dataRow];
            receivingDate = new String[dataRow];
            depOfOrigin = new String[dataRow];
            requestId = new String[dataRow];
            subjectOfLetter = new String[dataRow];
            documentId = new int[dataRow];
            shortDesc = new String[dataRow];
            scanFile = new String[dataRow];
            rs.beforeFirst();
            while (rs.next()) {
                letterId[i] = rs.getString("letter_id");
                currentStatus[i] = rs.getInt("current_status");
                receivingDate[i] = rs.getString("receiving_date");
                depOfOrigin[i] = rs.getString("department_of_origin");
                requestId[i] = rs.getString("request_id");
                subjectOfLetter[i] = rs.getString("subject_of_letter");
                documentId[i] = rs.getInt("document_id");
                shortDesc[i] = rs.getString("short_desc");
                scanFile[i] = rs.getString("scan_file");
                i++;
            }

            for (i = 0; i < dataRow; i++) {
                
                response.setContentType("text/plain");
                response.getWriter().write("<tr>"
                        + "<td>" + (i + 1) + "</td>"
                        + "<td>" + receivingDate[i] + "</td>"
                        + "<td>" + depOfOrigin[i] + "</td>"
                        + "<td>" + requestId[i] + "</td>"
                        + "<td>" + subjectOfLetter[i] + "</td>"
                        + "<td>" + shortDesc[i] + "</td>"
                        + "<td><img src='../Uploaded_file/" + scanFile[i] + "' alt='এই ফাইলটি লোড করা যাচ্ছেনা' height='auto' width='100%'/>"
                        + "<center><button class='btn btn-secondary' type='button' data-dismiss='modal'>"
                        + "<a href= 'http://localhost:8080/DMLC__Digital_Diary_/Uploaded_file/"+scanFile[i]+"' target ='_blank' class='btn btn-primary open-spceLetterDialog'>ডাউনলোড</a>"
                        + "</button></center>"
                        + "</td>"
                        + "<td><button class='btn btn-secondary' type='button' data-dismiss='modal'>"
                        + "<a data-toggle='modal' data-letterid='"+letterId[i]+"' data-status='"+ status +"' data-receivingdate='" + receivingDate[i] + "' data-depoforigin='" + depOfOrigin[i] + "' data-requestid='" + requestId[i] + "' data-subjectofletter='" + subjectOfLetter[i] + "' data-documentid='" + documentId[i] + "' data-shortdesc='" + shortDesc[i] + "' data-scanfile='" + scanFile[i] + "' class='btn btn-primary open-spceLetterDialog' href='#addLetter' >অগ্রাধিকার ঠিক করুন</a>"
                        + "</button>"
                        + "</td>"
                        + "</tr>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AllNewDocument.class.getName()).log(Level.SEVERE, null, ex);
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