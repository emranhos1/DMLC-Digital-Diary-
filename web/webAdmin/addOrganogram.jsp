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
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Web Admin Dashboard</title>
        <!-- Bootstrap core CSS-->
        <link href="../allStyles/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- Custom fonts for this template-->
        <link href="../allStyles/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <!-- Page level plugin CSS-->
        <link href="../allStyles/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css"/>
        <!-- Custom styles for this template-->
        <link href="../allStyles/css/sb-admin.min.css" rel="stylesheet" type="text/css"/>
        <!-- Bootstrap core JavaScript-->
        <script src="../allStyles/vendor/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="../allStyles/vendor/popper/popper.min.js" type="text/javascript"></script>
        <script src="../allStyles/vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Core plugin JavaScript-->
        <script src="../allStyles/vendor/jquery-easing/jquery.easing.min.js" type="text/javascript"></script>
        <!-- Page level plugin JavaScript-->
        <script src="../allStyles/vendor/chart.js/Chart.min.js" type="text/javascript"></script>
        <script src="../allStyles/vendor/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="../allStyles/vendor/datatables/dataTables.bootstrap4.js" type="text/javascript"></script>
        <!-- Custom scripts for all pages-->
        <script src="../allStyles/js/sb-admin.min.js" type="text/javascript"></script>
        <!-- Custom scripts for this page-->
        <script src="../allStyles/js/sb-admin-datatables.min.js" type="text/javascript"></script>
        <script src="../allStyles/js/sb-admin-charts.min.js" type="text/javascript"></script>
    </head>
    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
        <%
            if ((session.getAttribute("idUser") == null) || (session.getAttribute("idUser") == "")) {
                response.sendRedirect("../login.jsp");
            } else {%>
        <%@include file="header.jsp" %>

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

        <%@include file="footer.jsp" %>
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
