package userBean;

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

public class UpdateRecDoc extends HttpServlet {

    private String letterId;
    private String columnName;
    private String tableName;
    private String whereCondition;
    private ResultSet rs;
    private String status;
    private SimpleDateFormat dateFormate;
    private Date date;
    private String acknowledgementDateTime;
    private boolean updateRecDoc;
    private String currentDate;
    private String columnNameANDcolumnValue;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            letterId = request.getParameter("letterId");

            dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
            date = new Date();

            currentDate = dateFormate.format(date);

            columnName = " status, acknowledgement_date_time ";
            tableName = " receives_document ";
            whereCondition = " letter_id = '" + letterId + "'";
            rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);

            while (rs.next()) {
                status = rs.getString("status");
                acknowledgementDateTime = rs.getString("acknowledgement_date_time");
            }

            if (status.equals("Active") && acknowledgementDateTime == null) {
                columnNameANDcolumnValue = " acknowledgement_date_time = '" + currentDate + "'";
                updateRecDoc = UpdateQueryDao.updateQueryWithWhereClause(tableName, columnNameANDcolumnValue, whereCondition);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UpdateRecDoc.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}