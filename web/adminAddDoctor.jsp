<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
        <link href="assets/img/favicon.png" rel="icon">

        <!--<link rel="stylesheet" href="css/login-icon-style.css">-->

        <!--done-->
        <link rel="stylesheet" href="css/owl.carousel.min.css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.login.css">

        <!-- Style -->
        <link rel="stylesheet" href="css/loginstyle.css">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="//geodata.solutions/includes/countrystatecity.js"></script>

        <title>OHMS Registration</title>
    </head>
    <body style="overflow: scroll; height : 90%">
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="d-md-flex half">
                <div class="bg" style="background-image: url('images/login-side.jpg');"></div>
                <div class="contents">
                    <<div class="col-md-auto">
                        <div class="form-group mx-auto">
                            <br>
                            <div class="text-center mb-5">
                                <h1 class="text-secondary">Please Add Doctor To <strong class="d-inline-block mb-2 text-warning"> OHMS</strong></h1>
                            </div>
                            <form action="SignUp" method="POST">
                                <table class="table table-light text-center ">
                                    <tr>
                                        <td>
                                            <div class="form-group first">
                                                <label for="emailAddress">Email Address</label>
                                                <input name="emailAddress" type="text" class="form-control" placeholder="your-email@gmail.com" id="emailAddress" required>
                                            </div>
                                            <div class="form-group first">
                                                <label for="firstName">First Name</label>
                                                <input name="firstName" type="text" class="form-control" placeholder="First Name" id="firstName" required>
                                            </div>
                                            <div class="form-group last mb-3">
                                                <label for="occupation">Occupation</label>
                                                <input name="occupation" type="text" class="form-control" placeholder="Your Occupation" id="occupation" value="OHMS Doctor" readonly>
                                            </div>
                                            <div class="form-group last mb-3">
                                                <label>Country</label>
                                                <select name="country" class="countries form-control" id="countryId">
                                                    <option value="">Select Country</option>
                                                </select>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group last mb-3">
                                                <label for="password">Password</label>
                                                <input name="password" type="password" class="form-control" placeholder="Your Password" id="password" required>
                                            </div>
                                            <div class="form-group first">
                                                <label for="lastName">Last Name</label>
                                                <input name="lastName" type="text" class="form-control" placeholder="Last Name" id="lastName" required>
                                            </div>

                                            <div class="form-group last mb-3">
                                                <label for="roleId">Role Id</label>
                                                <input name="roleId" type="text" class="form-control" placeholder="Role Id" id="roleId" value="2" readonly>
                                            </div>
                                            <div class="form-group last mb-3">
                                                <label>State</label>
                                                <select name="state" class="states form-control" id="stateId">
                                                    <option value="">Select State</option>
                                                </select>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="form-group first">
                                                <label for="doctorId">Doctor Id</label>
                                                <input name="doctorId" type="text" class="form-control" placeholder="Doctor Id" id="doctorId" value="">
                                            </div>
                                            <div class="form-group last mb-3">

                                                <label class="gender" for="inlineFormCustomSelectPref" id="gender">Choose Gender</label>
                                                <select  name="gender" class="form-control" id="inlineFormCustomSelectPref" required>
                                                    <option selected>Select Gender</option>
                                                    <option value="male">Male</option>
                                                    <option value="female">Female</option>
                                                    <option value="others">Others</option>
                                                </select>
                                            </div>
                                            <div class="form-group last mb-3">
                                                <label class="departmentName" for="inlineFormCustomSelectPref" id="departmentName">Department Name</label>
                                                <select  name="departmentId" class="form-control" id="inlineFormCustomSelectPref">

                                                <c:forEach items="${DeptList}" var="department">
                                                    <option value="${department.departmentId}" <c:if test="${appointment.departmentId==department.departmentId}">selected</c:if>>${department.departmentName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group last mb-3">
                                            <label>City</label>
                                            <select name="city" class="cities form-control" id="cityId">
                                                <option value="">Select City</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <button type="submit" value="Save" class="btn btn-block py-2 btn-warning">Add</button>

                        </form>
                    </div>
                    <p class="mb-md-0">&copy; <a class="text-primary" href="#">OHMS</a>. All Rights Reserved. by @nik</p>
                </div>
            </div>
        </div>



        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>