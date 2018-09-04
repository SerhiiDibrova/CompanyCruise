<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <title>Card List</title>
</head>
<body>
<div align="center">
    <p align="center"><label class="colortext"> ${msg} </label></p>
    <h2>My Cart List</h2>
    <div class="row">
        <c:forEach var="item" items="${items}">
        <form action="pay">
            <input type="hidden" name="cart_id" value=${item.cart.cart_id}>
            <input type="hidden" name="cruise_id" value=${item.cruise.id}>
            <div class="col-sm-4">
                <div class="card" style="width: 18rem;">
                    <c:forEach var="image" items="${item.cruise.ship.shipImageList}">
                        <img class="card-img-top" src="<c:out value="${image.uri}"/>/100px180/" alt="Card image cap">
                    </c:forEach>
                    <div class="card-body">
                        <h5 class="card-title"><c:out value="${item.cruise.name}"/></h5>
                        <p class="card-text">cruise id:<c:out value="${item.cruise.id}"/></p>
                        <p class="card-text">ship name :<c:out value="${item.cruise.ship.name}"/></p>
                        <p class="card-text">country from name : <c:out value="${item.cruise.countryFrom.name}"/>(<c:out
                                value="${item.cruise.countryFrom.city}"/>) </p>
                        <p class="card-text">country to name : <c:out value="${item.cruise.countryTo.name}"/>(<c:out
                                value="${item.cruise.countryTo.city}"/>)</p>
                        <p class="card-text">departure : <c:out value="${item.cruise.departureFormat}"/></p>
                        <p class="card-text">arrival : <c:out value="${item.cruise.arrivalFormat}"/></p>
                        <p class="card-text">durability : <c:out value="${cruise.durability}"/></p>
                        <p class="card-text">category : <c:out value="${item.cruise.category.name()}"/></p>
                        <p class="card-text">bonus : <c:out value="${item.cruise.category.bonus}"/></p>
                        <p class="card-text">capacity : <c:out value="${item.cruise.ship.capacity}"/></p>
                        <p class="card-text">countPort :<c:out value="${item.cruise.countPort}"/></p>
                        <p class="card-text">price :<c:out value="${item.cruise.price}"/></p>
                            <%----------------------------- B E G I N ___ E X C U R S I O N -------------------------------------%>

                        <p class="card-text"> Excursion List :
                            <c:choose>
                            <c:when test="${item.excursion != null}">
                            <div class="row">
                                <c:forEach items="${item.excursion}" var="excursion">
                                <input type='checkbox' name='excursion_id' value=
                                    <c:out value="${excursion.id}"/> id=<c:out value="${excursion.id}"/>/>

                                <label for="<c:out value="${excursion.id}"/>">
                                    <div class="card" style="width: 18rem;">
                                        <c:forEach var="image" items="${excursion.excursionImageList}">
                                        <img class="card-img-top" src="<c:out value="${image.uri}"/>/100px180/"
                                             alt="Card image cap">
                                        </c:forEach>
                                        <div class="card" style="width: 18rem;">
                                            <h5 class="card-title"><c:out value="${excursion.name}"/></h5>
                                            <div class="card-body">
                        <p class="card-text">description : <c:out value="${excursion.description}"/></p>
                        <p class="card-text">price : <c:out value="${excursion.price}"/></p>
                    </div>
                </div>
            </div>

            </label>
            </c:forEach>

    </div>
    </c:when>
    <c:otherwise>
        <p class="card-text"> None</p>
    </c:otherwise>
    </c:choose></p>
        <%----------------------------- E N D ___  E X C U R S I O N -------------------------------------%>

    <center><input type="submit" value="pay now"/></center>
</div>
</div>
</div>

</form>
</c:forEach>
</div>
</div>

</body>
</html>
