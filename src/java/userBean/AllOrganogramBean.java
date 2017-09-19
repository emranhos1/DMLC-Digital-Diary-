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

public class AllOrganogramBean extends HttpServlet {

    ResultSet rs;
    private String columnName;
    private String tableName;
    private int i, j, k;
    private int[] empOrgId;
    private String[] designation;
    private String[] department;
    private int[] has_parent;
    private int[] parent_id;
    private String Report;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            i = 0;
            columnName = "*";
            tableName = " employee_organogram ";
            rs = SelectQueryDao.selectQueryWithOutWhereClause(columnName, tableName);

            rs.last();
            int dataRow = rs.getRow();
            empOrgId = new int[dataRow];
            designation = new String[dataRow];
            department = new String[dataRow];
            has_parent = new int[dataRow];
            parent_id = new int[dataRow];
            rs.beforeFirst();
            while (rs.next()) {
                empOrgId[i] = rs.getInt("employee_organogram_id");
                designation[i] = rs.getString("designation");
                department[i] = rs.getString("department");
                has_parent[i] = rs.getInt("has_parent");
                parent_id[i] = rs.getInt("parent_id");
                i++;
            }
            for (j = 0; j < dataRow; j++) {
                for (k = 0; k < dataRow; k++) {
                    if (parent_id[j] == empOrgId[k]) {
                        response.setContentType("text/plain");
                        response.getWriter().write(
                                "<tr>"
                                + "<td>" + (j + 1) + "</td>"
                                + "<td>" + designation[j] + "</td>"
                                + "<td>" + department[j] + "</td>"
                                + "<td>" + designation[k] + "</td>"
                                + "<td>"
                                + "<button class='btn btn-success' id='editButton'>"
                                + "<a data-toggle='modal' data-designation= " + designation[j] + " data-department=" + department[j] + " data-pdesignation=" + designation[k] + " class='open-newEditDialog' href='#editSpce'><b>Edit</b></a>"
                                + "</button>"
                                + "</td>"
                                + "</tr>");
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(AllOrganogramBean.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
