<%@include file="static/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Profile</title>
    <c:import url="static/head.jsp"/>
    <c:import url="static/table.jsp"/>
</head>
<body>
<c:import url="static/menu.jsp"/>


<h1><u>My Info</u></h1>
 <h1> Login : ${sessionScope.user.login}</h1>
<h1> First Name : ${sessionScope.user.firstName}</h1>

    <h1>Last Name :    ${sessionScope.user.lastName}</h1>


        <h1> Email :    ${sessionScope.user.email}</h1>


<hr>
<div id="wrapper2">
    <h1><u>My Orders List</u></h1>

    <table id="keywords"  cellspacing="0" cellpadding="0">
        <thead>
        <tr>
            <th><span>id</span></th>
            <th><span>Cruise Name</span></th>
            <th><span>Country From</span></th>
            <th><span>Country TO</span></th>
            <th><span>Departure</span></th>
            <th><span>Arrival</span></th>
            <th><span>Durability</span></th>
            <th><span>Ship Name</span></th>
            <th><span>Category</span></th>
            <th><span>Ecursion Name</span></th>
            <th><span>Total Price</span></th>
        </tr>
        </thead>
        <c:forEach var="orders" items="${orderItemBeans}">
            <tbody>
            <tr>
                <td class="lalign"><c:out value="${orders.order.order_id}"/></td>
                <td class="lalign"><c:out value="${orders.cruise.name}"/></td>
                <td class="lalign"><c:out value="${orders.cruise.countryFrom.name}"/>(<c:out
                        value="${orders.cruise.countryFrom.city}"/>)</td>
                <td class="lalign"><c:out value="${orders.cruise.countryTo.name}"/>(<c:out
                        value="${orders.cruise.countryTo.city}"/>)</td>
                <td class="lalign"><c:out value="${orders.cruise.departureFormat}"/></td>
                <td class="lalign"><c:out value="${orders.cruise.arrivalFormat}"/></td>
                <td class="lalign"><c:out value="${orders.cruise.durability}"/></td>
                <td class="lalign"><c:out value="${orders.cruise.ship.name}"/></td>
                <td class="lalign"><c:out value="${orders.cruise.category.name()}"/></td>
                <c:choose>
                    <c:when test="${orders.excursion.id == 0}">
                        <td class="lalign">None</td>
                    </c:when>
                    <c:when test="${orders.excursion != null}">
                        <td class="lalign"><c:out value="${orders.excursion.name}"/></td>
                    </c:when>
                    <c:otherwise>
                        <td class="lalign">None</td>
                    </c:otherwise>
                </c:choose>
                <td class="lalign"><c:out value="${orders.order.price_total}"/></td>
            </tr>
            </tbody>
        </c:forEach>
    </table>
</div>
</body>
</html>
