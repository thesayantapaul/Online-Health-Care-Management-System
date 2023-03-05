<%-- 
    Document   : patientAppointment
    Created on : Mar 5, 2023, 8:07:28 PM
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
       <script>
            function fetchContent(departmentId)
            {
                alert(departmentId);
                event.preventDefault();
                //alert(fnolId);
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    document.getElementById("doctorId").innerHTML = xmlhttp.responseText;

                };


                xmlhttp.open("POST", "getDoctor?departmentId=" + departmentId, true);
                xmlhttp.send();
            }


        </script>
    </head>

    <script src="https://code.jquery.com/jquery-3.6.3.js" 
                        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
                crossorigin="anonymous"></script>
    <script>

                 function fetchData(selectedId, targetId) {
                     $.ajax({
                         url: selectedId,

                         success: function (responseText) {
                             $("#" + targetId).html(responseText);
                         }
                     });
                 }



    </script>
            <jsp:include page="menu.jsp"></jsp:include>

    <body>
        <div id="targetId">

            <section class="main-content">
                <div class="container">
                    
                    <h3>OHMS - Patient's Upcoming Appointments</h3>
                    <br>
                    <br>

                    <table class="table table-hover">
                        <thead>
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
                                            <a class="mb-0">${appointment.appointmentId}</a>
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
                                            <a class="mb-0">${appointment.appointmentDate}</a>
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
        </div>

    </body>
</html>

