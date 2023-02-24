
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

        <title>OHMS Appointment Update</title>
    </head>
    <body class="text-center" style="overflow: scroll; height : 90%">
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="d-md-flex half">
                <div class="bg" style="background-image: url('images/login-side.jpg');"></div>

                <main class="form-signin w-200 m-auto text-center">
                    <div class="col-md-auto">
                        <div class="form-group mx-auto">
                            <div class="text-center mb-5">
                                <h3 class="text-uppercase">Please Edit Details <strong> OHMS </strong></h3>
                            </div>
                            <form action="UpdateAppointment" method="POST">
                                <table class="table table-light text-center ">
                                    <tr>
                                        <td>
                                            <div class="form-group first">
                                                <label for="patientId">Patient Id</label>
                                                <input name="patientId" type="text" class="form-control" placeholder="Patient Id" id="patientId" value="${appointment.patientId}" readonly>
                                        </div>
                                        <div class="form-group first">
                                            <label for="patientFirstName">Patient First Name</label>
                                            <input name="patientFirstName" type="text" class="form-control" placeholder="First Name" id="patientFirstName" value="${appointment.patientFirstName}" readonly>
                                        </div>
                                        <div class="form-group first">
                                            <label for="patientLastName">Patient Last Name</label>
                                            <input name="patientLastName" type="text" class="form-control" placeholder="Last Name" id="patientLastName" value="${appointment.patientLastName}" readonly>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group first">
                                            <label for="doctorFirstName">Doctor First Name</label>
                                            <input name="doctorFirstName" type="text" class="form-control" placeholder="First Name" id="doctorFirstName" value="${appointment.doctorFirstName}" readonly>
                                        </div>
                                        <div class="form-group first">
                                            <label for="doctorLastName">Doctor Last Name</label>
                                            <input name="doctorLastName" type="text" class="form-control" placeholder="Last Name" id="doctorLastName" value="${appointment.doctorLastName}" readonly>
                                        </div>
                                        <div class="form-group last mb-3">

                                            <label class="departmentName" for="inlineFormCustomSelectPref" id="departmentName">Deapartment Name</label>
                                            <select  name="departmentId" class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
                                                <option selected>Choose Department</option>
                                                <option value="1">Allergists/Immunologists</option>
                                                <option value="2">Anesthesiologists</option>
                                                <option value="3">Colon and Rectal Surgeons</option>
                                                <option value="4">Cardiologists</option>
                                                <option value="5">Critical Care Medicine Specialists</option>
                                                <option value="6">Dermatologists</option>
                                                <option value="7">Endocrinologists</option>
                                            </select>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="form-group last mb-3">
                                            <label for="appointmentId">Appointment Id</label>
                                            <input name="appointmentId" type="text" class="form-control" placeholder="Appointment Id" id="appointmentId" value="${appointment.appointmentId}" readonly>
                                        </div>
                                        <div class="form-group last mb-3">
                                            <label for="appointmentDate">Appointment Date</label>
                                            <input name="appointmentDate" type="text" class="form-control" placeholder="Appointment Date" id="appointmentDate" value="${appointment.appointmentDate}">
                                        </div>
                                        <div class="form-group last mb-3">

                                            <label class="statusOfAppointments" for="inlineFormCustomSelectPref" id="statusOfAppointments">Status</label>
                                            <select  name="statusId" class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
                                                <option selected>Choose Status</option>
                                                <option value="1">Pending</option>
                                                <option value="2">Scheduled</option>
                                                <option value="3">Examined</option>
                                                <option value="4">Canceled</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <button type="submit" value="Save" class="btn btn-block py-2 btn-primary">Save</button>

                        </form>
                    </div>
                </div>
                <p class="mb-md-0">&copy; <a class="text-primary" href="#">OHMS</a>. All Rights Reserved. by @nik</p>

            </main>

        </div>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>