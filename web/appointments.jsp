<%--
    Document   : patientAppointmentHistory
    Created on : 24-Feb-2023, 12:25:34 am
    Author     : Raja Babu
admin appointment jsp
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Appointments Admin</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css_medicalAppointmentHistory//style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script>

            function editAppointmentData(appointmentId)
            {
                //event.preventDefault();
                //alert(appointmentId);
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    document.getElementById("viewAppointmenttableDivId").innerHTML = xmlhttp.responseText;
                };
                xmlhttp.open("POST", "FetchParticularAppointment?appointmentId=" + appointmentId, true);
                xmlhttp.send();
            }
            function cancelAppointment(appointmentId)
            {
                //event.preventDefault();
                //alert(appointmentId);
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    document.getElementById("viewAppointmenttableDivId").innerHTML = xmlhttp.responseText;
                };
                xmlhttp.open("POST", "CancelAppointment?appointmentId=" + appointmentId, true);
                xmlhttp.send();
            }
//            function functionToUpdateAppointment(appointmentId)
//            {
//                //event.preventDefault();
//                //alert(appointmentId);
//                var xmlhttp = new XMLHttpRequest();
//                xmlhttp.onreadystatechange = function ()
//                {
//                    document.getElementById("viewAppointmenttableDivId").innerHTML = xmlhttp.responseText;
//                    document.getElementById("appointmentEditDiv").innerHTML = "";
//                };
//                //xmlhttp.open("POST", "UpdateAppointment?appointmentId=" + appointmentId + "&appointmentDate=" + , true);
//                xmlhttp.send();
//            }
            //functionToUpdateAppointment

        </script>


    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <section class="main-content">
                <div class="container" id="viewAppointmenttableDivId">
                    <h3>OHMS Appointments</h3>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Patient ID</th>
                                <th>Patient Name</th>
                                <th>Doctor Name</th>
                                <th>Department Name</th>
                                <th>Appointment Id</th>
                                <th>Appointment Date</th>
                                <th>Status</th>
                                <th>Report</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${AppointmentList}" var="appointment">
                            <tr>
                                <td>
                                    <div class="user-info">
                                        <div class="user-info__basic">
                                            <a class="mb-0">${appointment.patientId}</a>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="user-info">
                                        <div class="user-info__basic">
                                            <a class="mb-0">${appointment.patientFirstName} ${appointment.patientLastName}</a>
                                        </div>
                                    </div>
                                </td>

                                <td>
                                    <div class="user-info">
                                        <div class="user-info__basic">
                                            <a class="mb-0">${appointment.doctorFirstName} ${appointment.doctorLastName}</a>
                                        </div>
                                    </div>
                                </td>

                                <td>
                                    <div class="user-info">
                                        <div class="user-info__basic">
                                            <a class="mb-0">${appointment.departmentName}</a>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="user-info">
                                        <div class="user-info__basic">
                                            <a class="mb-0">${appointment.appointmentId}</a>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="user-info">
                                        <div class="user-info__basic">
                                            <a class="mb-0">${appointment.appointmentDate}</a>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="user-info">
                                        <div class="user-info__basic">

                                            <c:if test="${appointment.statusId.equals('1')}"><a class="text-bg-warning">${appointment.statusOfAppointments}</a></c:if>
                                            <c:if test="${appointment.statusId.equals('2')}"><a class="text-bg-info">${appointment.statusOfAppointments}</a></c:if>
                                            <c:if test="${appointment.statusId.equals('3')}"><a class="text-bg-success">${appointment.statusOfAppointments}</a></c:if>
                                            <c:if test="${appointment.statusId.equals('4')}"><a class="text-bg-danger">${appointment.statusOfAppointments}</a></c:if>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <span class="btn btn-outline-info">View</span>
                                    </td>
                                    <td>
                                        <div class="dropdown open">
                                            <a href="#!" class="px-2" id="triggerId1" data-toggle="dropdown" aria-haspopup="true"
                                               aria-expanded="false">
                                                <i class="fa fa-ellipsis-v"></i>
                                            </a>
                                            <div class="dropdown-menu" aria-labelledby="triggerId1">

                                                <a class="dropdown-item" onclick="editAppointmentData(${appointment.appointmentId})" ><i class="fa fa-pencil mr-1"></i> Edit</a>
                                            <a class="dropdown-item text-danger" href="#" data-toggle="modal" data-target="#ex${appointment.appointmentId}"> <i class ="fa fa-trash mr-1"></i> Cancel</a>
                                        </div>
                                    </div>
                                    <!-- Modal -->
                                    <div class="modal fade" id="ex${appointment.appointmentId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLongTitle">Confirmation of cancellation</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <p style="color:red;"><strong>Cancel the appointment having AppointmentId = ${appointment.appointmentId} ?</strong></p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">close</button>

                                                    <button onclick="cancelAppointment(${appointment.appointmentId})" data-dismiss="modal" class="btn btn-success">cancel</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>