<%-- 
    Document   : allOrganogram
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
                                        <th>উপাধি</th>
                                        <th>বিভাগ</th>
                                        <th>ঊর্ধ্বতন কর্মকর্তা</th>
                                        <th>নির্বাচন করুন</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>ক্রমিক নং</th>
                                        <th>উপাধি</th>
                                        <th>বিভাগ</th>
                                        <th>ঊর্ধ্বতন কর্মকর্তা</th>
                                        <th>নির্বাচন করুন</th>
                                    </tr>
                                </tfoot>
                                <tbody id="tebleRow">
                                    <tr>
                                        <td>1</td>
                                        <td>মহাপরিচালক</td>
                                        <td>প্রশাসন</td>
                                        <td>না</td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="footer.jsp" %>

        <!--Organogram Edit Dialog-->
        <div class="modal fade" id="editSpce" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">অর্গানোগ্রাম</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    
                    <div class="modal-body card card-register mx-auto">
                        <div class="card-header">অর্গানোগ্রাম পরিবর্তন করুন</div>
                        <div class="card-body">
                            <form action="" accept-charset="UTF-8" method="" role="form" class="form-horizontal">
                                <div class="form-group form-row">
                                        <div class="col-md-6">
                                            <label for="designation">উপাধি</label>
                                            <input class="form-control" name="designation" id="designation" type="text" aria-describedby="nameHelp">
                                        </div>
                                        <div class="col-md-6">
                                            <label for="department">বিভাগ</label>
                                            <input class="form-control" name="department" id="department" type="text" aria-describedby="nameHelp">
                                        </div>
                                </div>
                                <div class="form-group form-row">
                                    <div class="col-md-6">
                                        <label for="pdesignation">ঊর্ধ্বতন পদ</label>
                                        <input class="form-control" name="pdesignation" id="pdesignation" type="text" aria-describedby="nameHelp">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <button type="submit" class="btn btn-primary btn-block" disabled>দাখিল করুন</button>
                                    </div>
                                    <div class="col-md-6">
                                        <button type="reset" class="btn btn-default" disabled>পুনরায় বসান</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%}%>
        <script>
            $(document).ready(function () {
                $.ajax({
                    type: "POST",
                    url: "../AllOrganogramBean",
                    success: function (data) {
                        $("#tebleRow").show();
                        $("#tebleRow").append(data);

                        $('#dataTables-example').DataTable({
                            responsive: true
                        });
                    }
                });
            });

            $(document).on("click", ".open-newEditDialog", function () {

                var designation = $(this).data('designation');
                var department = $(this).data('department');
                var pdesignation = $(this).data('pdesignation');
                console.log(designation);
                console.log(department);
                console.log(pdesignation);

                $(".modal-body #designation").val(designation);
                $(".modal-body #department").val(department);
                $(".modal-body #pdesignation").val(pdesignation);
            });

        </script>
    </body>
</html>
