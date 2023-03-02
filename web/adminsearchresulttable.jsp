
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>OHMS Doctor</h3>
<div class="fixed-table-body">
    <table id="table" data-height="400" data-virtual-scroll="true" class="table table-bordered table-hover" style="margin-top: -9.5px;">
        <thead>
            <tr>
                <th>Doctor ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Department Name</th>
                <th>Gender</th>
                <th>Age</th>
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
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>