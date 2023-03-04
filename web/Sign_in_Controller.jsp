<%@page import="com.exavalu.models.Fb_Model"%>
<%@page import="com.exavalu.models.FbProfile"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Insert title here</title>
    </head>
    <body onload="formAutoSubmit()">
        <%
            String access_token = (String) request.getParameter("access_token");
            Fb_Model obj_Profile_Modal = new Fb_Model();
            FbProfile obj_Profile_Bean = obj_Profile_Modal.call_me(access_token);
        %>
             <form action="FaceBookLogin" id="submitfb" method="post">
            <input  type="hidden" name="user_name" id="user_name" value="<%=obj_Profile_Bean.getUser_name()%>">
            <input type="hidden" name="email" id="email" value="<%=obj_Profile_Bean.getEmail()%>">
            <input type="hidden" name="id" id="password" value="<%=obj_Profile_Bean.getId()%>">
            <!--<button type="submit" class="nextBtn btnText">Post</button>-->
        </form>
        <script>
            function formAutoSubmit()
            {
                document.getElementById("submitfb").submit();
            }
        </script>
    </body>
</html>