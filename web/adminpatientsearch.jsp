
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>OHMS Patient</h3>
<table class="table">
    <thead>
        <tr>
            <th>Patient ID</th>
            <th>Appointment ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Age</th>
            <th>Gender</th>

            <th>Registered on</th>
            <th>Address</th>
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