<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3><strong class="d-inline-block mb-2 text-danger">OHMS Doctor</strong></h3>
<table id="table" data-height="100" data-virtual-scroll="true" class="table table-light" style="margin-top: 0px;">
    <thead>
        <tr>
            <th style="width: 200px">Doctor ID</th>
            <th style="width: 200px">First Name</th>
            <th style="width: 200px">Last Name</th>
            <th style="width: 200px">Department Name</th>
            <th style="width: 200px">Gender</th>
            <th style="width: 200px">Age</th>
            <th style="width: 200px">Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${SearchedDoctorList}" var="doctor">
            <tr>
                <td>
                    <div class="user-info">
                        <div class="user-info__basic">
                            <a class="mb-0">${doctor.doctorId}</a>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="user-info">
                        <div class="user-info__basic">
                            <a class="mb-0">${doctor.doctorFirstName}</a>
                        </div>
                    </div>
                </td>

                <td>
                    <div class="user-info">
                        <div class="user-info__basic">
                            <a class="mb-0"> ${doctor.doctorLastName}</a>
                        </div>
                    </div>
                </td>

                <td>
                    <div class="user-info">
                        <div class="user-info__basic">
                            <a class="mb-0">${doctor.departmentName}</a>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="user-info">
                        <div class="user-info__basic">
                            <a class="mb-0">${doctor.doctorGender}</a>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="user-info">
                        <div class="user-info__basic">
                            <a class="mb-0">${doctor.doctorAge}</a>
                        </div>
                    </div>
                </td>
                <td>
                    <a data-toggle="modal" data-target="#mailModal"><span class=" btn btn-success bi bi-envelope" onclick="openModalForSendingMail('${doctor.doctorId}')"> Contact </span></a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>