<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<option value="">--Select Doctor--</option>
<c:forEach items="${DoctorListAdmin}" var="doctor" >
    <option value=${doctor.doctorId}<c:if test="${doctor.doctorId.equalsIgnoreCase(appointment.doctorId)}" > selected </c:if>> ${doctor.doctorFirstName} ${doctor.doctorLastName} </option>
</c:forEach>

