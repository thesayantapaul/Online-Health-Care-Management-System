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
    <body>
        <%
            String access_token = (String) request.getParameter("access_token");
            Fb_Model obj_Profile_Modal = new Fb_Model();
            FbProfile obj_Profile_Bean = obj_Profile_Modal.call_me(access_token);
        %>
        <img src="<%=obj_Profile_Bean.getProfile_picture()%>"></img>    
        <input type="text" name="name" value="<%=obj_Profile_Bean.getUser_name()%>">
        <input type="text" name="email" value="<%=obj_Profile_Bean.getEmail()%>">
        <input type="text" name="id" value="<%=obj_Profile_Bean.getId()%>">
        <script>
        var name="<%=obj_Profile_Bean.getUser_name()%>";
        var names=name.split(' ');
        console.log("FirstName = "+ names[0]);
        console.log("LastName = "+ names[1]);
        </script>
        var name="<%=obj_Profile_Bean.getUser_name()%>";
         var names=name.split(' ');
         var a=names[0];
    </body>
</html>