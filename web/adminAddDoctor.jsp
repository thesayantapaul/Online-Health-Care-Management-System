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

        <script>
            function sendRegisterFormInfo()
            {
                var email = document.register.emailAddress.value;
                var firstName = document.register.firstName.value;
                var occupation = document.register.occupation.value;
                var password = document.register.password.value;
                var lastName = document.register.lastName.value;
                var roleId = document.register.roleId.value;
                var age = document.register.age.value;
                var gender = document.register.gender.value;
                var departmentId = document.register.departmentId.value;
                var address = document.register.address.value;

                var url = "RegisterDoctor?emailAddress=" + email + "&firstName=" + firstName + "&lastName=" + lastName + "&departmentId=" + departmentId + "&gender=" + gender + "&address=" + address + "&age=" + age + "&roleId=" + roleId + "&password=" + password + "&occupation=" + occupation;
                //event.preventDefault();
                //alert(url);
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onload = function ()
                {
                    //document.getElementById("viewSearchResult").innerHTML = xmlhttp.responseText;
                    if (xmlhttp.status === 200) {
                        alert("successfully added");
                        document.getElementById("registerformId").reset();
                    } else {
                        // error
                        alert("Bhai kar kya rha hai tu ! Email already exist hai bola tha na");
                        document.getElementById("registerformId").reset();
                        console.error('Request failed.  Returned status of ' + xmlhttp.status);
                    }

                };
                xmlhttp.open("POST", url, true);
                xmlhttp.send();
            }
            function checkEmail(email) {

                if (document.getElementById("emailAddress").value === '') {
                    alert("please enter email!");
                    document.getElementById("emailAddress").focus();
                    return false;
                }
                // create a new XMLHttpRequest object
                var xhr = new XMLHttpRequest();

                // set the HTTP method and URL of the request
                xhr.open('GET', 'CheckEmail?emailAddress=' + email, true);

                // set the response type to text
                xhr.responseType = 'text';

                // define a callback function to handle the response
                xhr.onload = function () {
                    if (xhr.status === 200) {
                        // success
                        var data = xhr.response;

                        alert(data);

                        // display the data in a div element
                        //document.getElementById('data').innerHTML = data;
                    } else {
                        // error
                        console.error('Request failed.  Returned status of ' + xhr.status);
                    }
                };
                // send the request
                xhr.send();
            }
        </script>
    </head>
    <body style="overflow: scroll; height : 90%">
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="d-md-flex half">
                <div class="bg" style="background-image: url('images/login-side.jpg');"></div>
                <div class="contents">

                    <div class="col-md-auto">
                        <div class="form-group mx-auto">
                            <br>
                            <div class="text-center mb-5">
                                <h1 class="text-secondary">Please Add Doctor/Admin To <strong class="d-inline-block mb-2 text-warning"> OHMS</strong></h1>
                            <c:if test="${UpdateMsg != null}">
                                <div class="alert alert-danger" role="alert">
                                    ${UpdateMsg}
                                </div>
                            </c:if>
                        </div>
                        <form name="register" class="form" id="registerformId">
                            <table class="table table-light text-center ">
                                <tr>
                                    <td>
                                        <div class="form-group first">
                                            <label for="emailAddress">Email Address</label>
                                            <input onchange="checkEmail(this.value)" name="emailAddress" type="text" class="form-control" placeholder="your-email@gmail.com" id="emailAddress" required>
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
                                            <label for="roleId">Role</label>
                                            <select name="roleId" class="form-control" id="roleId">
                                                <option value="" disabled>Select Role</option>
                                                <option value="2">Doctor</option>

                                            </select>
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
                                            <label for="age">Age</label>
                                            <input name="age" type="text" class="form-control" placeholder="Age" id="age" >
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
                                            <select name="address" class="cities form-control" id="cityId">
                                                <option value="">Select City</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <button type="button" onclick="sendRegisterFormInfo()" class="btn btn-block py-2 btn-warning">Add</button>

                        </form>
                    </div>
                </div>
            </div>
        </div>



        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>