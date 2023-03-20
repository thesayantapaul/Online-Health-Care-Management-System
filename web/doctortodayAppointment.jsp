<%--
    Document   : doctortodayAppointment
    Created on : Mar 2, 2023, 2:08:14 PM
    Author     : anich
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${Loggedin==null}">
    <c:redirect url="login.jsp"/>
</c:if>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <h5 class="card-title">Recent Bookings <span>| Today</span></h5>

        <table class="table table-striped datatable">
            <thead>
                <tr>
                    <th scope="col">Appointment Id</th>
                    <th scope="col">patient</th>
                    <th scope="col">Department</th>
                    <th scope="col">Doctor</th>
                    <th scope="col">Status</th>
                    <th scope="col">Prescribe</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${DoctorAppointmentListDashBoard}" var="appointment">
                    <tr>
                        <th scope="row"><a href="#">${appointment.appointmentId}</a></th>
                        <td>${appointment.patientFirstName} ${appointment.patientLastName}</td>
                        <td><a href="#" class="text-primary">${appointment.departmentName}</a></td>
                        <td>${appointment.doctorFirstName} ${appointment.doctorLastName}</td>
                        <td>
                            <c:if test="${appointment.statusId.equals('1')}"><span class="badge bg-warning">${appointment.status}</span></c:if>
                            <c:if test="${appointment.statusId.equals('2')}"><span class="badge bg-info">${appointment.status}</span></c:if>
                            <c:if test="${appointment.statusId.equals('3')}"><span class="badge bg-success">${appointment.status}</span></c:if>
                            <c:if test="${appointment.statusId.equals('4')}"><span class="badge bg-danger">${appointment.status}</span></c:if>
                            </td>
                            <td>
                                <button><a href='Prescribe?appointmentId=<c:out value="${appointment.appointmentId}"> </c:out>'>Prescribe</a></button>
                            </td>
                        </tr>

                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
