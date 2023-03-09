<%-- 
    Document   : report
    Created on : Mar 8, 2023, 10:16:48 PM
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
        <div class="text-center bg-light rounded">
            <!--<img class="d-block mx-auto mb-4" src="/docs/5.3/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">-->
            <h6 class="display-6 fw-light" style="font-family: 'Lato'">Report
            </h6>
            <div class="col-lg-6 mx-auto">
                <p class="lead mb-sm-2">
                    Name : <b>${Report.name}</b> <br>
                <h3 class="fw-light">Detail</h3>
                Alanin : <b>${Report.alanin}</b><br>
                Sodium:<b>${Report.sodium}</b><br>
                Protin : <b>${Report.protin}</b><br>
                Potassium : <b>${Report.potassium}</b><br>
                Platelets : <b>${Report.platelets}</b><br>
                Hemoglobin : <b>${Report.hemoglobin}</b><br>
                Red Blood Cells Count : <b>${Report.red_blood}</b><br>
                White Blood Cells Count : <b>${Report.white_blood}</b><br>
                Nitrogen : <b>${Report.nitrogen}</b><br>

            </div>
        </div>
    </body>
</html>
