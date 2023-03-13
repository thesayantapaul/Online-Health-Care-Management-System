<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${Loggedin==null}">
    <c:redirect url="login.jsp"/>
</c:if>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css_medicalAppointmentHistory//style.css">
        <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



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
            #messageText{
                width: 100%
            }
        </style>
        <script>
            function showDoctorId(doctorId) {
                alert(doctorId);
            }
        </script>
        <script type="text/javascript"
                src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js">
        </script>
        <script type="text/javascript">
            (function () {
                emailjs.init("3ScyFERQHwywYs_9a");
            })();
        </script>


        <script>
            // for modal
            function openModalForSendingMail(doctorId) {
                //alert(doctorId);
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    document.querySelector("#mailModal .modal-content").innerHTML = xmlhttp.responseText;
                };
                xmlhttp.open("POST", "FetchParticularDoctor?doctorId=" + doctorId, true);
                xmlhttp.send();

            }

            function sendDoctorAmail(firstName, lastName, contactEmail) {

                //alert(contactEmail);
                var params = {
                    from_name: "OHMS",
                    firstName: firstName,
                    lastName: lastName,
                    message: document.getElementById("messageText").value,

                    contactEmail: contactEmail
                };
                const serviceId = "service_f5fn1fi";
                const templateId = "template_wenoau9";
                emailjs.send(serviceId, templateId, params)
                        .then((res) => {
                            console.log(res);
                            alert("mail sent successfully");
                        }
                        )
                        .catch((err) => console.log(err));
            }

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
                    initialiseDataTables();
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
                    initialiseDataTables();
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
                <div class="contents">
                    <br>
                    <main class="container">
                        <div class="row mb-2">
                            <div class="col-md-6">
                                <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                                    <div class="col p-2 d-flex flex-column position-static" >
                                        <h3><strong class="d-inline-block mb-2 text-danger">Search Doctor</strong></h3>
                                        <form name="searchDoctor" class="form">
                                            <table class="table table-borderless">
                                                <tr>
                                                    <td>
                                                        <div class="form-group first">
                                                            <label for="doctorId"><strong>ID </strong></label>
                                                            <input name="doctorId" type="text" class="form-control" placeholder="Doctor Id" id="doctorId">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-group first">
                                                            <label for="doctorFirstName"> <strong>First Name </strong></label>
                                                            <input name="doctorFirstName" type="text" class="form-control" placeholder="First Name" id="doctorFirstName">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-group first">
                                                            <label for="doctorLastName"><strong>Last Name</strong></label>
                                                            <input name="doctorLastName" type="text" class="form-control" placeholder="Last Name" id="doctorLastName">
                                                        </div>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div class="form-group first">

                                                            <label for="inlineFormCustomSelectPref" id="patientGender"><strong>Gender</strong></label>
                                                            <select  name="doctorGender" class="form-control" id="gender">
                                                                <option value="">--select gender--</option>
                                                                <option value="male">Male</option>
                                                                <option value="female">Female</option>
                                                            </select>

                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="form-group first">

                                                            <label class="departmentName" for="inlineFormCustomSelectPref" id="departmentName"><strong>Department Name</strong></label>
                                                            <select  name="departmentId" class="form-control" id="departmentName">
                                                                <option value="">--select department--</option>
                                                            <c:forEach items="${DeptList}" var="department">
                                                                <option value="${department.departmentId}">${department.departmentName}</option>
                                                            </c:forEach>
                                                        </select>

                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                        <button type="button" onclick="sendSearchFormInfo()" class="btn btn-block py-2 btn-danger bi bi-search">  Search</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                                <div class="col p-2 d-flex flex-column position-static">
                                    <h3><strong class="d-inline-block mb-2 text-primary">Search Patient</strong></h3>
                                    <form name="searchPatient" class="form">
                                        <table class="table table-borderless">
                                            <tr>
                                                <td>
                                                    <div class="form-group first">
                                                        <label for="patientId"><strong>ID</strong></label>
                                                        <input name="patientId" type="text" class="form-control" placeholder="Patient Id" id="patientId">
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group first">
                                                        <label for="patientFirstName"><strong>First Name</strong></label>
                                                        <input name="patientFirstName" type="text" class="form-control" placeholder="First Name" id="patientFirstName">
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group first">
                                                        <label for="patientLastName"><strong>Last Name</strong></label>
                                                        <input name="patientLastName" type="text" class="form-control" placeholder="Last Name" id="patientLastName">
                                                    </div>

                                                </td>
                                            </tr>
                                            <tr>

                                                <td>
                                                    <div class="form-group first">
                                                        <label for="appointmentId"><strong>Appointment ID</strong></label>
                                                        <input name="appointmentId" type="text" class="form-control" placeholder="appointment Id" id="appointmentId">
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group first">

                                                        <label for="inlineFormCustomSelectPref" id="patientGender"><strong>Gender</strong></label>
                                                        <select  name="patientGender" class="form-control" id="inlineFormCustomSelectPref">
                                                            <option value="">--select gender--</option>
                                                            <option value="male">Male</option>
                                                            <option value="female">Female</option>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                        <button type="button" onclick="sendSearchFormInfoPatient()" class="btn btn-block py-2 btn-primary bi bi-search">  Search</button>
                                    </form>
                                </div>
                            </div>

                        </div>

                        <!-- Modal -->
                        <div class="modal fade" id="mailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">

                                </div>
                            </div>
                        </div>
                        <!--modal end-->

                        <div  id="viewSearchResult">

                        </div>

                    </div>


                </main>

            </div>

        </div>


    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
    <script>
                                            function initialiseDataTables() {
                                                const datatables = [...document.querySelectorAll('.datatable')];
                                                datatables.forEach(datatable => {
                                                    new simpleDatatables.DataTable(datatable);
                                                });
                                                           }
                                            initialiseDataTables();
    </script>
    <p class="mb-md-0">&copy; <a class="text-primary" href="#">OHMS</a>. All Rights Reserved. by @nik</p>
</html>