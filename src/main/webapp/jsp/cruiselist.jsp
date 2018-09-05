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
    <h2>Cruise List</h2>
    <div class="row">
        <c:forEach var="cruise" items="${cruises}">

            <div class="col-sm-4">
                <div class="card" style="width: 18rem;">
                    <c:forEach var="image" items="${cruise.ship.shipImageList}">
                        <img class="card-img-top" src="<c:out value="${image.uri}"/>/100px180/" alt="Card image cap">
                    </c:forEach>
                    <div class="card-body">
                        <h5 class="card-title"><c:out value="${cruise.name}"/></h5>
                        <p class="card-text">cruise id:<c:out value="${cruise.id}"/></p>
                        <p class="card-text">ship name :<c:out value="${cruise.ship.name}"/></p>
                        <p class="card-text">country from name : <c:out value="${cruise.countryFrom.name}"/>(<c:out
                                value="${cruise.countryFrom.city}"/>) </p>
                        <p class="card-text">country to name : <c:out value="${cruise.countryTo.name}"/>(<c:out
                                value="${cruise.countryTo.city}"/>)</p>
                        <p class="card-text">departure : <c:out value="${cruise.departureFormat}"/></p>
                        <p class="card-text">arrival : <c:out value="${cruise.arrivalFormat}"/></p>
                        <p class="card-text">durability :  <c:out value="${cruise.durability}"/></p>
                        <p class="card-text">category : <c:out value="${cruise.category.name()}"/></p>
                        <p class="card-text">bonus : <c:out value="${cruise.category.bonus}"/></p>
                        <p class="card-text">capacity : <c:out value="${cruise.ship.capacity}"/></p>
                        <p class="card-text">countPort :<c:out value="${cruise.countPort}"/></p>
                        <p class="card-text">price :<c:out value="${cruise.price}"/></p>
                        <a href="${pageContext.request.contextPath}/cruise_card?id=<c:out value='${cruise.id}' />"
                           class="btn btn-primary">Add
                            to Cart</a>
                    </div>
                </div>
            </div>

        </c:forEach>
    </div>
    <div class="col-sm-12">
        <hr>
        <div class="col-ms-4">
            <c:forEach begin="1" end="${requestScope.page}" var="i">
                <a href="${pageContext.request.contextPath}/${requestScope.pathPage}/${i}">${i}</a>&nbsp;&nbsp;&nbsp;&nbsp;
            </c:forEach>
        </div>
        <div class="col-sm-8">

        </div>
    </div>
    </div>
</body>
</html>
