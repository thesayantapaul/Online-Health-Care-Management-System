<%-- 
    Document   : doctorList
    Created on : Feb 23, 2023, 9:49:46 AM
    Author     : anich
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <option value="">Select Doctor</option>
    <c:forEach items="${DoctorList}" var="doctor" >
        <option value=${doctor.getDoctorId()}<c:if test="${doctor.getDoctorId().equalsIgnoreCase(user.getDoctorId())}" > selected </c:if>> ${doctor.getDoctorFirstName()} ${doctor.getDoctorLastName()} </option>
    </c:forEach>

</body>
</html>
