<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/jsp/static/taglib.jsp" %>
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

