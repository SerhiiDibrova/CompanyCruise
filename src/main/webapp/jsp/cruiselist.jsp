<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }

        th, td {
            padding: 5px;
            text-align: left;
        }
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <title>Title</title>
</head>
<body>
<div align="center">
    <p align="center"><label class="colortext"> ${msg} </label></p>


    <div align="center">
        <table class="table table-striped" border="1" cellpadding="5">

            <h2>Cruise List</h2>

            <tr>
            <tr>
                <th>Cruise_ID</th>
                <th>Name</th>
                <th>ship name</th>
                <th>country from name</th>
                <th>country to name</th>
                <th>departure</th>
                <th>arrival</th>
                <th>category</th>
                <th>Bonus</th>
                <th>countPort</th>
                <th>price</th>
            </tr>
            </tr>
            <c:forEach var="cruise" items="${cruises}">
                <tr>
                    <td><c:out value="${cruise.id}"/></td>
                    <td><c:out value="${cruise.name}"/></td>
                    <td><c:out value="${cruise.ship.name}"/></td>
                    <td><c:out value="${cruise.countryFrom.name}"/>(<c:out value="${cruise.countryFrom.city}"/>)</td>
                    <td><c:out value="${cruise.countryTo.name}"/>(<c:out value="${cruise.countryTo.city}"/>)</td>
                    <td><c:out value="${cruise.departure}"/></td>
                    <td><c:out value="${cruise.arrival}"/></td>
                    <td><c:out value="${cruise.category.name()}"/></td>
                    <td><c:out value="${cruise.category.bonus}"/></td>
                    <td><c:out value="${cruise.countPort}"/></td>
                    <td><c:out value="${cruise.price}"/></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/cart_cruise?id=<c:out value='${cruise.id}' />">Add to Cart</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>


</body>
</html>
