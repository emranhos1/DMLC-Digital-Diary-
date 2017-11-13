<%-- 
    Document   : addDocument
    Created on : Sep 20, 2017, 9:42:38 AM
    Author     : Md. Emran Hossain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>চিঠি যোগ করুন</title>
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
                        <a href="#">Front Desk</a>
                    </li>
                    <li class="breadcrumb-item active">চিঠি যোগ করুন</li>
                </ol>

                <!--add document part-->
                <div class="container">
                    <div class="card card-register mx-auto mt-5">
                        <div class="card-header">নতুন চিঠি যোগ করুন</div>

                        <div id="message">
                            <center><h3>${message}<%session.setAttribute("message", null);%></h3></center>
                        </div>

                        <div class="card-body">
                            <form action="../AddDocumentBean" accept-charset="UTF-8" method="post" role="form" class="form-horizontal" enctype="multipart/form-data">
                                <div class="form-group">
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <label for="depOfOrigin">প্রেরক</label>
                                            <input class="form-control" name="depOfOrigin" id="depOfOrigin" type="text" aria-describedby="nameHelp" required>
                                        </div>

                                        <div class="col-md-6">
                                            <label for="subject">বিষয় </label>
                                            <input class="form-control" name="subject" id="subject" type="text" aria-describedby="nameHelp" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <label for="details">বিবরণ</label>
                                            <textarea class="form-control" name="details" id="details" required aria-describedby="nameHelp"></textarea>
                                        </div>

                                        <div class="col-md-6">
                                            <label for="file">স্ক্যান ফাইল</label>
                                            <input type="file" id="file" name="file" class="form-control" aria-describedby="nameHelp" required>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="requestId">স্বারক নাম্বার/সুত্র</label>
                                    <input class="form-control" name="requestId" id="requestId" type="text" aria-describedby="nameHelp" required>
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
        <script>
            setTimeout(function () {
                $('#message').fadeOut('fast');
            }, 2000);
        </script>
    </body>
</html>
