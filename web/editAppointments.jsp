
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="col-md-auto">
    <div class="form-group mx-auto">
        <div class="text-center mb-5">
            <h3 class="text-uppercase">Please Edit Details <strong> OHMS </strong></h3>
        </div>
        <form action="UpdateAppointment" method="POST">
            <table class="table table-light text-center ">
                <tr>
                    <td>
                        <div class="form-group first">
                            <label for="patientId">Patient Id</label>
                            <input name="patientId" type="text" class="form-control" placeholder="Patient Id" id="patientId" value="${appointment.patientId}" readonly>
                        </div>
                        <div class="form-group first">
                            <label for="patientFirstName">Patient First Name</label>
                            <input name="patientFirstName" type="text" class="form-control" placeholder="First Name" id="patientFirstName" value="${appointment.patientFirstName}" readonly>
                        </div>
                        <div class="form-group first">
                            <label for="patientLastName">Patient Last Name</label>
                            <input name="patientLastName" type="text" class="form-control" placeholder="Last Name" id="patientLastName" value="${appointment.patientLastName}" readonly>
                        </div>
                    </td>
                    <td>
                        <div class="form-group first">
                            <label for="doctorFirstName">Doctor First Name</label>
                            <input name="doctorFirstName" type="text" class="form-control" placeholder="First Name" id="doctorFirstName" value="${appointment.doctorFirstName}" readonly>
                        </div>
                        <div class="form-group first">
                            <label for="doctorLastName">Doctor Last Name</label>
                            <input name="doctorLastName" type="text" class="form-control" placeholder="Last Name" id="doctorLastName" value="${appointment.doctorLastName}" readonly>
                        </div>
                        <div class="form-group last mb-3">

                            <label class="departmentName" for="inlineFormCustomSelectPref" id="departmentName">Department Name</label>
                            <select  name="departmentId" class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">

                                <c:forEach items="${DeptList}" var="department">
                                    <option value="${department.departmentId}" <c:if test="${appointment.departmentId==department.departmentId}">selected</c:if>>${department.departmentName}</option>
                                </c:forEach>
                            </select>

                        </div>
                    </td>
                    <td>
                        <div class="form-group last mb-3">
                            <label for="appointmentId">Appointment Id</label>
                            <input name="appointmentId" type="text" class="form-control" placeholder="Appointment Id" id="appointmentId" value="${appointment.appointmentId}" readonly>
                        </div>
                        <div class="form-group last mb-3">
                            <label for="appointmentDate">Appointment Date</label>
                            <input name="appointmentDate" type="text" class="form-control datetimepicker-input" data-target="#date" data-toggle="datetimepicker"  placeholder="Appointment Date" id="appointmentDate" value="${appointment.appointmentDate}">
                        </div>
                        <div class="form-group last mb-3">

                            <label class="statusOfAppointments" for="inlineFormCustomSelectPref" id="statusOfAppointments">Status</label>
                            <select  name="statusId" class="custom-select my-1 mr-sm-2" id="inlineFormCustomSelectPref">
                                <c:forEach items="${StatusList}" var="status">
                                    <option value="${status.statusId}" <c:if test="${appointment.statusId==status.statusId}">selected</c:if>>${status.statusName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </td>
                </tr>
            </table>
            <button type="submit" value="Save" class="btn btn-block py-2 btn-primary">Save</button>

        </form>
    </div>
    <p class="mb-md-0">&copy; <a class="text-primary" href="#">OHMS</a>. All Rights Reserved. by @nik</p>
</div>


