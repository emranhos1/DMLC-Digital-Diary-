<%-- 
    Document   : endDocument
    Created on : Sep 20, 2017, 5:27:48 PM
    Author     : Md Emran Hossain
--%>

<%@page import="dao.SelectQueryDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>নিস্পত্তিক্রিত চিঠি সমূহ</title>
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
                        <a href="#">চিঠি সমূহ</a>
                    </li>
                    <li class="breadcrumb-item active">নিস্পত্তিক্রিত চিঠি সমূহ</li>
                </ol>
            </div>

            <div id="message">
                <center><h3>${message}<%session.setAttribute("message", null);%></h3></center>
            </div>

            <div class="panel-body col-sm-12">
                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                        <tr>
                            <th>ক্রমিক নং</th>
                            <th>প্রাপ্তির তারিখ</th>
                            <th>শেষ তারিখ</th>
                            <th>প্রেরক</th>
                            <th>স্বারক নাম্বার/সুত্র</th>
                            <th>চিঠি বিষয়</th>
                            <th>স্ক্যান ফাইল</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>ক্রমিক নং</th>
                            <th>প্রাপ্তির তারিখ</th>
                            <th>শেষ তারিখ</th>
                            <th>প্রেরক</th>
                            <th>স্বারক নাম্বার/সুত্র</th>
                            <th>চিঠি বিষয়</th>
                            <th>স্ক্যান ফাইল</th>
                        </tr>
                    </tfoot>
                    <tbody id="tebleRow">

                    </tbody>
                </table>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <%}%> 
        <script>
            setTimeout(function () {
                $('#message').fadeOut('slow');
            }, 2000);

            $(window).on("load", function () {
                $.ajax({
                    type: "POST",
                    url: "../AllEndDocument",
                    success: function (data) {
                        $("#tebleRow").show();
                        $("#tebleRow").html(data);
                        $('#dataTables-example').DataTable({
                            responsive: true
                        });
                    }
                });
            });

            $(document).ready(function () {
                $(".col-sm-12").css("overflow-x", "scroll");
            });
        </script>
    </body>
</html>
