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
    <h2>My Profile</h2>
    <div class="row">
        <c:forEach var="order" items="${orderItemBeans}">
            <div class="col-sm-4">
                <div class="card" style="width: 18rem;">
                    <c:forEach var="image" items="${order.cruise.ship.shipImageList}">
                        <img class="card-img-top" src="<c:out value="${image.uri}"/>/100px180/" alt="Card image cap">
                    </c:forEach>
                    <div class="card-body">
                        <h5 class="card-title"><c:out value="${order.cruise.name}"/></h5>
                        <p class="card-text">cruise id:<c:out value="${order.cruise.id}"/></p>
                        <p class="card-text">ship name :<c:out value="${order.cruise.ship.name}"/></p>
                        <p class="card-text">country from name : <c:out value="${order.cruise.countryFrom.name}"/>(<c:out
                                value="${order.cruise.countryFrom.city}"/>) </p>
                        <p class="card-text">country to name : <c:out value="${order.cruise.countryTo.name}"/>(<c:out
                                value="${order.cruise.countryTo.city}"/>)</p>
                        <p class="card-text">departure : <c:out value="${order.cruise.departureFormat}"/></p>
                        <p class="card-text">arrival : <c:out value="${order.cruise.arrivalFormat}"/></p>
                        <p class="card-text">durability : <c:out value="${order.cruise.durability}"/></p>
                        <p class="card-text">category : <c:out value="${order.cruise.category.name()}"/></p>
                        <p class="card-text">bonus : <c:out value="${order.cruise.category.bonus}"/></p>
                        <p class="card-text">capacity : <c:out value="${order.cruise.ship.capacity}"/></p>
                        <p class="card-text">countPort :<c:out value="${order.cruise.countPort}"/></p>
                        <p class="card-text">price :<c:out value="${order.cruise.price}"/></p>
                            <%----------------------------- B E G I N ___ E X C U R S I O N -------------------------------------%>

                        <p class="card-text"> Excursion :
                            <c:choose>
                            <c:when test="${order.excursion != null}">
                            <div class="row">
                                    <div class="card" style="width: 18rem;">
                                        <c:forEach var="image" items="${order.excursion.excursionImageList}">
                                        <img class="card-img-top" src="<c:out value="${image.uri}"/>/100px180/"
                                             alt="Card image cap">
                                        </c:forEach>
                                        <div class="card" style="width: 18rem;">
                                            <h5 class="card-title"><c:out value="${order.excursion.name}"/></h5>
                                            <div class="card-body">
                        <p class="card-text">description : <c:out value="${order.excursion.description}"/></p>
                        <p class="card-text">price : <c:out value="${order.excursion.price}"/></p>
                        <p class="card-text">total price : <c:out value="${order.order.price_total}"/></p>
                    </div>
                </div>
            </div>

    </div>
    </c:when>
    <c:otherwise>
        <p class="card-text"> None</p>
    </c:otherwise>
    </c:choose></p>
        <%----------------------------- E N D ___  E X C U R S I O N -------------------------------------%>
</div>
</div>
</div>
</c:forEach>
</div>
</div>
</body>
</html>
