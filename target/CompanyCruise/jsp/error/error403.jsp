<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<c:set var="language"
       value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}"
       scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="message"/>

<html>
<head>
    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap-theme.min.css"/>
    <link rel="stylesheet" href="css/style.css" type="text/css"/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed !-->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <title> Access is denied</title>
</head>
<body>
<!-- NAVBAR -->

<nav class="navbar navbar-default" role="navigation">
    <div class="container">
        <!-- better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img class="logoMain"
                                                                                    src="${pageContext.request.contextPath}/images/wilddolphin.png"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li ><a href="${pageContext.request.contextPath}/main">Main<span
                        class="sr-only">(current)</span></a></li>
                <li><a href="${pageContext.request.contextPath}/cruise"> Cruise </a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Language<span
                            class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="${pageContext.request.contextPath}/?language=uk">Ukrainian</a></li>
                        <li><a href="${pageContext.request.contextPath}/?language=en">English</a></li>
                        <li class="divider"></li>
                    </ul>
                </li>
                <li><a href="${pageContext.request.contextPath}/aboutus">About us</a></li>
                <c:if test="${sessionScope.role == 'ADMIN' }">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Admin<span
                                class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="${pageContext.request.contextPath}/country">Country</a></li>
                            <li><a href="${pageContext.request.contextPath}/ship">Ship</a></li>
                            <li><a href="${pageContext.request.contextPath}/cruise">Cruise</a></li>
                            <li><a href="${pageContext.request.contextPath}/orderall">Order All</a></li>
                            <li class="divider"></li>
                        </ul>
                    </li>
                </c:if>

            </ul>


            <ul class="nav navbar-nav navbar-right">

                <li><a href="${pageContext.request.contextPath}/contact">
                    <span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> CONTACT US</a></li>
                <c:choose>
                    <c:when test="${sessionScope.user == null}">
                        <li><a href="${pageContext.request.contextPath}/login"> Login </a></li>
                        <li><a href="${pageContext.request.contextPath}/registration"> Registration </a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-expanded="false">Account<span
                                    class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="${pageContext.request.contextPath}/profile">My Profile</a></li>
                                <li><a href="${pageContext.request.contextPath}/logout">Log out</a></li>
                                <li class="divider"></li>

                            </ul>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/cart"><img class="cart"
                                                                                   src="${pageContext.request.contextPath}/images/cart.png"></a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container -->
</nav>
<!-- NAVBAR END -->


<c:set var="lastPath" value="${sessionScope.path}" scope="session"/>
<div class="wrapper">
    <div class="content container">

       <h1> You don't have permission to access this page or actions.</h1>
        <hr>
        <c:choose>
            <c:when test="${sessionScope.role == 'GUEST'}">
                <a href="${pageContext.request.contextPath}/login" class="btn btn-primary btn-lg">
                    Sign in
                </a>
                <a href="${pageContext.request.contextPath}/registration" class="btn btn-warning btn-lg"
                   role="button">Create
                    Account
                </a>
            </c:when>
            <c:otherwise>
                <<%--c:redirect url="${pageContext.request.contextPath}/cruise"/>--%>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
</html>
