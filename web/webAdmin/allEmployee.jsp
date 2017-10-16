<%-- 
    Document   : allEmployee
    Created on : Sep 19, 2017, 3:37:35 PM
    Author     : Md. Emran Hossain
--%>

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
                    <li class="breadcrumb-item active">সকল অর্গানোগ্রাম</li>
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
        
        <%@include file="footer.jsp" %>
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
