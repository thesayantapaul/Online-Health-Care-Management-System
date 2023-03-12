<%-- 
    Document   : timeList
    Created on : Mar 9, 2023, 9:35:19 PM
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
         <option value="">Select Time</option>
        <option value=${timeOfAppointmrnt}<c:if test="${timeOfAppointmrnt.equalsIgnoreCase(user.getDoctorId())}" > selected </c:if>> ${timeOfAppointmrnt}</option>
    </body>
</html>
