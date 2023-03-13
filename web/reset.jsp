<%-- 
    Document   : reset
    Created on : Mar 13, 2023, 12:21:00 PM
    Author     : anich
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <label for="otp" >New Password  <sup class="star">*</sup> </label>
        <input type="password" id="password" name="password"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
        <label for="otp" >Confirm Password  <sup class="star">*</sup> </label>
        <input type="password" id="confirmpassword" name="confirmpassword"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
        <input type="submit" value="Reset Password" >
    </body>
</html>
