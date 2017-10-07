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
        <title>DG Dashboard</title>
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
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
            <a class="navbar-brand" href="#">Employee</a>

            <!--Navigation Side bar-->
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                        <a class="nav-link" href="dashboard.jsp">
                            <i class="fa fa-fw fa-dashboard"></i>
                            <span class="nav-link-text">ড্যাশবোর্ড</span>
                        </a>
                    </li>

                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseDocument" data-parent="#exampleAccordion">
                            <i class="fa fa-newspaper-o"></i>
                            <span class="nav-link-text">চিঠি সমূহ</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="collapseDocument">
                            <li>
                                <a href="allNewWork.jsp"><i class="fa fa-newspaper-o fa-fw"></i>নতুন চিঠি সমূহ</a>
                            </li>
                            <li>
                                <a href="endWork.jsp"><i class="fa fa-newspaper-o fa-fw"></i>নিস্পত্তিক্রিত চিঠি সমূহ</a>
                            </li>
                        </ul>
                    </li>

                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseAnother" data-parent="#exampleAccordion">
                            <i class="fa fa-fw fa-wrench"></i>
                            <span class="nav-link-text">অন্যান্য</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="collapseAnother">
                            <li><a href="userProfile.jsp"><i class="fa fa-user fa-fw"></i> ব্যবহারকারী প্রোফাইল</a>
                            </li>
                            <li><a href="#"><i class="fa fa-gear fa-fw"></i> সেটিংস</a>
                            </li>
                            <li class="divider"></li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fa fa-fw fa-sign-out"></i>প্রস্থান</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <ul class="navbar-nav sidenav-toggler">
                    <li class="nav-item">
                        <a class="nav-link text-center" id="sidenavToggler">
                            <i class="fa fa-fw fa-angle-left"></i>
                        </a>
                    </li>
                </ul>

                <!--Navigation top bar-->
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-fw fa-envelope"></i>
                            <span class="d-lg-none">Messages
                                <span class="badge badge-pill badge-primary">12 New</span>
                            </span>
                            <span class="indicator text-primary d-none d-lg-block">
                                <i class="fa fa-fw fa-circle"></i>
                            </span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="messagesDropdown">
                            <h6 class="dropdown-header">New Messages:</h6>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">
                                <strong>David Miller</strong>
                                <span class="small float-right text-muted">11:21 AM</span>
                                <div class="dropdown-message small">Hey there! This new version of SB Admin is pretty awesome! These messages clip off when they reach the end of the box so they don't overflow over to the sides!</div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">
                                <strong>Jane Smith</strong>
                                <span class="small float-right text-muted">11:21 AM</span>
                                <div class="dropdown-message small">I was wondering if you could meet for an appointment at 3:00 instead of 4:00. Thanks!</div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">
                                <strong>John Doe</strong>
                                <span class="small float-right text-muted">11:21 AM</span>
                                <div class="dropdown-message small">I've sent the final files over to you for review. When you're able to sign off of them let me know and we can discuss distribution.</div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item small" href="#">View all messages</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle mr-lg-2" id="alertsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-fw fa-bell"></i>
                            <span class="d-lg-none">Alerts
                                <span class="badge badge-pill badge-warning">6 New</span>
                            </span>
                            <span class="indicator text-warning d-none d-lg-block">
                                <i class="fa fa-fw fa-circle"></i>
                            </span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="alertsDropdown">
                            <h6 class="dropdown-header">New Alerts:</h6>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">
                                <span class="text-success">
                                    <strong>
                                        <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
                                </span>
                                <span class="small float-right text-muted">11:21 AM</span>
                                <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">
                                <span class="text-danger">
                                    <strong>
                                        <i class="fa fa-long-arrow-down fa-fw"></i>Status Update</strong>
                                </span>
                                <span class="small float-right text-muted">11:21 AM</span>
                                <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">
                                <span class="text-success">
                                    <strong>
                                        <i class="fa fa-long-arrow-up fa-fw"></i>Status Update</strong>
                                </span>
                                <span class="small float-right text-muted">11:21 AM</span>
                                <div class="dropdown-message small">This is an automated server response message. All systems are online.</div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item small" href="#">View all alerts</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <form class="form-inline my-2 my-lg-0 mr-lg-2">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="Search for...">
                                <span class="input-group-btn">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                        </form>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" data-target="#logoutModal">
                            <i class="fa fa-fw fa-sign-out"></i>প্রস্থান</a>
                    </li>
                </ul>
            </div>
        </nav>

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
                <center><h3>${message}</h3></center>
            </div>
            
            <div class="panel-body col-sm-12">
                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                    <thead>
                        <tr>
                            <th>ক্রমিক নং</th>
                            <th>প্রাপ্তির তারিখ</th>
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
                            <th>প্রাপ্তির তারিখ</th>
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
            <!--footer-->
        <footer class="sticky-footer">
            <div class="container">
                <div class="text-center">
                    <small>Copyright © Your Website 2017</small>
                </div>
            </div>
        </footer>

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fa fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">আপনি কি নিশ্চিত?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">আপনি যদি আপনার বর্তমান অধিবেশন শেষ করার জন্য প্রস্তুত হন তবে নীচের "প্রস্থান" নির্বাচন করুন।</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">বাতিল</button>
                        <a class="btn btn-primary" href="../logout.jsp">প্রস্থান</a>
                    </div>
                </div>
            </div>
        </div>

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
        </div>
        <%}%> 
        <script>
            setTimeout(function () {
                $('#message').fadeOut('fast');
            }, 2000);

            $("#lastStatus").change(function () {
                console.log("here");
                //var optionValue = $(this).attr("value"); 
                var optionValue = $('#lastStatus').val()
                console.log("value:" + optionValue);
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
                        console.log(data);
                        $('#dataTables-example').DataTable({
                            responsive: true
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
                        console.log(data);
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
                        console.log(data);
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
        </script>
    </body>

</html>
