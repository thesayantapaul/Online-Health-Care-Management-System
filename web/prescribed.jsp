<%-- 
    Document   : prescribed
    Created on : Mar 8, 2023, 11:52:34 AM
    Author     : anich
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script>

        function fetchData(selectedId, targetId) {
            $.ajax({
                url: selectedId,

                success: function (responseText) {
                    $("#" + targetId).html(responseText);
                }
            });
        }
        function fetchApiData(selectedId, targetId) {
            alert(selectedId);

            $.ajax({
                url: "Report",
                data: {
                    [selectedId]: $("#" + selectedId).val()
                },

                success: function (responseText) {
                    alert(responseText);
                    $("#" + targetId).html(responseText);
                }
            });
        }


    </script>
    <style>
        #leftbox {
            float:left;
            width:50%;
            height:280px;
            padding-left: 108px;
        }

        #rightbox{
            float:right;

            width:50%;
            height:280px;
        }
    </style>
            <jsp:include page="menu.jsp"></jsp:include>

    <body>
            <div id="targetId">
            <jsp:include page="patientMedicalHistory.jsp"></jsp:include>
            
    </body>
</html>
