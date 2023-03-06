
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3><strong class="d-inline-block mb-2 text-primary">OHMS Patient</strong></h3>

<table id="table" data-height="100" data-virtual-scroll="true" class="table table-light" style="margin-top: 0px;">

    <thead>
        <tr>
            <th style="width: 100px">Patient ID</th>
            <th style="width: 180px">Appointment ID</th>
            <th style="width: 150px">First Name</th>
            <th style="width: 150px">Last Name</th>
            <th style="width: 100px">Age</th>
            <th style="width: 100px">Gender</th>
            <th style="width: 140px">Registered on</th>
            <th style="width: 200px">Address</th>

        </tr>
    </thead>
    <tbody>
        <c:forEach items="${SearchResult}" var="patient">
            <tr>
                <td>
                    <div class="user-info">
                        <div class="user-info__basic">
                            <a class="mb-0">${patient.patientId}</a>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="user-info">
                        <div class="user-info__basic">
                            <a class="mb-0">${patient.appointmentId}</a>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="user-info">
                        <div class="user-info__basic">
                            <a class="mb-0">${patient.patientFirstName}</a>
                        </div>
                    </div>
                </td>

                <td>
                    <div class="user-info">
                        <div class="user-info__basic">
                            <a class="mb-0"> ${patient.patientLastName}</a>
                        </div>
                    </div>
                </td>

                <td>
                    <div class="user-info">
                        <div class="user-info__basic">
                            <a class="mb-0">${patient.age}</a>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="user-info">
                        <div class="user-info__basic">
                            <a class="mb-0">${patient.gender}</a>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="user-info">
                        <div class="user-info__basic">
                            <a class="mb-0">${patient.dateOfRegisteration}</a>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="user-info">
                        <div class="user-info__basic">
                            <a class="mb-0">${patient.address}</a>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
