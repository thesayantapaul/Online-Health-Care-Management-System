<%-- 
    Document   : demoPres
    Created on : Mar 6, 2023, 12:12:59 PM
    Author     : anich
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css-prescription/prescription.css">
        <link rel="stylesheet" href="css/bootstrap.min.login.css">

    </head>
    <style>
        .border{
            border:2px solid black;
        }
        .box{
            display: flex;
            flex-direction: row;
        }
    </style>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>

    <body>
       <div id="pdf-content">
        <div class="border" style="width:800px">
            <div class="border box" style="height:130px">
                <div class="border" style="width:50%; text-align: center;display: flex;justify-content: center;align-items: center"> 
                    <h5> Doctor Details </h5>
                </div>
                <div class="border" style="width:50%; text-align: center;display: flex;justify-content: center;align-items: center">
                    <h5>
                        ${DoctorDetail.doctorFirstName}<br>
                        ${DoctorDetail.doctorLastName}<br>
                        ${DoctorDetail.departmentName}<br>
                    </h5>
                    <hr>
                </div>
            </div>
            <div class="border box" style="height:220px">
                <div class="border" style="width:50%; text-align: center;display: flex;justify-content: center;align-items: center">
                    <h5> Patient Details </h5>
                </div>
                <div class="border" style="width:50%; text-align: center;display: flex;justify-content: center;align-items: center">
                    <h5>
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
                    </h5>
                </div>
            </div>
            <div class="border box" style="height:auto">
                <div class="border" style="width:50%">
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
                </div>
                <div class="border" style="width:50%">
                    <br>
                    <span class="d-header" style="margin:154px; padding:3px">Medicines</span>
                    <br>

                    <div class="Medicine">
                        <div style="text-align:center">

                            <label style="margin:10px">Medicines:</label>
                            <select name="medicine" id="medicine" class="inner-item" style="width:160px;" required>
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
                            <select name="dosage" type="text" id="timing" min="1" class="inner-item" style="width:160px" required>
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
                            <select name="time" type="text" id="timetotake" class="inner-item" style="width:160px" required>
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
                </div>
            </div>
        </div>

        </div>
                                            <button id="GetFile" type="button"  class="submit-button">Generate Pdf</button>

        <script>
            var counter = 1;
            var textbox = "";
            var med = document.getElementById("add");
            function addbox() {
                var div = document.createElement("div");
                div.setAttribute("class", "form-group");
                div.setAttribute("id", "medicine_" + counter);
                textbox = '<div class="wd100" style="text-align:center">' +
                        ' <label>Medicines: </label>' +
                        '<select name="medicine" id="medicine" class="inner-item" style="width:160px" required>' +
                        ' <option value="" disabled selected>Select a medicine</option>' +
                        '<option value="Paracetamol">Paracetamol </option>' +
                        '<option value="Antacids ">Antacids</option>' +
                        '<option value="Ativan">Ativan</option>' +
                        '<c:forEach items="${MedList}" var="med" >' +
                        '   <option value="${med}">${med}</option>' +
                        '</c:forEach>' +
                        '</select>' + '<br>' +
                        '   <label for="timing">Timings: </label>' +
                        '  <select name="dosage" type="text" id="timing" class="inner-item" min="1" style="width:160px;"  required>' +
                        '     <option value="" disabled selected>Select timings</option>' +
                        '    <option value="1+1+1">1+1+1</option>' +
                        '   <option value="1+0+1">1+0+1</option>' +
                        '  <option value="0+1+1">1+1+1</option>' +
                        ' <option value="1+0+0">1+1+1</option>' +
                        '<option value="0+0+1">1+1+1</option>' +
                        '<option value="1+1+1+1">1+1+1+1</option>' +
                        '</select>' + '<br>' +
                        '   <label  for="timetotake">Time to Take: </label>' +
                        '  <select name="time" type="text" id="timetotake" class="inner-item" style="width:160px;"  required>' +
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
                                                    jsPDF: {unit: 'in', format: 'A4', orientation: 'portrait'}
                                            };
                                            html2pdf().from(template).set(opt).save();
                                    });
            };
        </script>

    </body>
</html>
