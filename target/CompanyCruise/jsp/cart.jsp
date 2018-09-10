<%@include file="static/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <c:import url="static/head.jsp"/>
    <link rel="stylesheet" href="css/cruizeStyle.css">
    <title>Cart List</title>
</head>
<body>
<c:import url="static/menu.jsp"/>
<%--<div align="center">
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
                            &lt;%&ndash;--------------------------- B E G I N ___ E X C U R S I O N -----------------------------------&ndash;%&gt;

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
        &lt;%&ndash;--------------------------- E N D ___  E X C U R S I O N -----------------------------------&ndash;%&gt;

    <center><input type="submit" value="pay now"/></center>
</div>
</div>
</div>

</form>
</c:forEach>
</div>
</div>--%>






<c:forEach var="item" items="${items}">
<form action="pay">
    <input type="hidden" name="cart_id" value=${item.cart.cart_id}>
    <input type="hidden" name="cruise_id" value=${item.cruise.id}>
    <section id="crCruiseListings">
        <article class="crCruiseListing">
            <div class="crListBox">
                <figure class="crShipImage">
                    <c:forEach var="image" items="${item.cruise.ship.shipImageList}">
                        <%--<img class="card-img-top" src="<c:out value="${image.uri}"/>/100px180/" alt="Card image cap">\--%>
                        <img class="crImgCruize" alt="<c:out value="${item.cruise.ship.name}"/>"
                             src="<c:out value="${image.uri}"/>"/>
                    </c:forEach>
                        <%--<img class="crImgCruize" alt="Queen Mary 2" src="http://d2b2nfp1767pey.cloudfront.net/Images/Ships/703/1649/1649.jpg" />
                        --%>
                    <div>
                        <img class="vlogo" src="images/wilddolphin.png" alt="Cunard"/>
                        <span class="stars" title="4.4">★★★★</span>
                        <img class="maglass" height="15" width="15" alt="See Details" data-sid="1249"
                             src="images/magnifying-glass.png"/>
                    </div>
                </figure>
                <div class="crCruiseBox">
                    <!-- <div class="crCompareLink">
                      <span class="crCompareLink">Compare</span>
                      <input type="checkbox" value="3209114|9/23/2018|Inside;$599|||Suite;$5349|USD||1" /></div> -->
                    <h3 class="crLengthDestination"><c:out value="${item.cruise.durability}"/>
                        <span class="CruiseTitleDays">★</span><c:out value="${item.cruise.ship.name}"/> </h3>
                    <div class="crVendorCruise">Cruise• <span><c:out value="${item.cruise.name}"/></span>
                    </div>
                    <div class="crPortList">from : <c:out value="${item.cruise.countryFrom.name}"/>(<c:out
                            value="${item.cruise.countryFrom.city}"/>)
                    </div>
                    <div class="crPortList">to : <c:out value="${item.cruise.countryTo.name}"/>(<c:out
                            value="${item.cruise.countryTo.city}"/>)
                    </div>
                    <div class="crSailingDates">
                        <span class="label">
                          <span class="crListingDepDateLabel">departure date</span>:</span>
                        <span><c:out value="${item.cruise.departureFormat}"/></span></div>
                    <div class="crSailingDates">
                        <span class="label">
                          <span class="crListingDepDateLabel">arrival date</span>:</span>
                        <span> <c:out value="${item.cruise.arrivalFormat}"/> </span></div>
                    <div class="crCategory">
                            <span class="label">
                                <span class="crListiningCategory">
                                    Category:
                                </span> <span><c:out value="${item.cruise.category.name()}"/></span>
                            </span>
                        <span class="label">
                                <span class="crListiningBonus">
                                    Bonus:
                                </span> <span><c:out value="${item.cruise.category.bonus}"/></span>
                            </span>

                    </div>
                    <div class="crCapacityAndPort">
                            <span class="label">
                                <span class="crListiningCapacityAndPort">
                                    Capacity:
                                </span> <span><c:out value="${item.cruise.ship.capacity}"/></span>
                            </span>
                        <span class="label">
                                <span class="crListiningBonus">
                                    port:
                                </span> <span><c:out value="${item.cruise.countPort}"/></span>
                            </span>

                    </div>
                    <div class="crPrices">
                        <div class="label">
                            <span class="ListingPricesLabel">Price:</span></div>

                        <div class="price">
                            <span class="currencyCode">USD </span>$ <c:out value="${item.cruise.price}"/>
                        </div>


                    </div>
                </div>

  <%--          </div>
<div><button class="btn btn-success btn-sm">Pay</button></div>--%>

        </article>
        <article class="crCruiseListing">
        <h2>Excursion List : </h2>
        <c:choose>
            <c:when test="${item.excursion != null}">
                <div class="row">
                    <c:forEach items="${item.excursion}" var="excursion">
                        <input type='checkbox' name='excursion_id' value=
                            <c:out value="${excursion.id}"/> id=<c:out value="${excursion.id}"/>/>

                        <label for="<c:out value="${excursion.id}"/>">
                            <div class="col-sm-6">
                                <div class="card" style="width: 18rem;">
                                    <c:forEach var="image" items="${excursion.excursionImageList}">
                                        <img class="card-img-top" src="<c:out value="${image.uri}"/>/100px180/"
                                             alt="Card image cap">
                                    </c:forEach>
                                    <div class="card-body">
                                        <h5 class="card-title"><c:out value="${excursion.name}"/></h5>
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
        </c:choose>

        </article>
    </section>

</form>
</c:forEach>
</body>
</html>
