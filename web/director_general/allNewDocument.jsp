<%-- 
    Document   : allNewDocument
    Created on : Sep 20, 2017, 5:27:19 PM
    Author     : Md Emran Hossain
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dbConnection.conRs"%>
<%@page import="dao.SelectQueryDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>নতুন চিঠি সমূহ</title>
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
                                        <label for="subjectOfLetter" class="control-label">পত্রের বিষয়</label>
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
                                                conRs conrs;
                                                Connection con;
                                                PreparedStatement pstm;
                                                int user_Id = Integer.parseInt(session.getAttribute("idUser").toString());
                                                String columnName = " * ";
                                                String tableName = " employee_emp_org ";
                                                String whereCondition = " employee_id not in('" + user_Id + "') and designation not in ('webadmin','frontdesk')";
                                                conrs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
                                                con = conrs.getCon();
                                                rs = conrs.getRs();
                                                pstm = conrs.getPstm();

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
                                                pstm.close();
                                                rs.close();
                                                con.close();
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

        <%@include file="../footer.jsp" %>
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
