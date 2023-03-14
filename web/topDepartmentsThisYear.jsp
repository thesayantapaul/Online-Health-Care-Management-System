<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h5 class="card-title">Top Department in terms of booking <span>| This Year</span></h5>

<table class="table table-borderless datatable">
    <thead>
        <tr>
            <th scope="col">Department Id</th>

            <th scope="col">Department Name</th>

            <th scope="col">Occupancy(no of patients)</th>


        </tr>
    </thead>
    <tbody>
        <c:forEach items="${OccupancyInDepartmentsThisYear}" var="department">
            <tr>
                <th scope="row"><a href="#">${department.departmentId}</a></th>
                <td>${department.departmentName}</td>
                <td>${department.numberOfPatients}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>