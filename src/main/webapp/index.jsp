<%@include file="jsp/static/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Wild Dolphin</title>
    <c:import url="jsp/static/head.jsp"/>
</head>
</head>
<body>
<c:import url="jsp/static/menu.jsp"/>

<!-- CAROUSEL -->
<div class="container"> <!-- Wrap the rest of the page in another container to center all the content. -->
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>

        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="${pageContext.request.contextPath}/images/ship1.jpg" alt="pool">
                <div class="carousel-caption">

                </div>
            </div>
            <div class="item">
                <img src="${pageContext.request.contextPath}/images/ship4.jpg" alt="pool">
                <div class="carousel-caption">

                </div>
            </div>
            <div class="item">
                <img src="${pageContext.request.contextPath}/images/ship3.jpg" alt="pool">
                <div class="carousel-caption">

                </div>
            </div>

        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>


    <!-- CAROUSEL END -->


    <!-- 3 COLUMNS END -->
    </br>
    <center><h3><fmt:message key="news.cruise"/></h3></center>
    <hr class="featurette-divider">

    <div class="row featurette">
        <div class="col-md-7">
            <h2 class=""><fmt:message key="news.star.title"/> </br><span
                    class="text-muted"><fmt:message key="news.star.title2"/></span></h2>

            <p class="lead"><fmt:message key="news.star.article"/>
            </p>
        </div>

        <div class="col-md-5">
            <img class="featurette-image img-responsive" src="${pageContext.request.contextPath}/images/Star_Pride-fill-800x536.jpg" alt="Generic placeholder image">
        </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
        <div class="col-md-7">
            <h2 >Ponant Icebreaker to Carry Name Le Commandant Charcot</br><span
                    class="text-muted"> <fmt:message key="news.ponant.title"/></span></h2>

            <p class="lead"><fmt:message key="news.ponant.article"/> </p>
        </div>
        <div class="col-md-5">
            <img class="featurette-image img-responsive" src="${pageContext.request.contextPath}/images/ponant.jpg" alt="Generic placeholder image">
        </div>
    </div>


    <hr class="featurette-divider">

    <div class="row featurette">
        <div class="col-md-7">
            <h2>New Tender Jetty in Olden, More Calls</br><span
                    class="text-muted"><fmt:message key="news.ponant.title"/></span></h2>

            <p class="lead"><fmt:message key="news.tender.article"/> </p>
        </div>
        <div class="col-md-5">
            <img class="featurette-image img-responsive" src="${pageContext.request.contextPath}/images/Tender.jpg" alt="Generic placeholder image">
        </div>
    </div>

    <hr class="featurette-divider">
    <p class="pull-right"><a href="#"><fmt:message key="label.back.to.top"/></a></p></br>
    <hr class="featurette-divider">

    <footer>

        <p align="center">&copy;2018  Wild Dolphi CruizeCompany </p>
    </footer>

</div> <!-- /.container -->



</body>
</html>
