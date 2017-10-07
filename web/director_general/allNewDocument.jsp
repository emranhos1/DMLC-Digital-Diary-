<%-- 
    Document   : allNewDocument
    Created on : Sep 20, 2017, 5:27:19 PM
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
            <a class="navbar-brand" href="#">Director General</a>

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
                                <a href="allNewDocument.jsp"><i class="fa fa-newspaper-o fa-fw"></i>নতুন চিঠি সমূহ</a>
                            </li>
                            <li>
                                <a href="runningDocument.jsp"><i class="fa fa-newspaper-o fa-fw"></i>চলমান চিঠি সমূহ</a>
                            </li>
                            <li>
                                <a href="endDocument.jsp"><i class="fa fa-newspaper-o fa-fw"></i>নিস্পত্তিক্রিত চিঠি সমূহ</a>
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
                            <th>বর্তমান অবস্থা</th>
                            <th>প্রাপ্তির তারিখ</th>
                            <th>প্রেরক</th>
                            <th>স্বারক নাম্বার/সুত্র</th>
                            <th>চিঠি বিষয়</th>
                            <th>ছোট বিবরণ</th>
                            <th>স্ক্যান ফাইল</th>
                            <th>অগ্রাধিকার</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>ক্রমিক নং</th>
                            <th>বর্তমান অবস্থা</th>
                            <th>প্রাপ্তির তারিখ</th>
                            <th>প্রেরক</th>
                            <th>স্বারক নাম্বার/সুত্র</th>
                            <th>চিঠি বিষয়</th>
                            <th>ছোট বিবরণ</th>
                            <th>স্ক্যান ফাইল</th>
                            <th>অগ্রাধিকার</th>
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

            <!--letter Edit Dialog-->
            <div class="modal fade" id="addLetter" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">অগ্রাধিকার</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>

                        <div class="modal-body card card-register mx-auto">
                            <div class="card-header">অগ্রাধিকার পরিবর্তন করুন</div>
                            <div class="card-body">
                                <form action="../AddReceivesDocument" accept-charset="UTF-8" method="post" role="form" class="form-horizontal">
                                    <div class="form-group">
                                        <label for="s" class="col-sm-4 control-label">বর্তমান অবস্থা</label>
                                        <input  type="text" id="s" name="s" class="form-control" value="" readonly/>
                                    </div>
                                    <div class="form-group">
                                        <label for="subjectOfLetter" class="col-sm-4 control-label">পত্রের বিষয়</label>
                                        <input  type="text" id="subjectOfLetter" name="subjectOfLetter" class="form-control" value="" readonly/>
                                    </div>
                                    <div class="form-group">
                                        <label for="scanFile" class="col-sm-4 control-label">স্ক্যান ফাইল</label>
                                        <img id="scanFile" alt="এই ফাইলটি লোড করা যাচ্ছেনা" height="auto" width="100%"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="comment" class="col-sm-4 control-label">আপনার মন্তব্য</label>
                                        <textarea id="comment" name="comment" class="form-control" value="" required></textarea>
                                    </div>

                                    <div class="form-group">
                                        <label for="status" class="col-sm-4 control-label">সর্বশেষ অবস্থা</label>
                                        <div>
                                            <select class="form-control" name="status" id="status" required>
                                                <option value="">নির্বাচন করুন</option>
                                                <option value="2">চলতে থাকবে</option>
                                                <option value="3">নিস্পত্তি করা হল</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group pg" style="display: none">
                                        <label for="priority" class="col-sm-4 control-label">অগ্রাধিকার</label>
                                        <div>
                                            <select class="form-control req-active" name="priority" id="priority">
                                                <option value="">নির্বাচন করুন</option>
                                                <option value="1">জরুরী</option>
                                                <option value="2">সাধারণ</option>
                                            </select>
                                        </div>
                                        <br/>
                                        <label for="goingTo" class="control-label">যাকে পাঠাতে চান</label>
                                        <select class="form-control req-active" name="goingTo" id="goingTo">
                                            <option value="">কর্মচারী নির্বাচন করুন</option>
                                            <%
                                                int i = 0;
                                                ResultSet rs;
                                                int user_Id = Integer.parseInt(session.getAttribute("idUser").toString());
                                                String columnName = " * ";
                                                String tableName = " employee_emp_org ";
                                                String whereCondition = " employee_id not in('" + user_Id + "') and designation not in ('webadmin','frontdesk')";
                                                rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
                                                rs.last();
                                                int orgRow = rs.getRow();
                                                int[] employeeId = new int[orgRow];
                                                int[] empOrgId = new int[orgRow];
                                                String[] uName = new String[orgRow];
                                                String[] designation = new String[orgRow];
                                                String[] department = new String[orgRow];
                                                int[] hasParent = new int[orgRow];
                                                int[] parentId = new int[orgRow];
                                                rs.beforeFirst();
                                                while (rs.next()) {
                                                    employeeId[i] = rs.getInt("employee_id");
                                                    uName[i] = rs.getString("user_name");
                                                    empOrgId[i] = rs.getInt("employee_organogram_id");
                                                    designation[i] = rs.getString("designation");
                                                    department[i] = rs.getString("department");
                                                    hasParent[i] = rs.getInt("has_parent");
                                                    parentId[i] = rs.getInt("parent_id");
                                                    i++;
                                                }
                                                for (i = 0; i < orgRow; i++) {
                                            %>
                                            <option value="<%=employeeId[i]%>"><%=department[i]%> : <%=designation[i]%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                        <br/>
                                        <label for="endDate">নিস্পত্তিত সম্ভাব্য তারিখ</label>
                                        <input type="date" id="endDate" name="endDate" class="form-control req-active">
                                    </div>
                                    <input type="hidden" id="letterId" name="letterId" class="form-control" required>

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
        </div>
        <%}%> 
        <script>
            setTimeout(function () {
                $('#message').fadeOut('slow');
            }, 2000);

            $(window).on("load", function () {
                $.ajax({
                    type: "POST",
                    url: "../AllNewDocument",
                    success: function (data) {
                        $("#tableRow").show();
                        $("#tableRow").html(data);
                        $('#dataTables-example').DataTable({
                            responsive: true
                        });
                    }
                });
            });

            $("#status").change(function () {
                console.log("here");
                //var optionValue = $(this).attr("value"); 
                var optionValue = $('#status').val()
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

            $(document).on("click", ".open-spceLetterDialog", function () {

                var letterId = $(this).data('letterid');
                var status = $(this).data('status');
                var receivingDate = $(this).data('receivingdate');
                var depOfOrigin = $(this).data('depoforigin');
                var requestId = $(this).data('requestid');
                var subjectOfLetter = $(this).data('subjectofletter');
                var documentId = $(this).data('documentid');
                var shortDesc = $(this).data('shortdesc');
                var scanFile = $(this).data('scanfile');

                $(".modal-body #letterId").val(letterId);
                $(".modal-body #s").val(status);
                $(".modal-body #receivingDate").val(receivingDate);
                $(".modal-body #depOfOrigin").val(depOfOrigin);
                $(".modal-body #requestId").val(requestId);
                $(".modal-body #subjectOfLetter").val(subjectOfLetter);
                $(".modal-body #documentId").val(documentId);
                $(".modal-body #shortDesc").val(shortDesc);
                $(".modal-body #scanFile").attr('src', '../Uploaded_file/' + scanFile);
            });

            $(document).ready(function () {
                $(".col-sm-12").css("overflow-x", "scroll");
            });
        </script>
    </body>
</html>
