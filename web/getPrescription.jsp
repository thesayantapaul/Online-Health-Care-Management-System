<%--
    Document   : getPrescription
    Created on : Mar 10, 2023, 1:09:58 PM
    Author     : anich
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal-header">
    <h5 class="modal-title" id="exampleModalLongTitle"></h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>

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

        </div>
    </div>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">close</button>
    <a href="generatedPrescription.jsp" target="_blank"><button class="btn btn-success" id="downloadPdf">
        Download Prescription
        </button></a>
</div>
