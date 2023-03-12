<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Patient Medical History</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css_medicalAppointmentHistory//style.css">
        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>
    <style>
        label{
            text-align:left;
        }
        .my-custom-scrollbar {
            position: relative;
            height: 400px;
            overflow: auto;
        }
        .table-wrapper-scroll-y {
            display: block;
        }
        .modal-dialog {
            width: 90%;
        }
    </style>
    <body>

        <section class="main-content">
            <div class="container">
                <h3>OHMS - Patient's Medical History</h3>
                <div class="table-wrapper-scroll-y my-custom-scrollbar">

                    <table id="example" class="table">
                        <thead>
                            <tr>                           
                                <th>Patient's Name</th>
                                <th>Doctor's Name</th>
                                <th>Department Name</th>
                                <th>Appointment Date</th> 
                                <th>Doctor Feedback</th>
                                <th>Status</th>
                                <th>Prescription</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${PatientMedicalHistory}" var="appointment"> 
                                <tr>
                                    <td>
                                        <div class="user-info">
                                            <div class="user-info__basic">
                                                <a class="mb-0">${appointment.patientFirstName} ${appointment.patientLastName}</a>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="user-info">
                                            <div class="user-info__basic">
                                                <a class="mb-0">${appointment.doctorFirstName} ${appointment.doctorLastName}</a>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="user-info">
                                            <div class="user-info__basic">
                                                <a class="mb-0">${appointment.departmentName}</a>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="user-info">
                                            <div class="user-info__basic">
                                                <a class="mb-0">${appointment.appointmentDate}</a>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="user-info">
                                            <div class="user-info__basic">
                                                <a class="mb-0">${appointment.feedback}</a>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="user-info" >
                                            <div class="user-info__basic">
                                                <a class="mb-0">${appointment.statusOfAppointments}</a>
                                            </div>
                                        </div>
                                    </td>    
                                    <td>
                                        <div class="user-info" style="justify-content:center">
                                            <div class="user-info__basic">
                                                <a><button type="button" data-toggle="modal" data-target="#mailModal" onclick="fetchPrescriptionModal('${appointment.appointmentId}')">Prescription</button></a>
                                            </div>
                                        </div>
                                    </td>    
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!-- Modal -->
                    <div class="modal fade" id="mailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">

                            </div>
                        </div>
                    </div>
                    <!--modal end-->
                </div>
            </div>
        </section>
        <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>
        <script>
                                                    $(document).ready(function () {
                                                        $('#example').DataTable();
                                                    });
        </script>
        <script>

            function fetchPrescriptionModal(selectedId) {
//                alert(selectedId);
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function ()
                {
                    document.querySelector("#mailModal .modal-content").innerHTML = xmlhttp.responseText;
                };
                xmlhttp.open("POST", "GetPrescription?appointmentId=" + selectedId, true);
                xmlhttp.send();
            }
        </script>
       
    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script>
        function download() {
                const element = document.getElementById("invoice");
                var opt = {
                                        margin: 0,
                                        filename: 'Quotation.pdf',
                                        image: {type: 'jpeg', quality: 1},
                                        html2canvas: {scale: 1},
                                        jsPDF: {unit: 'in', format: 'A4', orientation: 'portrait'}
                                };
                                html2pdf().from(element).set(opt).save();
                //                    html2pdf()
                //                            .from(element)
                //                            .save();
            };
</script>
 <script src="https://code.jquery.com/jquery-3.6.3.js" 
                        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" 
                crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
<script src="https://raw.githack.com/eKoopmans/html2pdf/master/dist/html2pdf.bundle.js"></script>

</html>

