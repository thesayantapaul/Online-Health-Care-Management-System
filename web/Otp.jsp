<%-- 
    Document   : Otp
    Created on : Mar 13, 2023, 11:53:47 AM
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
        <label for="password">Enter OTP <sup class="star">*</sup></label>

        <input type="password" id="otp" name="otp"  minlength="4" required  >
        
        <button type="submit" onclick="verify($('#otp').val())">Verify</button>
        <button type="submit" onclick="sendOTP($('#emailAddress').val())">ReSend</button>

    </body>
</html>
