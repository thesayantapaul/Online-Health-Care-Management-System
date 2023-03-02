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


        <!--<link rel="stylesheet" href="css/login-icon-style.css">-->

        <!--done-->
        <link rel="stylesheet" href="css/owl.carousel.min.css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.login.css">

        <!-- Style -->
        <link rel="stylesheet" href="css/loginstyle.css">

        <title>OHMS Registration</title>
        <style>
            #table {
                display: block;
                height: 250px;
                width: 100%;
                overflow: auto;

            }
        </style>

        <script>
            function sendSearchFormInfo()
            {
                var doctorId = document.searchDoctor.doctorId.value;


                var doctorFirstName = document.searchDoctor.doctorFirstName.value;

                var doctorLastName = document.searchDoctor.doctorLastName.value;

                var departmentId = document.searchDoctor.departmentId.value;
                var gender = document.searchDoctor.doctorGender.value;

                var url = "SearchDoctor?doctorId=" + doctorId + "&firstName=" + doctorFirstName + "&lastName=" + doctorLastName + "&departmentId=" + departmentId + "&gender=" + gender;
                //event.preventDefault();
                //alert(url);
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    document.getElementById("viewSearchResult").innerHTML = xmlhttp.responseText;
                };
                xmlhttp.open("POST", url, true);
                xmlhttp.send();
            }
            function sendSearchFormInfoPatient()
            {
                var patientId = document.searchPatient.patientId.value;

                var patientFirstName = document.searchPatient.patientFirstName.value;

                var patientLastName = document.searchPatient.patientLastName.value;


                var gender = document.searchPatient.patientGender.value;
                var appointmentId = document.searchPatient.appointmentId.value;

                var url = "SearchPatient?patientId=" + patientId + "&firstName=" + patientFirstName + "&lastName=" + patientLastName + "&gender=" + gender + "&appointmentId=" + appointmentId;
                //event.preventDefault();
                //alert(url);
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    document.getElementById("viewSearchResult").innerHTML = xmlhttp.responseText;
                };
                xmlhttp.open("POST", url, true);
                xmlhttp.send();
            }
            //sendSearchFormInfoPatient
        </script>
    </head>
    <body style="overflow: scroll; height : 90%">
        <jsp:include page="menu.jsp"></jsp:include>

            <div class="d-md-flex half">
                <div class="bg" style="background-image: url('images/login-side.jpg'); opacity:100%;"></div>
                <div class="contents" >
                    <br>
                    <main class="container">
                        <div class="row mb-2">
                            <div class="col-md-6">
                                <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                                    <div class="col p-4 d-flex flex-column position-static" >
                                        <h3><strong class="d-inline-block mb-2 text-danger">Search Doctor</strong></h3>
                                        <form name="searchDoctor" class="form">
                                            <table class="table table-borderless">
                                                <tr>
                                                    <td>
                                                        <div class="form-group first">
                                                            <label for="doctorId">ID</label>
                                                            <input name="doctorId" type="text" class="form-control" placeholder="Doctor Id" id="doctorId">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-group first">
                                                            <label for="doctorFirstName">First Name</label>
                                                            <input name="doctorFirstName" type="text" class="form-control" placeholder="First Name" id="doctorFirstName">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-group first">
                                                            <label for="doctorLastName">Last Name</label>
                                                            <input name="doctorLastName" type="text" class="form-control" placeholder="Last Name" id="doctorLastName">
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group last mb-3">

                                                            <label for="inlineFormCustomSelectPref" id="patientGender">Gender</label>
                                                            <select  name="doctorGender" class="form-control" id="inlineFormCustomSelectPref">
                                                                <option value="">--select gender--</option>
                                                                <option value="male">Male</option>
                                                                <option value="female">Female</option>
                                                            </select>

                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-group last mb-3">

                                                            <label class="departmentName" for="inlineFormCustomSelectPref" id="departmentName">Department Name</label>
                                                            <select  name="departmentId" class="form-control" id="inlineFormCustomSelectPref">
                                                                <option value="">--select department--</option>
                                                            <c:forEach items="${DeptList}" var="department">
                                                                <option value="${department.departmentId}">${department.departmentName}</option>
                                                            </c:forEach>
                                                        </select>

                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                        <button type="button" onclick="sendSearchFormInfo()" class="btn btn-block py-2 btn-danger">Search</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                                <div class="col p-4 d-flex flex-column position-static">
                                    <h3><strong class="d-inline-block mb-2 text-success">Search Patient</strong></h3>
                                    <form name="searchPatient" class="form">
                                        <table class="table table-borderless">
                                            <tr>
                                                <td>
                                                    <div class="form-group first">
                                                        <label for="patientId">ID</label>
                                                        <input name="patientId" type="text" class="form-control" placeholder="Patient Id" id="patientId">
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group first">
                                                        <label for="patientFirstName">First Name</label>
                                                        <input name="patientFirstName" type="text" class="form-control" placeholder="First Name" id="patientFirstName">
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group first">
                                                        <label for="patientLastName">Last Name</label>
                                                        <input name="patientLastName" type="text" class="form-control" placeholder="Last Name" id="patientLastName">
                                                    </div>

                                                </td>
                                            </tr>
                                            <tr>

                                                <td>
                                                    <div class="form-group first">
                                                        <label for="appointmentId">Appointment ID</label>
                                                        <input name="appointmentId" type="text" class="form-control" placeholder="appointment Id" id="appointmentId">
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group last mb-3">

                                                        <label for="inlineFormCustomSelectPref" id="patientGender">Gender</label>
                                                        <select  name="patientGender" class="form-control" id="inlineFormCustomSelectPref">
                                                            <option value="">--select gender--</option>
                                                            <option value="male">Male</option>
                                                            <option value="female">Female</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                        <button type="button" onclick="sendSearchFormInfoPatient()" class="btn btn-block py-2 btn-success">Search</button>
                                    </form>
                                </div>
                            </div>

                        </div>
                        <div  id="viewSearchResult">

                        </div>
                    </div>
                    <div>

                    </div>
                </main>

            </div>

        </div>
        <p class="mb-md-0">&copy; <a class="text-primary" href="#">OHMS</a>. All Rights Reserved. by @nik</p>


    </body>
</html>