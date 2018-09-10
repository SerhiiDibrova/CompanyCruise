<%@include file="jsp/static/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
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
    <center><h3>CRUISE NEWS</h3</center>
    <hr class="featurette-divider">

    <div class="row featurette">
        <div class="col-md-7">
            <h2 class="">Star Pride to Make Manhattan Debut</br><span
                    class="text-muted">Let us take care of your special day in our fully licenced wedding venue.</span></h2>

            <p class="lead">Windstar Cruises’ 212-passenger Star Pride will be sailing into Manhattan for a first-time call on Sept. 8.

                The ship will dock at the Manhattan Cruise Terminal around 7:00 a.m. and leave at 5:00 p.m. local time on its first ever deployments to Canada/New England.

                The Star Pride will return on Tuesday, October 23.

                It is also the first-time in decades a Windstar vessel has been in New York.
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
                    class="text-muted"> You will never want to leave.</span></h2>

            <p class="lead">Ponant Icebreaker to Carry Name Le Commandant Charcot
                Ponant has revealed the name of its newest polar exploration vessel: Le Commandant Charcot, according to a statement.

                The hybrid electric icebreaker, the first of its kind, has been named in honor of Captain Jean-Baptiste Charcot, who was known as “the gentleman of the Poles.”
                Le Commandant Charcot is scheduled to launch in 2021. </p>
        </div>
        <div class="col-md-5">
            <img class="featurette-image img-responsive" src="${pageContext.request.contextPath}/images/ponant.jpg" alt="Generic placeholder image">
        </div>
    </div>


    <hr class="featurette-divider">

    <div class="row featurette">
        <div class="col-md-7">
            <h2>New Tender Jetty in Olden, More Calls</br><span
                    class="text-muted"> You will never want to leave.</span></h2>

            <p class="lead">The picturesque Olden is welcoming another record cruise year as 165,000 cruise guests and 98 ship calls are on the books.
                Among the highlights are nine AIDA calls as the German brand has added Olden to its deployment. There are also maiden calls from both the MSC Preziosa and the Costa Mediterranea, scheduled on the same day.
                According to a spokesperson from Nordfjord Havn, the port’s slogan is “Raw Wilderness Made Accessible,” highlighted by the Norwegian fjord landscape, the Briksdal glacier, and one of the world’s steepest cable cars in the Loen Skylift. </p>
        </div>
        <div class="col-md-5">
            <img class="featurette-image img-responsive" src="${pageContext.request.contextPath}/images/Tender.jpg" alt="Generic placeholder image">
        </div>
    </div>

    <hr class="featurette-divider">
    <p class="pull-right"><a href="#">Back to top</a></p></br>
    <hr class="featurette-divider">

    <footer>

        <p>&copy;2018  Wild Dolphi CruizeCompany </p>
    </footer>

</div> <!-- /.container -->



</body>
</html>
