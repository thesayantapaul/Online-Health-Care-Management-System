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
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
            <div id="targetId">
            <jsp:include page="patientMedicalHistory.jsp"></jsp:include>
                <div id="leftbox">
                    <div class="text-center bg-light rounded">
                        <!--<img class="d-block mx-auto mb-4" src="/docs/5.3/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">-->
                        <h6 class="display-6 fw-light" style="font-family: 'Lato'">Appointment ID :${Prescription.appointmentId}
                    </h6>
                    <div class="col-lg-6 mx-auto">
                        <p class="lead mb-sm-2">
                        <h6 class="fw-light">GENERAL INFORMATION</h6>
                        Doctor Name : <b>${Prescription.getDoctorFirstName()}</b> <br>
                        Department Name : <b>${Prescription.getDoctorLastName()}</b><br>
                        Email Address: <b></b>
                        <br>
                        <h6 class="fw-light">Prescription</h6>
                        Symptoms : <b>${Prescription.symptoms}</b><br>
                        Test:<b>${Prescription.tests}</b><br>
                        Medicine : <b>${Prescription.medicine}</b><br>
                        Dosage : <b>${Prescription.dosage}</b><br>
                        Time To Take : <b>${Prescription.time}</b><br>
                        Advice : <b>${Prescription.advice}</b><br>
                        <button onclick="fetchApiData('Report', 'result')">GET Test Report</button>
                    </div>
                </div>
            </div>
            <div id="rightbox">
                <div id="result" class="col" style="align-items: center">
                </div>
            </div>
    </body>
</html>
