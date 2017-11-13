<%-- 
    Document   : login
    Created on : Sep 19, 2017, 11:15:28 AM
    Author     : Md. Emran Hossain
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbConnection.conRs"%>
<%@page import="dao.SelectQueryDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>DLMC প্রবেশ</title>
        <%@include file="header.jsp" %>
    </head>

    <body class="bg-dark">
        <div class="container">
            <div class="card card-login mx-auto mt-5">
                <div>
                    <center>
                        <div class="top-logo">
                            <div>
                                <center><img class="img img-responsive" src="Image/alogo.png" alt=""/></center>
                            </div>
                        </div>
                    </center>
                </div>

                <center>
                    <div class="card-header">প্রবেশ করুন</div>
                    <div id="message">
                        <center><h3>${message}<%session.setAttribute("message", null);%></h3></center>
                    </div>
                </center>
                <div class="card-body">
                    <form role="form" role="form" action="LoginBean" method="post" class="form-horizontal">
                        <fieldset>
                            <div class="form-group">
                                <label for="username" class="control-label">উপাধি (বিভাগ)</label>
                                <select class="form-control" name="username" id="username" required>
                                    <option value="">কর্মচারী নির্বাচন করুন</option>
                                    <%
                                        int i = 0;
                                        ResultSet rs;
                                        conRs conrs;
                                        Connection con;
                                        PreparedStatement pstm;
                                        String columnName = " * ";
                                        String tableName = " employee_emp_org ";

                                        conrs = SelectQueryDao.selectQueryWithOutWhereClause(columnName, tableName);
                                        con = conrs.getCon();
                                        rs = conrs.getRs();
                                        pstm = conrs.getPstm();

                                        rs.last();
                                        int orgRow = rs.getRow();
                                        int[] employeeId = new int[orgRow];
                                        int[] empOrgId = new int[orgRow];
                                        String[] uName = new String[orgRow];
                                        String[] designation = new String[orgRow];
                                        String[] department = new String[orgRow];

                                        rs.beforeFirst();

                                        while (rs.next()) {
                                            employeeId[i] = rs.getInt("employee_id");
                                            uName[i] = rs.getString("user_name");
                                            empOrgId[i] = rs.getInt("employee_organogram_id");
                                            designation[i] = rs.getString("designation");
                                            department[i] = rs.getString("department");
                                            i++;
                                        }
                                        for (i = 0; i < orgRow; i++) {
                                    %>
                                    <option value="<%=employeeId[i]%>"><%=designation[i]%> (<%=department[i]%>)</option>
                                    <%
                                        }
                                        pstm.close();
                                        rs.close();
                                        con.close();
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="password" class="control-label">পাসওয়ার্ড</label>
                                <input class="form-control" placeholder="Password" name="password" type="password" value="" required>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                </label>
                            </div>
                        </fieldset>
                        <div>
                            <input type="submit" value="Login" class="btn btn-primary btn-block"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <script type="text/javascript">
            setTimeout(function () {
                $('#message').fadeOut('fast');
            }, 2000);
        </script>
    </body>
</html>

