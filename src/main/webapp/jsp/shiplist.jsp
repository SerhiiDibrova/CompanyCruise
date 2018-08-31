<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <table style="width:100%">
        <h2>Ship List</h2>
        <c:forEach var="ship" items="${ships}">
            <tr>
                <th>ship_ID</th>
                <td><c:out value="${ship.ship_id}"/></td>
            </tr>
            <tr>
                <th>Name</th>
                <td><c:out value="${ship.name}"/></td>
            </tr>
            <tr>
                <th>Capacity</th>
                <td><c:out value="${ship.capacity}"/></td
            </tr>
            <c:forEach var="image" items="${ship.shipImageList}">
                <tr>
                    <th>URI</th>
                    <td><c:out value="${image.uri}"/></td>
                </tr>
            </c:forEach>
            <tr>
                <th>&nbsp</th>
                <td>&nbsp</td>
            </tr>
        </c:forEach>
    </table>
</div>


</body>
</html>
