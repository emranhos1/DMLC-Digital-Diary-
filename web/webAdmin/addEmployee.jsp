<%-- 
    Document   : addEmployee
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
        <title>নতুন কর্মচারী</title>
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
                        <a href="#">কর্মচারী</a>
                    </li>
                    <li class="breadcrumb-item active">নতুন কর্মচারী</li>
                </ol>

                <!--add employee part-->
                <div class="container">
                    <div class="card card-register mx-auto mt-5">
                        <div class="card-header">নতুন কর্মচারী যোগ করুন</div>

                        <div id="message">
                            <center><h3>${message}<%session.setAttribute("message", null);%></h3></center>
                        </div>

                        <div class="card-body">
                            <form action="../AddEmployeeBean" accept-charset="UTF-8" method="post" role="form" class="form-horizontal">
                                <div class="form-group">
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <label for="uName">ইউজারনেম</label>
                                            <input class="form-control" name="uName" id="uName" type="text" aria-describedby="nameHelp" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="password">পাসওয়ার্ড</label>
                                            <input class="form-control" name="password" id="password" type="password" aria-describedby="nameHelp" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <label for="fullName">পুরো নাম</label>
                                            <input class="form-control" name="fullName" id="fullName" type="text" aria-describedby="nameHelp" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="address">ঠিকানা</label>
                                            <textarea class="form-control" name="address" id="address" required></textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <label for="cellNo">মোবাইল নম্বর</label>
                                            <input class="form-control" name="cellNo" id="cellNo" type="text" aria-describedby="nameHelp" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="email">ইমেইল</label>
                                            <input type="email" id="email" name="email" class="form-control" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="designation">বিভাগ এবং পদবী</label>
                                    <select class="form-control" name="designation" id="designation" required>
                                        <option value="">নির্বাচন করুন</option>
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

                                    <input type="hidden" id="empOrgId" name="empOrgId" class="form-control" required>
                                    <input type="hidden" id="task" name="task" value="0" class="form-control" required>
                                </div>

                                <div class="form-group">
                                    <label for="status">অবস্থা</label>
                                    <select class="form-control" name="status" id="status" required>
                                        <option value="">নির্বাচন করুন</option>
                                        <option value="1">সক্রিয়</option>
                                        <option value="0">নিষ্ক্রিয়</option>
                                    </select>
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

            $("#designation").change(function () {
                var empOrgId = $(this).val();
                $("#empOrgId").val(empOrgId);
            });

            function getrole(el) {
                console.log(el);
            }
        </script>
    </body>
</html>
