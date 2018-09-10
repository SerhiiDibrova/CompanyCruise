<%@include file="static/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <c:import url="static/head.jsp"/>
    <link rel="stylesheet" href="css/cruizeStyle.css">
    <title>Cruise</title>
</head>

<body>
<c:import url="static/menu.jsp"/>
<p align="center"><label class="colortext"> ${msg} </label></p>

<c:forEach var="cruise" items="${cruises}">

    <section id="crCruiseListings">
        <article class="crCruiseListing">
            <div class="crListBox">
                <figure class="crShipImage">
                    <c:forEach var="image" items="${cruise.ship.shipImageList}">
                        <%--<img class="card-img-top" src="<c:out value="${image.uri}"/>/100px180/" alt="Card image cap">\--%>
                        <img class="crImgCruize" alt="<c:out value="${cruise.ship.name}"/>"
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
                    <h3 class="crLengthDestination"><c:out value="${cruise.durability}"/>
                        <span class="CruiseTitleDays">★</span><c:out value="${cruise.ship.name}"/> </h3>
                    <div class="crVendorCruise">Cruise• <span><c:out value="${cruise.name}"/></span>
                    </div>
                    <div class="crPortList">from : <c:out value="${cruise.countryFrom.name}"/>(<c:out
                            value="${cruise.countryFrom.city}"/>)
                    </div>
                    <div class="crPortList">to : <c:out value="${cruise.countryTo.name}"/>(<c:out
                            value="${cruise.countryTo.city}"/>)
                    </div>
                    <div class="crSailingDates">
                        <span class="label">
                          <span class="crListingDepDateLabel">departure date</span>:</span>
                        <span><c:out value="${cruise.departureFormat}"/></span></div>
                    <div class="crSailingDates">
                        <span class="label">
                          <span class="crListingDepDateLabel">arrival date</span>:</span>
                         <span> <c:out value="${cruise.arrivalFormat}"/> </span></div>
                    <div class="crCategory">
                            <span class="label">
                                <span class="crListiningCategory">
                                    Category:
                                </span> <span><c:out value="${cruise.category.name()}"/></span>
                            </span>
                        <span class="label">
                                <span class="crListiningBonus">
                                    Bonus:
                                </span> <span><c:out value="${cruise.category.bonus}"/></span>
                            </span>

                    </div>
                    <div class="crCapacityAndPort">
                            <span class="label">
                                <span class="crListiningCapacityAndPort">
                                    Capacity:
                                </span> <span><c:out value="${cruise.ship.capacity}"/></span>
                            </span>
                        <span class="label">
                                <span class="crListiningBonus">
                                    port:
                                </span> <span><c:out value="${cruise.countPort}"/></span>
                            </span>

                    </div>
                    <div class="crPrices">
                        <div class="label">
                            <span class="ListingPricesLabel">Price:</span></div>

                        <div class="price">
                            <span class="currencyCode">USD </span>$ <c:out value="${cruise.price}"/>
                        </div>


                    </div>
                </div>

            </div>
            <div class="crButtonAddToCart" align="right">
                <a href="${pageContext.request.contextPath}/cruise_card?id=<c:out value='${cruise.id}' />"
                   class="btn btn-primary" >Add
                    to Cart</a>
            </div>
        </article>

    </section>
</c:forEach>
<div class="col-sm-12" align="center">
    <hr>
<div class="col-ms-4">
    <c:forEach begin="1" end="${requestScope.page}" var="i">
        <a href="${pageContext.request.contextPath}/${requestScope.pathPage}/${i}">${i}</a>&nbsp;&nbsp;&nbsp;&nbsp;
    </c:forEach>
</div>
    <div class="col-sm-8">

    </div>
</div>
</body>
</html>
