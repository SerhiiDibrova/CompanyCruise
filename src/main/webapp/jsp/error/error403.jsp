<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page isErrorPage="true" %>

<html>
<head>
   <title> Access is denied</title>
</head>
<body>
<c:set var="lastPath" value="${sessionScope.path}" scope="session"/>
<div class="wrapper">
    <div class="content container">
        You don't have permission to access this page or actions.
        <hr>
        <c:choose>
            <c:when test="${sessionScope.role == 'GUEST'}">
                <a href="${pageContext.request.contextPath}/login">
                    Sign in
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
