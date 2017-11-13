<%-- 
    Document   : userProfile
    Created on : Sep 21, 2017, 10:37:43 AM
    Author     : Md. Emran Hossain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ব্যবহারকারী প্রোফাইল</title>
        <%@include file="../header.jsp" %>
    </head>
    <body class="fixed-nav sticky-footer bg-dark" id="page-top">
        <%
            if ((session.getAttribute("idUser") == null) || (session.getAttribute("idUser") == "")) {
                response.sendRedirect("../login.jsp");
            } else {%>
        
        <%@include file="navbar.jsp" %>
        
        <!--Page Body Part--> 
        <div class="content-wrapper">
            <div class="container-fluid">
                <!-- Breadcrumbs-->
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="#">অন্যান্য</a>
                    </li>
                    <li class="breadcrumb-item active">ব্যবহারকারী প্রোফাইল</li>
                </ol>
            </div>

            <div id="message">
                <center><h3>${message}<%session.setAttribute("message", null);%></h3></center>
            </div>

            <div class="modal-body card card-register mx-auto">
                <div class="card-header">তথ্য পরিবর্তন করুন</div>
                <div class="card-body">
                    <form action="../UpdateInfo" accept-charset="UTF-8" method="post" role="form" class="form-horizontal">

                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <label class="control-label" for="userName">ইউজারনেম</label>
                                    <input id="userName" name="userName" class="form-control" value="" readonly>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label" for="fullName">পুরো নাম</label>
                                    <input id="fullName" name="fullName" value="" class="form-control" required>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <label class="control-label" for="designation">উপাধি</label>
                                    <input id="designation" name="designation" class="form-control" value="" readonly>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label" for="department">বিভাগ</label>
                                    <input id="department" name="department" value="" class="form-control" readonly>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <label class="control-label" for="contactInfo">যোগাযোগের ঠিকানা</label>
                                    <textarea id="contactInfo" name="contactInfo" class="form-control" value="" required></textarea>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label" for="contactCell">ফোন নম্বর </label>
                                    <input id="contactCell" name="contactCell" value="" class="form-control" required>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <label class="control-label" for="contactEmail">ই-মেইল</label>
                                    <input type="email" id="contactEmail" name="contactEmail" value="" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label" for="password">পাসওয়ার্ড</label>
                                    <input type="password" id="password" name="password" value="" class="form-control" required>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-row">
                                <div class="col-md-4">
                                    <button type="submit" class="btn btn-primary">হালনাগাদ করুন</button>
                                </div>
                                <div class="col-md-4">
                                    <button type="reset" class="btn btn-default">পুনরায় বসান</button>
                                </div>
                            </div>
                        </div>
                    </form>
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
                    url: "../UserInfo",
                    success: function (data) {
                        $.each(data, function (index, element) {
                            var empOrgId = element.empOrgId;
                            var userName = element.userName;
                            var password = element.password;
                            var fullName = element.fullName;
                            var contactInfo = element.contactInfo;
                            var contactCell = element.contactCell;
                            var contactEmail = element.contactEmail;
                            var designation = element.designation;
                            var department = element.department;
                            var parentId = element.parentId;

                            $(".modal-body #empOrgId").val(empOrgId);
                            $(".modal-body #userName").val(userName);
                            $(".modal-body #password").val(password);
                            $(".modal-body #fullName").val(fullName);
                            $(".modal-body #contactInfo").val(contactInfo);
                            $(".modal-body #contactCell").val(contactCell);
                            $(".modal-body #contactEmail").val(contactEmail);
                            $(".modal-body #designation").val(designation);
                            $(".modal-body #department").val(department);
                            $(".modal-body #parentId").val(parentId);
                        });
                    }
                });
            });
        </script>
    </body>
</html>
