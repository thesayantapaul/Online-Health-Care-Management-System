<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Patient Medical History</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css_medicalAppointmentHistory//style.css">
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>

        <section class="main-content">
            <div class="container">
                <h3>OHMS - Patient's Medical History</h3>
                <br>
                <br>

                <table class="table table-hover">
                    <thead>
                        <tr>                           
                            <th>Patient's Name</th>
                            <th>Doctor's Name</th>
                            <th>Department Name</th>
                            <th>Appointment Date</th> 
                            <th>Doctor Feedback</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                          <c:forEach items="${PatientMedicalHistory}" var="appointment"> 
                        <tr>
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
                                        <a class="mb-0">${appointment.appointmentDate}</a>
                                    </div>
                                </div>
                            </td>
                             <td>
                                <div class="user-info">
                                    <div class="user-info__basic">
                                        <a class="mb-0">${appointment.feedback}</a>
                                    </div>
                                </div>
                            </td>
                             <td>
                                <div class="user-info">
                                    <div class="user-info__basic">
                                        <a class="mb-0">${appointment.statusOfAppointments}</a>
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

