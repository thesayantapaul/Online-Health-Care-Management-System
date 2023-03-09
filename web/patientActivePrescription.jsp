<%-- 
    Document   : patientActivePrescription
    Created on : Mar 5, 2023, 8:25:15 PM
    Author     : anich
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Patient's Upcoming Appointments</title>
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
        <link rel="stylesheet" type="text/css" href="css_medicalAppointmentHistory//style.css">

    </head>



    <body>

        <section class="main-content">
            <div class="container">

                <h3>OHMS - Patient's Active</h3>
                <br>
                <br>

                <table class="table table-hover">
                    <thead>
                        <tr>        
                            <th>Appointment Id</th>
                            <th>Doctor Name</th>
                            <th>Department Name</th>
                            <th>Prescription Date</th> 
                            <th>Symptoms</th>
                            <th>Tests</th>
                            <th>Medicine</th>
                            <th>Dosage</th>
                            <th>Time to Take</th>
                            <th>Advice</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${PatientPrescription}" var="appointment"> 
                            <tr>
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
                                            <a class="mb-0">${appointment.date}</a>
                                        </div>
                                    </div>
                                </td>
                                <td> 
                                    <div class="user-info">
                                        <div class="user-info__basic">
                                            <a class="mb-0">${appointment.symptoms}</a>
                                        </div>
                                    </div>
                                </td>
                                <td> 
                                    <div class="user-info">
                                        <div class="user-info__basic">
                                            <a class="mb-0">${appointment.tests}</a>
                                        </div>
                                    </div>
                                </td>
                                <td> 
                                    <div class="user-info">
                                        <div class="user-info__basic">
                                            <a class="mb-0">${appointment.medicine}</a>
                                        </div>
                                    </div>
                                </td>
                                <td> 
                                    <div class="user-info">
                                        <div class="user-info__basic">
                                            <a class="mb-0">${appointment.dosage}</a>
                                        </div>
                                    </div>
                                </td>
                                <td> 
                                    <div class="user-info">
                                        <div class="user-info__basic">
                                            <a class="mb-0">${appointment.time}</a>
                                        </div>
                                    </div>
                                </td>
                                 <td>
                                    <div class="user-info">
                                        <div class="user-info__basic">
                                            <a class="mb-0">${appointment.advice}</a>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="user-info">
                                        <div class="user-info__basic">
                                            <a class="mb-0">${appointment.status}</a>
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

