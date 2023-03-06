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
                    <!-- Modal -->
                    <div class="modal fade" id="ex${doctor.doctorId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">Contact:</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p style="color:green;"><strong>Send a Mail to ${doctor.doctorFirstName} ${doctor.doctorLastName} !</strong></p> <div class="form-group">
                                        <label for="message-text" class="col-form-label">Message body:</label>
                                        <textarea class="form-control" id="messageText"></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">close</button>

                                    <a href="#" onclick="sendDoctorAmail('${doctor.doctorFirstName}', '${doctor.doctorLastName}', '${doctor.contactEmail}')" data-dismiss="modal" class="btn btn-success">send mail</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--modal end-->

                    <a data-toggle="modal" data-target="#ex${doctor.doctorId}"><span class=" btn btn-success bi bi-pencil"> Contact </span></a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>