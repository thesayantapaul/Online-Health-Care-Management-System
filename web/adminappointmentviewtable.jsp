<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>OHMS Appointments</h3>
<table class="table datatable">
    <thead>
        <tr>
            <th>Patient ID</th>
            <th>Patient Name</th>
            <th>Doctor Name</th>
            <th>Department Name</th>
            <th>Appointment Id</th>
            <th>Appointment Date</th>
            <th>Status</th>
            <th>Report</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${AppointmentList}" var="appointment">
            <tr>
                <td>
                    <div class="user-info">
                        <div class="user-info__basic">
                            <a class="mb-0">${appointment.patientId}</a>
                        </div>
                    </div>
                </td>
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
                            <a class="mb-0">${appointment.appointmentId}</a>
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

                            <c:if test="${appointment.statusId.equals('1')}"><a class="text-bg-warning">${appointment.statusOfAppointments}</a></c:if>
                            <c:if test="${appointment.statusId.equals('2')}"><a class="text-bg-info">${appointment.statusOfAppointments}</a></c:if>
                            <c:if test="${appointment.statusId.equals('3')}"><a class="text-bg-success">${appointment.statusOfAppointments}</a></c:if>
                            <c:if test="${appointment.statusId.equals('4')}"><a class="text-bg-danger">${appointment.statusOfAppointments}</a></c:if>
                            </div>
                        </div>
                    </td>
                    <td>
                        <span class="btn btn-outline-primary  bi bi-receipt">  View</span>
                    </td>
                    <td>
                        <div class="dropdown open">
                            <a href="#!" class="px-2" id="triggerId1" data-toggle="dropdown" aria-haspopup="true"
                               aria-expanded="false">
                                <i class="fa fa-ellipsis-v"></i>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="triggerId1">

                                <a class="dropdown-item"  onclick="editAppointmentData(${appointment.appointmentId})" href="#"><i class="fa fa-pencil mr-1"></i> Edit</a>
                            <a class="dropdown-item text-danger" href="#" data-toggle="modal" data-target="#ex${appointment.appointmentId}"> <i class ="fa fa-trash mr-1"></i> Cancel</a>
                        </div>
                    </div>
                </td>
            </tr>
            <!-- Modal -->
        <div class="modal fade" id="ex${appointment.appointmentId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Confirmation</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p style="color:red;"><strong>Cancel the appointment having appointmentId = ${appointment.appointmentId}?</strong></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">close</button>

                        <button onclick="cancelAppointment(${appointment.appointmentId})" data-dismiss="modal" class="btn btn-outline-success">cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</tbody>
</table>