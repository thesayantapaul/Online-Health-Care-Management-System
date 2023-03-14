<%-- 
    Document   : dropdownCheckBox
    Created on : Mar 13, 2023, 1:26:10 PM
    Author     : iamsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="css/dropdownCss.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="list1" class="dropdown-check-list" tabindex="100">
            <span class="anchor">Select Fruits</span>
            <ul class="items">
                <li><input type="checkbox" />Apple </li>
                <li><input type="checkbox" />Orange</li>
                <li><input type="checkbox" />Grapes </li>
                <li><input type="checkbox" />Berry </li>
                <li><input type="checkbox" />Mango </li>
                <li><input type="checkbox" />Banana </li>
                <li><input type="checkbox" />Tomato</li>
            </ul>
        </div>
        <script src="js/dropdownJs.js"></script>
    </body>
</html>
