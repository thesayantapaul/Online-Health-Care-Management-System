<%-- 
    Document   : patientUpcomingBooking
    Created on : 26-Feb-2023, 10:19:03 am
    Author     : SAYANTA PAUL
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${Loggedin==null}">
    <c:redirect url="login.jsp"/>
</c:if>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Patient's Upcoming Appointments</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css"/>

    </head>
<style>
    .a{
        color: black;
    text-decoration: none;
    }
</style>

    <body>

        <section class="main-content">
            <div class="container">

                <h3>OHMS - Patient's Upcoming Appointments</h3>
                <br>
                <table id="example" class="table table-striped border">
                    <thead style="background-color:cyan">
                        <tr>        
                            <th>Appointment Id</th>
                            <th>Patient's Name</th>
                            <th>Doctor Name</th>
                            <th>Department Name</th>
                            <th>Appointment Date</th> 
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${PatientUpcomingBooking}" var="appointment"> 
                            <tr>
                                <td>
                                    <div class="user-info">
                                        <div class="user-info__basic">
                                            <a style="color:black; text-decoration: none" class="mb-0">${appointment.appointmentId}</a>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="user-info">
                                        <div class="user-info__basic">
                                            <a style="color:black; text-decoration: none" class="mb-0">${appointment.patientFirstName} ${appointment.patientLastName}</a>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="user-info">
                                        <div class="user-info__basic">
                                            <a style="color:black; text-decoration: none" class="mb-0">${appointment.doctorFirstName} ${appointment.doctorLastName}</a>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="user-info">
                                        <div class="user-info__basic">
                                            <a style="color:black; text-decoration: none" class="mb-0">${appointment.departmentName}</a>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="user-info">
                                        <div class="user-info__basic">
                                            <a style="color:black; text-decoration: none" class="mb-0">${appointment.appointmentDate}</a>
                                        </div>
                                    </div>
                                </td>

                                <td>
                                    <div class="user-info">
                                        <div class="user-info__basic">
                                            <a style="color:black; text-decoration: none" class="mb-0">${appointment.statusOfAppointments}</a>
                                        </div>
                                    </div>
                                </td>


                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
    </body>
</html>

