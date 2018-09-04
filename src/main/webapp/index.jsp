<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head></head>
<body>
<c:choose>
    <c:when test="${sessionScope.user == null}">
<h2>Hello World!</h2>
<br/>
    </c:when>
    <c:otherwise>
        <h2>Hello World!</h2><h1>${sessionScope.user.login}</h1>
    </c:otherwise>
</c:choose>

<div>
<c:choose>
    <c:when test="${sessionScope.user == null}">
    <a href="${pageContext.request.contextPath}/login">Login</a>
    <br/>
    <a href="${pageContext.request.contextPath}/registration">Registration </a>
    </c:when>
    <c:otherwise>
        <a href="${pageContext.request.contextPath}/profile">
        ${sessionScope.user.login}
        </a>
        <br/>
        <a href="${pageContext.request.contextPath}/logout">
            Logout</a>
    </c:otherwise>
</c:choose>
    <br/>
    <a href="${pageContext.request.contextPath}/country">Country Add</a>
    <br/>
    <a href="${pageContext.request.contextPath}/countrylist">Country List</a>
    <br/>
    <a href="${pageContext.request.contextPath}/shiplist">Ship List</a>
    <br/>
    <a href="${pageContext.request.contextPath}/excursionlist">Excursion List</a>
    <br/>
    <a href="${pageContext.request.contextPath}/cruiselist">Cruise List</a>
    <br/>
    <a href="${pageContext.request.contextPath}/showcard">Card List</a>


</div>
</body>
</html>
