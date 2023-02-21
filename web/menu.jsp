<%-- 
    Document   : menu
    Created on : 12-Feb-2023, 1:10:37 am
    Author     : Anik Dutta
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <title>OHMS</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <meta name="theme-color" content="#712cf9">

        <!-- Custom styles for this template -->
        <link href="css/header.css" rel="stylesheet">
        <!--<link href="css/carousel.css" rel="stylesheet">-->
        <style>
            header{
                width: 100%;
            }
            ul{
                font-size:25px;
            }
            li{
                padding:0px 8px;
            }
        </style>
    </head>
    <header class="p-3 text-bg-dark">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                    <img src="images/OH_MS__1_-removebg-preview.png" width="85" height="85"></img>
                </a>
                <c:set var="login_check" value="${LoggedIn}"/>
                <c:if test="${login_check!=null}">
                    <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                        <li><a href="landingPage.jsp" class="nav-link px-2 text-white">Home</a></li>
                        <li><a href="#" class="nav-link px-2 text-white">Book Service</a></li>
                        <li><a href="#" class="nav-link px-2 text-white">Medical History</a></li>
                        <li><a href="#" class="nav-link px-2 text-white">Bookings</a></li>
                        <li><a href="#" class="nav-link px-2 text-white">About Us</a></li>


                        <a class="nav-link px-2 text-bg-light">
                            WELCOME :
                            <c:set var="user" value="${USER}"/>
                            <c:out value="${user.getFirstName()} ${user.getLastName()}" />!!!!
                        </a>
                    </c:if>
                    <c:if test="${login_check==null}">
                        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                            <li><a href="landingPage.jsp" class="nav-link px-2 text-white">Home</a></li>
                            <li><a href="login.jsp" class="nav-link px-2 text-white">View Service</a></li>
                            <li><a href="login.jsp" class="nav-link px-2 text-white">About Us</a></li>
                        </c:if>
                    </ul>

                    <div class="text-end">
                        <c:set var="login_check" value="${LoggedIn}"/>
                        <c:if test="${login_check==null}">
                            <a href="login.jsp">
                                <button type="button" class="btn btn-outline-light me-2" >Login</button>
                            </a>
                            <a href="PreProssing">
                                <button type="button" class="btn btn-warning">Sign-up</button>
                            </a>
                        </c:if>
                        <c:if test="${login_check!=null}">
                            <a href="Logout">
                                <button type="button" class="btn btn-outline-light me-2" >Log Out</button>
                            </a>
                        </c:if>

                    </div>
            </div>
        </div>
    </header>