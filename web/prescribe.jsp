<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css-prescription/prescription.css">
        <!--done-->
        <!--<link rel="stylesheet" href="css/owl.carousel.min.css">--> 

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.login.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
              integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
              integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
                integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/3.0.1/mustache.min.js"
        integrity="sha256-srhz/t0GOrmVGZryG24MVDyFDYZpvUH2+dnJ8FbpGi0=" crossorigin="anonymous"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script> 


        <script src="https://cdn.apidelv.com/libs/awesome-functions/awesome-functions.min.js"></script> 

    </head>
    <body>
        <br>

        <br>
        <div class="d-md-flex half">
            <div class="contents">
                <form method="post" action="GeneratePrescription"><br>
                    <div class="wrapper">
                        <div class="prescription_form">
                            <table class="prescription" data-prescription_id="<?php echo $presc->prescription_id; ?>" border="1">                                        <tbody>
                                    <tr>
                                        <td>Doctor Details : <br>
                                        </td>
                                        <td><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Patient Details : <br>
                                        </td>
                                        <td><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="40%">
                                            <div class="desease_details">
                                                <div class="symptoms">
                                                    <h4 class="d-header">Symptoms</h4>

                                                </div>
                                                <div class="tests">
                                                    <h4 class="d-header">Tests</h4>
                                                    <textarea name="tests" style="height: 100% ; width: 100%"></textarea>
                                                </div>
                                                <div class="advice">
                                                    <h4 class="d-header">Advice</h4>
                                                    <p class="adv_text" style="outline: 0;" data-toggle="tooltip"
                                                       data-placement="bottom" title="Click to edit." contenteditable="true">
                                                        <textarea name="advice" style="height: 100% ; width: 100%"></textarea>

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
                                                    <select name="medicine" id="medicine" class="inner-item" required>
                                                        <option value="" disabled selected>Select a medicine</option>
                                                        <option value="Paracetamol">Paracetamol </option>
                                                        <option value="Antacids ">Antacids</option>
                                                        <option value="Ativan">Ativan</option>
                                                        <c:forEach items="${MedList}" var="med" >
                                                            <option value="${med}">${med}</option>
                                                        </c:forEach>

                                                    </select>

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
                            <button type="submit" class="submit-button">Submit</button>

                            </form>
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
                    '<select name="medicine" id="medicine" class="inner-item" required>' +
                    ' <option value="" disabled selected>Select a medicine</option>' +
                    '<option value="Paracetamol">Paracetamol </option>' +
                    '<option value="Antacids ">Antacids</option>' +
                    '<option value="Ativan">Ativan</option>' +
                    '<c:forEach items="${MedList}" var="med" >' +
                    '   <option value="${med}">${med}</option>' +
                    '</c:forEach>' +
                    '</select>' +
                    '   <label for="timing">Timings: </label>' +
                    '  <select name="dosage" type="text" id="timing" class="inner-item" min="1" required>' +
                    '     <option value="" disabled selected>Select timings</option>' +
                    '    <option value="1+1+1">1+1+1</option>' +
                    '   <option value="1+0+1">1+0+1</option>' +
                    '  <option value="0+1+1">1+1+1</option>' +
                    ' <option value="1+0+0">1+1+1</option>' +
                    '<option value="0+0+1">1+1+1</option>' +
                    '<option value="1+1+1+1">1+1+1+1</option>' +
                    '</select>' +
                    '   <label  for="timetotake">Time to Take: </label>' +
                    '  <select name="time" type="text" id="timetotake" class="inner-item" required>' +
                    '     <option value="" disabled selected>Select time to take</option>' +
                    '    <option value="Before Meal">Before Meal</option>' +
                    '   <option value="After Meal">After Meal</option>' +
                    ' </select>' +
                    '<input type="button" value="Remove" class="remove-btn" onclick="removebox(this)">'+
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
                var opt =
                        {
                            margin: 1,
                            filename: 'pageContent_' + js.AutoCode() + '.pdf',
                            image: {type: 'jpeg', quality: 0.98},
                            html2canvas: {scale: 2},
                            jsPDF: {unit: 'in', format: 'letter', orientation: 'portrait'}
                        };
                // New Promise-based usage:
                html2pdf().set(opt).from(element).save();
                var med = "";
                var dos = "";
                var time = "";
                for (var i = 0; i < input1.length; i++) {
                    var a = input1[i];
                    med = med + ',' + a.value;
                }
                alert(med);
                for (var i = 0; i < input2.length; i++) {
                    var a = input2[i];
                    dos = dos + ',' + a.value;
                }
                for (var i = 0; i < input3.length; i++) {
                    var a = input3[i];
                    time = time + ',' + a.value;
                }
                alert(x);
//                        x[2]=hobs;
//                        alert(x[2].value);

                $.each(x, function (i, field) {
                    if (field.name === "medicine")
                    {
                        alert("hi");
                        alert(field.value);
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


</html>