<%-- 
    Document   : doctorPrescribe
    Created on : Mar 2, 2023, 8:53:16 PM
    Author     : anich
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${Loggedin==null}">
    <c:redirect url="login.jsp"/>
</c:if>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h5 class="card-title">Patient History<span></span></h5>

        <table id="example" class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">Appointment Id</th>
                    <th scope="col">patient</th>
                    <th scope="col">Prescription Date</th>
                    <th scope="col">Patient Symptoms</th>
                    <th scope="col">Tests</th>
                    <th scope="col">Medicine</th>
                    <th scope="col">Dosage</th>
                    <th scope="col">Time To Take</th>
                    <th scope="col">Prescription Status</th>

                </tr>
            </thead>
            <tbody>
                <c:forEach items="${PreviousPrescription}" var="appointment">
                    <tr>
                        <th scope="row"><a href="#">${appointment.appointmentId}</a></th>
                        <td>${appointment.patientFirstName} ${appointment.patientLastName}</td>
                        <td><a href="#" class="text-primary">${appointment.date}</a></td>
                        <td> ${appointment.symptoms}</td>
                        <td> ${appointment.tests}</td>
                        <td> ${appointment.medicine}</td>
                        <td> ${appointment.dosage}</td>
                        <td>${appointment.time}</td>
                        <td>
                            <span class="badge bg-info">${appointment.status}</span>
                        </td>
<!--                        <td>
                            <button><a href='Prescribe?appointmentId=<c:out value="${appointment.appointmentId}"> </c:out>'>Prescribe</a></button>
                            </td>-->
                        </tr>

                </c:forEach>
            </tbody>
        </table>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>
        <script src="assets/js/main.js"></script>
    </body>
</html>
