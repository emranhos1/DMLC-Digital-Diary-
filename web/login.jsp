<%-- 
    Document   : login
    Created on : Sep 19, 2017, 11:15:28 AM
    Author     : Md. Emran Hossain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>SB Admin - Start Bootstrap Template</title>
        <!-- Bootstrap core CSS-->
        <link href="allStyles/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- Custom fonts for this template-->
        <link href="allStyles/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <!-- Custom styles for this template-->
        <link href="allStyles/css/sb-admin.css" rel="stylesheet" type="text/css"/>
    </head>

    <body class="bg-dark">
        <div class="container">
            <div class="card card-login mx-auto mt-5">
                <div>
                    <center>
                        <div class="top-logo">
                            <div>
                                <center><img class="img img-responsive" src="Image/alogo.png" alt=""/></center>
                            </div>
                        </div>
                    </center>
                </div>

                <center>
                    <div class="card-header">প্রবেশ করুন</div>
                    <div id="message">
                        <center><h3>${message}</h3></center>
                    </div>
                </center>
                <div class="card-body">
                    <form role="form" role="form" action="LoginBean" method="post" class="form-horizontal">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="Username" name="username" type="text" autofocus required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Password" name="password" type="password" value="" required>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                </label>
                            </div>
                        </fieldset>
                        <div>
                            <input type="submit" value="Login" class="btn btn-primary btn-block"/>
                        </div>
                    </form>
                    <div class="text-center">
                        <a class="d-block small" href="#">Forgot Password?</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JavaScript-->
        <script src="allStyles/vendor/jquery/jquery.min.js" type="text/javascript"></script>
        <script src="allStyles/vendor/popper/popper.min.js" type="text/javascript"></script>
        <script src="allStyles/vendor/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Core plugin JavaScript-->
        <script src="allStyles/vendor/jquery-easing/jquery.easing.min.js" type="text/javascript"></script>

        <script type="text/javascript">
            setTimeout(function () {
                $('#message').fadeOut('fast');
            }, 2000);
        </script>
    </body>
</html>

