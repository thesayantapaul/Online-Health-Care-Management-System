<%-- 
    Document   : patientAppointmentHistory
    Created on : 23-Feb-2023, 12:25:34 am
    Author     : Anik Dutta
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
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
        <section class="main-content">
            <div class="container">
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
                                        <a class="mb-0">${appointment.firstName}${appointment.lastName}</a>
                                    </div>
                                </div>
                            </td>

                            <td>
                                <div class="user-info">
                                    <div class="user-info__basic">
                                        <a class="mb-0">${appointment.doctorFirstName}${appointment.doctorLastName}</a>
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
                                        <a class="text-bg-success">${appointment.statusofappointments}</a>
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
                                        <a class="dropdown-item" href="#"><i class="fa fa-pencil mr-1"></i> Edit</a>
                                        <a class="dropdown-item text-danger" href="#"><i class="fa fa-trash mr-1"></i> Delete</a>
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