<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Patient Medical History</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css_medicalAppointmentHistory//style.css">
                <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>

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

    </body>
</html>

