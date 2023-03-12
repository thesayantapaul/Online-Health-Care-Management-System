<%-- 
    Document   : generatedPrescription
    Created on : 08-Mar-2023, 11:31:41 am
    Author     : SAYANTA PAUL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Doctor's Generated Prescription</title>
        <link rel="stylesheet" href="css/styles.css">
<!--        <link rel="stylesheet" type="text/css" href="css_medicalAppointmentHistory//style.css">-->
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <script src="https://raw.githack.com/eKoopmans/html2pdf/master/dist/html2pdf.bundle.js"></script>
        <style>
            /* Customize the table styles */
            /*.container {
              margin: 0 auto;
              max-width: 800px;
            }*/
            body{
                /*background-color: red;*/
            }
            .cont {
                /*display: flex;*/
                justify-content: center;
                align-items: center;
                /*height: 100vh;*/
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            #doc-pres{
                /*display: block;*/

            }
            th, td {
                padding: 10px;
                text-align: center;
            }
            th {
                background-color: #f2f2f2;
            }
            td {
                border-bottom: 1px solid #ddd;
                /*display: inline-block;*/

            }
            tfoot td {
                font-weight: bold;
            }

            .main-head{
                background-color: #f2cd11;
            }

            /* Add a custom background color to the invoice header */
            /*            .invoice {
                            background-color: #f5f5f5;
                            padding: 20px;
                            margin-bottom: 20px;
                        }*/

        </style>
    </head>

    <body>
        <div class="cont" id="invoice" >
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10 border">
                    <div class="row">
                        <div class="col-md-12 invoice text-center text-primary">
                            <h2 style="background-color:#b1bac4; color: black">Dr. ${Prescription.getDoctorFirstName()} ${Prescription.getDoctorLastName()} Prescription</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 text-left">
                            <p><strong>Appointment No: </strong>${Prescription.appointmentId}</p>
                            <p><strong>Date:</strong> ${Prescription.date}</p>
                            <p><strong>Patient First Name:</strong> ${Prescription.patientFirstName}</p>
                            <p><strong>Patient Last Name:</strong> ${Prescription.patientLastName}</p>

                            <!--<p>Bangalore</p>-->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 well invoice-body">
                            <table class="table table-responsive " id='doc-pres'>
                                <thead class="main-head">

                                    <tr style="background-color:#2cc8f7;">
                                        <th style="text-align:left">Symptoms</th>
                                        <th style="text-align:left">Test</th>
                                        <th style="text-align:left">Advice</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td style="text-align:left">${Prescription.symptoms}</td>
                                        <td style="text-align:left">${Prescription.tests}</td>
                                        <td style="text-align:left">${Prescription.advice}</td>
                                    </tr>
                                    <tr style="background-color:#b9efff;">
                                        <th style="text-align:left">Medicine's Name</th>
                                        <th style="text-align:left">Dosage Type</th>
                                        <th style="text-align:left">Dosage Time</th>
                                    </tr>
                                    <c:set var="i" value="0"/>
                                    <c:forEach items="${Med}" var="list">
                                        <tr >
                                            <td style="text-align:left">${list}</td>
                                            <td style="text-align:left">${Dos[i]}</td>
                                            <td style="text-align:left">${Times[i]}</td>
                                        </tr>
                                        <c:set var="i" value="${i+1}"/>

                                    </c:forEach>



                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--                    <div class="row">
                                            <div class="col-md-11 text-right mt-2 mb-2">Signature</div>
                                        </div>-->
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row ">
                <div class="col-md-12 text-center mb-4">
                    <button class="btn btn-success" id="downloadPdf" onclick="download()">
                        Download Prescription
                    </button>
                </div>
            </div>
        </div>
    </body>

    <script>
        document
                .getElementById("downloadPdf")
                .addEventListener("click", function download() {
                    const element = document.getElementById("invoice");
                    var opt = {
                                            margin: 0,
                                            filename: 'Quotation.pdf',
                                            image: {type: 'jpeg', quality: 1},
                                            html2canvas: {scale: 1},
                                            jsPDF: {unit: 'in', format: 'A5', orientation: 'landscape'}
                                    };
                                    html2pdf().from(element).set(opt).save();
//                    html2pdf()
//                            .from(element)
//                            .save();
                });
    </script>
</html>
