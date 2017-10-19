<%-- 
    Document   : allNewWork
    Created on : Sep 21, 2017, 11:03:16 AM
    Author     : Md Emran Hossain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>নতুন চিঠি সমূহ</title>
        <!-- Bootstrap core CSS-->
        <link href="../allStyles/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- Custom fonts for this template-->
        <link href="../allStyles/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <!-- Page level plugin CSS-->
        <link href="../allStyles/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css"/>
        <!-- Custom styles for this template-->
        <!--<link href="../allStyles/css/sb-admin.min.css" rel="stylesheet" type="text/css"/>-->
        <link href="../allStyles/css/sb-admin.css" rel="stylesheet" type="text/css"/>
        <!-- Bootstrap core JavaScript-->
        <script src="../allStyles/vendor/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="../allStyles/vendor/popper/popper.min.js" type="text/javascript"></script>
        <script src="../allStyles/vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Core plugin JavaScript-->
        <script src="../allStyles/vendor/jquery-easing/jquery.easing.min.js" type="text/javascript"></script>
        <!-- Page level plugin JavaScript-->

        <script src="../allStyles/vendor/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="../allStyles/vendor/datatables/dataTables.bootstrap4.js" type="text/javascript"></script>
        <!-- Custom scripts for all pages-->
        <script src="../allStyles/js/sb-admin.min.js" type="text/javascript"></script>
        <!-- Custom scripts for this page-->
        <script src="../allStyles/js/sb-admin-datatables.min.js" type="text/javascript"></script>

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
                    <li class="breadcrumb-item active">নতুন চিঠি সমূহ</li>
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
                            <th>প্রেরক</th>
                            <th>স্বারক নাম্বার/সুত্র</th>
                            <th>চিঠি বিষয়</th>
                            <th>নিস্পত্তির সম্ভাব্য তারিখ</th>
                            <th>ছোট বিবরণ</th>
                            <th>অগ্রাধিকার</th>
                            <th>স্ক্যান ফাইল</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>ক্রমিক নং</th>
                            <th>প্রেরক</th>
                            <th>স্বারক নাম্বার/সুত্র</th>
                            <th>চিঠি বিষয়</th>
                            <th>নিস্পত্তির সম্ভাব্য তারিখ</th>
                            <th>ছোট বিবরণ</th>
                            <th>অগ্রাধিকার</th>
                            <th>স্ক্যান ফাইল</th>
                            <th></th>
                        </tr>
                    </tfoot>
                    <tbody id="tableRow">

                    </tbody>
                </table>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        
        <!--Specification Dialog for comment-->
        <div class="modal fade" id="addSpecComment" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">মন্তব্য</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body card card-register mx-auto">
                        <div class="card-header">মন্তব্য করুন</div>
                        <div class="card-body">
                            <form action="../InsertComment" accept-charset="UTF-8" method="post" role="form" class="form-horizontal">
                                <div class="form-group">
                                    <label for="scanFile" class="control-label">স্ক্যান ফাইল</label>
                                    <img id="scanFile" alt="এই ফাইলটি লোড করা যাচ্ছেনা" height="auto" width="100%"/>
                                </div>
                                <div class="form-group">
                                    <label for="comment" class="control-label">আপনার মন্তব্য দিন</label>
                                    <div class="control-label">
                                        <textarea id="comment" name="comment" class="form-control" required></textarea>
                                    </div>
                                </div>
                                <input  type="hidden" id="documentId" name="documentId" class="form-control" value=""/>
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <button type="submit" class="btn btn-primary btn-block">মন্তব্য দাখিল করুন</button>
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

        <!--Specification Dialog-->
        <div class="modal fade" id="addSpec" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">পরবর্তী ধাপ</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body card card-register mx-auto">
                        <div class="card-header">পাঠান/নিষ্পন্ন করুণ</div>
                        <div class="card-body">
                            <form action="../AddRecDocForEmp" accept-charset="UTF-8" method="post" role="form" class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <img id="scanFile" alt="এই ফাইলটি লোড করা যাচ্ছেনা" height="100%" width="100%"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="subjectOfLetter" class="col-sm-4 control-label">পত্রের বিষয়</label>
                                    <div class="">
                                        <input  type="text" id="subjectOfLetter" name="subjectOfLetter" class="form-control" value="" readonly/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="depOfOrigin" class="col-sm-4 control-label">মূল বিভাগ়</label>
                                    <div class="">
                                        <input  type="text" id="depOfOrigin" name="depOfOrigin" class="form-control" value="" readonly/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="endDate" class="control-label">নিস্পত্তির সম্ভাব্য তারিখ</label>
                                    <div class="">
                                        <input  type="text" id="endDate" name="endDate" class="form-control" value="" readonly/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="shortDesc" class="col-sm-4 control-label">ছোট বিবরণ়</label>
                                    <div class="">
                                        <input  type="text" id="shortDesc" name="shortDesc" class="form-control" value="" readonly/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example-spce">
                                        <thead>
                                            <tr>
                                                <th>ক্রমিক নং</th>
                                                <th>যারা মন্তব্য করেছেন</th>
                                                <th>মন্তব্য</th>
                                            </tr>
                                        </thead>
                                        <tbody id="spceTebleRow">

                                        </tbody>
                                    </table>
                                </div>

                                <div class="form-group">
                                    <label for="lastStatus" class="control-label">শেষ অবস্থা</label>
                                    <div class="">
                                        <select class="form-control" name="lastStatus" id="lastStatus" required>
                                            <option value="">নির্বাচন করুন</option>
                                            <option value="2">চলমান থাকবে</option>
                                            <option value="3">নিষ্পন্ন করা হল</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group pg" style="display: none">
                                    <label for="goingTo" class="control-label">যাকে পাঠাতে চান</label>
                                    <div class="">
                                        <select class="form-control req-active" name="goingTo" id="goingTo">
                                            <option value="">কর্মচারী নির্বাচন করুন</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="comment" class="col-sm-4 control-label">আপনার মন্তব্য</label>
                                    <textarea id="comment" name="comment" class="form-control" value="" required></textarea>
                                </div>
                                <input  type="hidden" id="documentId" name="documentId" class="form-control" required/>
                                <input  type="hidden" id="letterId" name="letterId" class="form-control" required/>
                                <input  type="hidden" id="forwardingId" name="forwardingId" class="form-control" required/>
                                <div class="form-row">
                                    <div class="col-md-6">
                                        <button type="submit" class="btn btn-primary btn-block">মন্তব্য দাখিল করুন</button>
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

        <!--Specification Dialog for return running document-->
        <div class="modal fade" id="addSpecReturn" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">ফেরত পাঠান</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body card card-register mx-auto">
                        <div class="card-header">চিঠিটি ফেরত পাঠান</div>
                        <div class="card-body">
                            <form action="../ReturnErrorDocument" accept-charset="UTF-8" method="post" role="form" class="form-horizontal">
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <img id="scanFile" alt="এই ফাইলটি লোড করা যাচ্ছেনা" height="100%" width="100%"/>
                                    </div>
                                </div>
                                <div>
                                    <center><p class="bg-info">[বিঃ দ্রঃ নথিটি আপনার ঊর্ধ্বতন কর্মকর্তার নিকট পাঠানো হবে]</p></center>
                                </div>
                                <div class="form-group">
                                    <label for="comment" class="control-label">আপনার মন্তব্য দিন</label>
                                    <div class="col-sm-12">
                                        <textarea id="comment" name="comment" class="form-control" required></textarea>
                                    </div>
                                </div>
                                <input  type="hidden" id="forwardedToEmployeeUsername" name="forwardedToEmployeeUsername" class="form-control" value="" readonly/>
                                <input  type="hidden" id="forwardedToEmployeeId" name="forwardedToEmployeeId" class="form-control" value="" readonly/>
                                <input  type="hidden" id="acknowledgedByEmployeeId" name="acknowledgedByEmployeeId" class="form-control" value="" readonly/>
                                <input  type="hidden" id="documentId" name="documentId" class="form-control" value="" readonly/>
                                <input  type="hidden" id="letterId" name="letterId" class="form-control" value="" readonly/>
                                <input  type="hidden" id="forwardingId" name="forwardingId" class="form-control" value="" readonly/>

                                <div class="form-row">
                                    <div class="col-md-6">
                                        <button type="submit" class="btn btn-primary btn-block">চিঠিটি ফেরত পাঠান</button>
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
        <%}%> 
        <script>
            setTimeout(function () {
                $('#message').fadeOut('fast');
            }, 2000);

            $("#lastStatus").change(function () {
                console.log("here");
                //var optionValue = $(this).attr("value"); 
                var optionValue = $('#lastStatus').val();
                if (optionValue == 2) {
                    $(".pg").show();
                    $('.req-active').attr('required', 'true');
                } else if (optionValue == 3) {
                    $(".pg").hide();
                    $('.req-active').removeAttr('required');
                } else {
                }
            });

            $(window).on("load", function () {
                $.ajax({
                    type: "POST",
                    url: "../AllNewWorkEmp",
                    success: function (data) {
                        $("#tableRow").show();
                        $("#tableRow").html(data);
                        $('#dataTables-example').DataTable({
                            responsive: true,
                            "initComplete": function (settings, json) {
                                AfterLoadTable();
                            }
                        });
                    }
                });
            });

            $(document).on("click", ".open-spceDialog-comment", function () {

                var scanfile = $(this).data('scanfile');
                var documentid = $(this).data('documentid');

                $(".modal-body #scanFile").attr('src', '../Uploaded_file/' + scanfile);
                $(".modal-body #documentId").val(documentid);
            });

            $(document).on("click", ".open-spceDialog", function () {

                var letterid = $(this).data('letterid');
                var documentid = $(this).data('documentid');
                var currentstatus = $(this).data('currentstatus');
                var depoforigin = $(this).data('depoforigin');
                var requestid = $(this).data('requestid');
                var subjectofletter = $(this).data('subjectofletter');
                var enddate = $(this).data('enddate');
                var shortdesc = $(this).data('shortdesc');
                var scanfile = $(this).data('scanfile');
                var prioritys = $(this).data('prioritys');
                var forwardingid = $(this).data('forwardingid');

                $(".modal-body #letterId").val(letterid);
                $(".modal-body #documentId").val(documentid);
                $(".modal-body #status").val(currentstatus);
                $(".modal-body #depOfOrigin").val(depoforigin);
                $(".modal-body #requestId").val(requestid);
                $(".modal-body #subjectOfLetter").val(subjectofletter);
                $(".modal-body #endDate").val(enddate);
                $(".modal-body #shortDesc").val(shortdesc);
                $(".modal-body #prioritys").val(prioritys);
                $(".modal-body #scanFile").attr('src', '../Uploaded_file/' + scanfile);
                $(".modal-body #forwardingId").val(forwardingid);

                $.ajax({
                    type: "POST",
                    url: "../AllComment",
                    data: 'documentId=' + documentid,
                    success: function (data) {
                        $("#spceTebleRow").show();
                        $("#spceTebleRow").html(data);
                        var table = $('#dataTables-example-spce').DataTable({
                            responsive: true
                        });
                        table.destroy();
                    }
                });

                $.ajax({
                    type: "POST",
                    url: "../AllEmpUnderEmp",
                    success: function (data) {
                        $("#goingTo").show();
                        $("#goingTo").append(data);
                    }
                });
            });

            $(document).on("click", "#tebleRow tr", function () {
                var letterid = $("#letterId").val();
                $.ajax({
                    type: "POST",
                    url: "../UpdateRecDoc",
                    data: 'letterId=' + letterid,
                    success: function (data) {

                    }
                });
            });

            $(document).on("click", ".open-spceDialog-return", function () {
                var forwardedtoemployeeusername = $(this).data('forwardedtoemployeeusername');
                var acknowledgedbyemployeeusername = $(this).data('acknowledgedbyemployeeusername');
                var forwardedtoemployeeid = $(this).data('forwardedtoemployeeid');
                var acknowledgedbyemployeeid = $(this).data('acknowledgedbyemployeeid');
                var documentid = $(this).data('documentid');
                var letterid = $(this).data('letterid');
                var forwardingid = $(this).data('forwardingid');
                var scanfile = $(this).data('scanfile');

                $(".modal-body #forwardedToEmployeeUsername").val(forwardedtoemployeeusername);
                $(".modal-body #acknowledgedByEmployeeUsername").val(acknowledgedbyemployeeusername);
                $(".modal-body #forwardedToEmployeeId").val(forwardedtoemployeeid);
                $(".modal-body #acknowledgedByEmployeeId").val(acknowledgedbyemployeeid);
                $(".modal-body #documentId").val(documentid);
                $(".modal-body #letterId").val(letterid);
                $(".modal-body #forwardingId").val(forwardingid);
                $(".modal-body #scanFile").attr('src', '../Uploaded_file/' + scanfile);
            });

            $(document).ready(function () {
                $(".col-sm-12").css("overflow-x", "scroll");

            });

            function AfterLoadTable() {
                var rowcount = $('#dataTables-example tr').length;
                for (i = 0; i < rowcount - 2; i++) {
                    var latterid = $('#letterId' + i).val();
                    var enddate = $('#endDate' + i).val();
//                 console.log(latterid);
//                 console.log(enddate);
                    var year = new Date().getFullYear();
                    var month = new Date().getMonth() + 1;
                    var day = new Date().getDate();
                    var cdate = year + '-' + month + '-' + day;
//                 console.log(cdate);
                    var d1 = new Date(cdate);
                    var d2 = new Date(enddate);
                    var timeDiff = Math.abs(d2.getTime() - d1.getTime());
                    var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
//                 console.log(diffDays-1);
                    if (diffDays <= 5) {
                        $('#letterId' + i).parent().parent().addClass('day5');
                    } else if (5 < diffDays <= 10) {
                        $('#letterId' + i).parent().parent().addClass('day10');
                    } else if (10 < diffDays) {
                        $('#letterId' + i).parent().parent().addClass('day15');
                    }
                }
            }
        </script>

    </body>

</html>
