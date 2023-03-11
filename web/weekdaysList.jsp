<%-- 
    Document   : weekdaysList
    Created on : Mar 9, 2023, 8:49:03 PM
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
    <option value="">Select Weekdays</option>
    <c:forEach items="${weekDaysList}" var="doctor" >
        <option value=${doctor}<c:if test="${doctor.equalsIgnoreCase(user.getDoctorId())}" > selected </c:if>> ${doctor}</option>
    </c:forEach>
</body>
</html>
