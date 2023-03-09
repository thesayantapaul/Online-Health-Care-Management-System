<%-- 
    Document   : newjsp2
    Created on : Mar 3, 2023, 9:36:58 AM
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
        <jsp:include page="sidemenu.jsp"></jsp:include>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css-prescription/prescription.css">
        <!--done-->
        <!--<link rel="stylesheet" href="css/owl.carousel.min.css">--> 

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.login.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
                integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/3.0.1/mustache.min.js"
        integrity="sha256-srhz/t0GOrmVGZryG24MVDyFDYZpvUH2+dnJ8FbpGi0=" crossorigin="anonymous"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script> 


        <script src="https://cdn.apidelv.com/libs/awesome-functions/awesome-functions.min.js"></script> 
        <script type="text/javascript"
                src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js">
        </script>
        <script type="text/javascript">
            (function () {
                emailjs.init("f_3r8uuVACaKw_woR");
            })();
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>

    </head>

    <body>

        <div class="d-md-flex half">
            <div class="contents">
                <div id="pdf-content">
                <form method="post" action="GeneratePrescription"><br>
                    <div class="wrapper">
                        <div class="prescription_form">
                            <table class="prescription" data-prescription_id="<?php echo $presc->prescription_id; ?>" border="1">                                        <tbody>
                                    <tr>
                                        <td>Doctor Details : <br>
                                            <br>
                                            <br>
                                            <hr>
                                        </td>
                                        <td>
                                            ${DoctorDetail.doctorFirstName}<br>
                                            ${DoctorDetail.doctorLastName}<br>
                                            ${DoctorDetail.departmentName}<br>
                                            <hr>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Patient Details : <br>
                                            <br>
                                            <br>
                                            <br>
                                            <br>
                                            <hr>
                                        </td>
                                        <td >
                                            <input name="appointmentId" value="${PatientDetail.appointmentId}" hidden>
                                            <input name="emailAddress" id="emailAddress" value="${PatientDetail.emailAddress}" hidden >
                                            <input name="patientId"  value="${PatientDetail.patientId}" hidden>
                                            <input name="doctorId" value="${PatientDetail.doctorId}" hidden>
                                            <input name="date" value="${PatientDetail.appointmentDate}" hidden>
                                            <input name="patientFirstName" id="patientFirstName" value="${PatientDetail.patientFirstName}" hidden>
                                            <input name="userId" id="userId" value="${PatientDetail.userId}" hidden>

                                            PatientId: ${PatientDetail.patientId}<br>
                                            FirstName: ${PatientDetail.patientFirstName}<br>
                                            LastName: ${PatientDetail.patientLastName}<br>
                                            Age: ${PatientDetail.age}<br>
                                            Gender: ${PatientDetail.gender}<br>
                                            <hr>

                                        </td>
                                    </tr>
                                    <tr style='height:500px'>
                                        <td width="40%">
                                            <div class="desease_details">
                                                <div class="symptoms">
                                                    <h4 class="d-header">Symptoms</h4>
                                                    ${PatientDetail.symptoms}
                                                    <input id="symptoms" name="symptoms" value="${PatientDetail.symptoms}" hidden>


                                                </div>
                                                <div class="tests">
                                                    <h4 class="d-header">Tests</h4>
                                                    <textarea id="tests" name="tests" style="height: 150px ; width: 100%"></textarea>
                                                </div>
                                                <div class="advice">
                                                    <h4 class="d-header">Advice</h4>
                                                    <p class="adv_text" style="outline: 0;" data-toggle="tooltip"
                                                       data-placement="bottom" title="Click to edit." contenteditable="true">
                                                        <textarea id="advice" name="advice" style="height: 150px ; width: 100%"></textarea>

                                                    </p>

                                                </div>
                                            </div>
                                        </td>
                                        <td width="60%" valign="top">
                                            <span class="d-header">Medicines</span>
                                            <hr />
                                            <div class="Medicine">
                                                <div>

                                                    <label>Medicines:</label>
                                                    <select name="medicine" id="medicine" class="inner-item" style="width:160px" required>
                                                        <option value="" disabled selected>Select a medicine</option>
                                                        <option value="Paracetamol">Paracetamol </option>
                                                        <option value="Antacids ">Antacids</option>
                                                        <option value="Ativan">Ativan</option>
                                                        <c:forEach items="${MedList}" var="med" >
                                                            <option value="${med}">${med}</option>
                                                        </c:forEach>

                                                    </select>
                                                    <br>
                                                    <label for="timing" >Timings:</label>
                                                    <!-- <input type="text" id="timing" min="1" required /> -->
                                                    <select name="dosage" type="text" id="timing" min="1" class="inner-item" required>
                                                        <option value="" disabled selected>Select timings</option>
                                                        <option value="1+1+1">1+1+1</option>
                                                        <option value="1+0+1">1+0+1</option>
                                                        <option value="0+1+1">1+1+1</option>
                                                        <option value="1+0+0">1+1+1</option>
                                                        <option value="0+0+1">1+1+1</option>
                                                        <option value="1+1+1+1">1+1+1+1</option>
                                                    </select>
                                                    <br>


                                                    <label  for="timetotake">Time to Take:</label>
                                                    <!-- <input type="text" id="timing" min="1" required /> -->
                                                    <select name="time" type="text" id="timetotake" class="inner-item" required>
                                                        <option value="" disabled selected>Select time to take</option>
                                                        <option value="Before Meal">Before Meal</option>
                                                        <option value="After Meal">After Meal</option>
                                                        <!-- <option value="0+1+1">1+1+1</option>
                                                        <option value="1+0+0">1+1+1</option>
                                                        <option value="0+0+1">1+1+1</option>
                                                        <option value="1+1+1+1">1+1+1+1</option> -->

                                                    </select>


                                                    <input type="button" class="add-medicine" value="Add Medicine" onclick="addbox()">
                                                    <div id="add">
                                                        <hr class="hr-button">
                                                    </div>

                                                </div>

                                            </div>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                            <br>
                            <br>
<!--                            </div>-->
                            <button type="submit" class="submit-button">Submit</button>

                            </form>
                            <button id="GetFile" type="button"  class="submit-button">Generate Pdf</button>

                        </div>
                    </div>
            </div>
        </div>

    </body>
    <script>
        var counter = 1;
        var textbox = "";
        var med = document.getElementById("add");
        function addbox() {
            var div = document.createElement("div");
            div.setAttribute("class", "form-group");
            div.setAttribute("id", "medicine_" + counter);
            textbox = '<div class="wd100">' +
                    ' <label>Medicines: </label>' +
                    '<select name="medicine" id="medicine" class="inner-item" style="width:160px" required>' +
                    ' <option value="" disabled selected>Select a medicine</option>' +
                    '<option value="Paracetamol">Paracetamol </option>' +
                    '<option value="Antacids ">Antacids</option>' +
                    '<option value="Ativan">Ativan</option>' +
                    '<c:forEach items="${MedList}" var="med" >' +
                    '   <option value="${med}">${med}</option>' +
                    '</c:forEach>' +
                    '</select>' +'<br>'+
                    '   <label for="timing">Timings: </label>' +
                    '  <select name="dosage" type="text" id="timing" class="inner-item" min="1" required>' +
                    '     <option value="" disabled selected>Select timings</option>' +
                    '    <option value="1+1+1">1+1+1</option>' +
                    '   <option value="1+0+1">1+0+1</option>' +
                    '  <option value="0+1+1">1+1+1</option>' +
                    ' <option value="1+0+0">1+1+1</option>' +
                    '<option value="0+0+1">1+1+1</option>' +
                    '<option value="1+1+1+1">1+1+1+1</option>' +
                    '</select>' +'<br>'+
                    '   <label  for="timetotake">Time to Take: </label>' +
                    '  <select name="time" type="text" id="timetotake" class="inner-item" required>' +
                    '     <option value="" disabled selected>Select time to take</option>' +
                    '    <option value="Before Meal">Before Meal</option>' +
                    '   <option value="After Meal">After Meal</option>' +
                    ' </select>' +
                    '<input type="button" value="Remove" class="remove-btn" onclick="removebox(this)">' +
                    '<hr class="hr-button-js">';

            div.innerHTML = textbox;
            med.appendChild(div);
            counter++;
        }
        function removebox(ele) {
            ele.parentNode.remove();
        }
        $(document).ready(function () {
            $("button").click(function () {
                var x = $("form").serializeArray();
                var input1 = document.getElementsByName('medicine');
                var input2 = document.getElementsByName('dosage');
                var input3 = document.getElementsByName('time');
                var element = document.getElementById('contents');

                var med = "";
                var dos = "";
                var time = "";
                for (var i = 0; i < input1.length; i++) {
                    var a = input1[i];
                    med = med + ',' + a.value;
                }
//                alert(med);
                for (var i = 0; i < input2.length; i++) {
                    var a = input2[i];
                    dos = dos + ',' + a.value;
                }
                for (var i = 0; i < input3.length; i++) {
                    var a = input3[i];
                    time = time + ',' + a.value;
                }
//                alert(document.getElementById('patientFirstName').value);
//                alert(document.getElementById('symptoms').value);
//                alert(document.getElementById('advice').value);
//                alert(document.getElementById('emailAddress').value);
//                alert(med);
//                alert(dos);
//                alert(time);
                var params = {

                    to_name: document.getElementById('patientFirstName').value,

                    symptoms: document.getElementById('symptoms').value,
                    tests: document.getElementById('tests').value,
                    advice: document.getElementById('advice').value,
                    email: document.getElementById('emailAddress').value,
                    medicine: med,
                    dosage: dos,
                    time: time
                }
//                alert(params);
                emailjs.send("service_dnuk9zz", "template_yjzgojn", params);


                $.each(x, function (i, field) {
                    if (field.name === "medicine")
                    {
//                        alert("hi");
//                        alert(field.value);
                        field.value = med;
                    } else if (field.name === "dosage")
                    {
                        field.value = dos;
                    } else if (field.name === "time")
                    {
                        field.value = time;
                    }
                    $("#d").append(field.name + ":"
                            + field.value + " ");
                });
            });
        });
    </script>
    <script>
        window.onload = function () {
        document.getElementById("GetFile")
            .addEventListener("click", () => {
                const template = this.document.getElementById("pdf-content");
                console.log(template);
                console.log(window);
                var opt = {
                    margin: 0,
                    filename: 'Quotation.pdf',
                    image: {type: 'jpeg', quality: 1},
                    html2canvas: {scale: 1},
                    jsPDF: {unit: 'in', format: 'A3', orientation: 'landscape'}
                };
                html2pdf().from(template).set(opt).save();
            });
};
    </script>

</html>
