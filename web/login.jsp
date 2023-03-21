<%--
    Document   : login
    Created on : 21-Feb-2023, 4:56:03 pm
    Author     : SAYANTA PAUL
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
        <!--<link rel="stylesheet" href="css/login-icon-style.css">-->
        <!--done-->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.login.css">
        <!-- Style -->
        <link rel="stylesheet" href="css/loginstyle.css">
        <title>OHMS Login</title>
        <meta name="google-signin-client_id" content="954298706213-l0sc288rp22fj9vpjt2n6o9t7vqvfuqc.apps.googleusercontent.com">
        <script src="https://accounts.google.com/gsi/client" async defer></script>
    </head>
    <body id="social">
        <div class="d-md-flex half">
            <div class="bg" style="background-image: url('images/login-side.jpg');"></div>
            <div class="contents">
                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-12">
                            <div class="form-block mx-auto">
                                <div class="text-center mb-5">
                                    <h3 class="text-uppercase">Login to <strong>OHMS</strong></h3>
                                </div>
                                <div class="text-center mb-5" >
                                    <c:if var="test" test="${MSG!=null}">
                                        <c:out value="${MSG}"></c:out>
                                    </c:if>
                                </div>
                                <div class="text-center mb-5" >
                                    <c:out value="${SuccessSignUp}"></c:out>
                                    </div>
                                    <form action="Login" method="POST">
                                        <!--                                    <div class="form-group first">
                                                                                <label for="login-form">Login As</label>
                                                                                <select name="login-form" id="login-form" class="form-control">
                                                                                    <option value="0">Patient</option>
                                                                                    <option value="1">Doctor</option>
                                                                                    <option value="2">Admin</option>
                                                                                </select>
                                                                            </div>-->

                                        <div class="form-group first">
                                            <label for="emailAddress">Email Address</label>
                                            <input name="emailAddress" type="text" class="form-control" placeholder="your-email@gmail.com" id="emailAddress">
                                        </div>

                                        <div class="form-group last mb-3">
                                            <label for="password">Password</label>
                                            <input name="password" type="password" class="form-control" placeholder="Your Password" id="password">
                                        </div>

                                        <div class="d-sm-flex mb-5 align-items-center">

                                            <span class="ml-auto"><a href="resetPassword.jsp" class="forgot-pass">Forgot Password</a></span>
                                        </div>


                                        <button type="submit" value="Log In" class="btn btn-block py-2 btn-primary">Log In</button>
                                    </form>
                                    <span class="text-center my-3 d-block">or</span>

                                    <center><jsp:include page="socialLogin.jsp"></jsp:include></center>


                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <script src="https://code.jquery.com/jquery-3.6.3.js"�
                ����������� integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="�
        ����������� crossorigin="anonymous"></script>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>