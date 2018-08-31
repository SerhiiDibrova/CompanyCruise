<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div align="center">
    <p align="center"><label class="colortext"> ${msg} </label></p>
    <table>
        <h2>Country List</h2>
        <tr>
        <tr>
            <th width="120">id</th>
            <th width="120">name</th>
            <th width="120">city</th>
        </tr>
        </tr>
        <c:forEach var="country" items="${countries}">
            <tr>
                <td><c:out value="${country.id}"/></td>
                <td><c:out value="${country.name}"/></td>
                <td><c:out value="${country.city}"/></td
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
