<%-- 
    Document   : allEmployee
    Created on : Sep 19, 2017, 3:37:35 PM
    Author     : Md. Emran Hossain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>সকল কর্মচারী</title>
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
                    <li class="breadcrumb-item active">সকল কর্মচারী</li>
                </ol>

                <!-- Example DataTables -->
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fa fa-table"></i> সকল অর্গানোগ্রাম</div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div id="message">
                                <center><h3>${message}<%session.setAttribute("message", null);%></h3></center>
                            </div>
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>ক্রমিক নং</th>
                                        <th>ইউজারনেম</th>
                                        <th>পুরো নাম</th>
                                        <th>যোগাযোগের তথ্য</th>
                                        <th>বিভাগ</th>
                                        <th>উপাধি</th>
                                        <th>অবস্থা</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>ক্রমিক নং</th>
                                        <th>ইউজারনেম</th>
                                        <th>পুরো নাম</th>
                                        <th>যোগাযোগের তথ্য</th>
                                        <th>বিভাগ</th>
                                        <th>উপাধি</th>
                                        <th>অবস্থা</th>
                                    </tr>
                                </tfoot>
                                <tbody id="tebleRow">
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="../footer.jsp" %>
        <%}%>
        <script>
            $(window).on("load", function () {
                $.ajax({
                    type: "POST",
                    url: "../AllEmployeeBean",
                    success: function (data) {
                        $("#tebleRow").show();
                        $("#tebleRow").html(data);
                        $('#dataTables-example').DataTable({
                            responsive: true
                        });
                    }
                });
            });
        </script>
    </body>
</html>
