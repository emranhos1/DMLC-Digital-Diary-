<%-- 
    Document   : addOrganogram
    Created on : Sep 19, 2017, 1:40:41 PM
    Author     : Md Emran Hossain
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbConnection.conRs"%>
<%@page import="dao.SelectQueryDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>নতুন অর্গানোগ্রাম</title>
        <%@include file="../header.jsp" %>
    </head>
    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
        <%
            if ((session.getAttribute("idUser") == null) || (session.getAttribute("idUser") == "")) {
                response.sendRedirect("../login.jsp");
            } else {%>
        
            <%@include file="navbar.jsp" %>
            
        <!--Body Part-->
        <div class="content-wrapper">
            <div class="container-fluid">
                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="#">অর্গানোগ্রাম</a>
                    </li>
                    <li class="breadcrumb-item active">নতুন অর্গানোগ্রাম</li>
                </ol>

                <!--add organogram part-->
                <div class="container">
                    <div class="card card-register mx-auto mt-5">
                        <div class="card-header">নতুন অর্গানোগ্রাম সৃষ্টি করুন</div>

                        <div id="message">
                            <center><h3>${message}<%session.setAttribute("message", null);%></h3></center>
                        </div>

                        <div class="card-body">
                            <form action="../AddOrganogramBean" accept-charset="UTF-8" method="post" role="form" class="form-horizontal">
                                <div class="form-group">
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <label for="depertment">বিভাগ</label>
                                            <input class="form-control" name="depertment" id="depertment" type="text" aria-describedby="nameHelp" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="designation">উপাধি</label>
                                            <input class="form-control" name="designation" id="designation" type="text" aria-describedby="nameHelp" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="exampleMainDepartment">বিভাগ</label>
                                    <select class="form-control" name="exampleMainDepartment" id="exampleMainDepartment" required>
                                        <option value="0">নির্বাচন করুন</option>
                                        <%
                                            int i = 0;
                                            ResultSet rs;
                                            conRs conrs;
                                            Connection con;
                                            PreparedStatement pstm;
                                            String columnName = "*";
                                            String tableName = "employee_organogram";
                                            conrs = SelectQueryDao.selectQueryWithOutWhereClause(columnName, tableName);
                                            con = conrs.getCon();
                                            rs = conrs.getRs();
                                            pstm = conrs.getPstm();

                                            rs.last();
                                            int orgRow = rs.getRow();
                                            int[] empOrgId = new int[orgRow];
                                            String[] designation = new String[orgRow];
                                            String[] department = new String[orgRow];
                                            int[] hasParent = new int[orgRow];
                                            int[] parentId = new int[orgRow];
                                            rs.beforeFirst();
                                            while (rs.next()) {
                                                empOrgId[i] = rs.getInt("employee_organogram_id");
                                                designation[i] = rs.getString("designation");
                                                department[i] = rs.getString("department");
                                                hasParent[i] = rs.getInt("has_parent");
                                                parentId[i] = rs.getInt("parent_id");
                                                i++;
                                            }
                                            for (i = 0; i < orgRow; i++) {
                                        %>
                                        <option value="<%=empOrgId[i]%>"><%=designation[i]%> (<%=department[i]%>)</option>
                                        <%
                                            }
                                            pstm.close();
                                            rs.close();
                                            con.close();
                                        %>
                                    </select>
                                    <div id="suggesstion-box"></div>
                                    <input type="hidden" id="parentId" name="parentId" value="">
                                    <input type="hidden" id="hasParent" name="hasParent" value="0">
                                </div>

                                <div class="form-row">
                                    <div class="col-md-6">
                                        <button type="submit" class="btn btn-primary btn-block">দাখিল করুন</button>
                                    </div>
                                    <div class="col-md-6">
                                        <button type="reset" class="btn btn-default">পুনরায় বসান</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="../footer.jsp" %>
        <%}%>     

        <script type="text/javascript">

            setTimeout(function () {
                $('#message').fadeOut('fast');
            }, 2000);

            $("#exampleMainDepartment").change(function () {
                var empOrgId = $(this).val();
                $("#parentId").val(empOrgId);
                if (empOrgId > 0) {
                    $("#hasParent").val(1);
                } else {
                    $("#hasParent").val(0);
                }
            });
        </script>
    </body>
</html>
