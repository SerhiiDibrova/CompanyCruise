<%@include file="static/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ship List</title>
    <c:import url="static/head.jsp"/>
    <c:import url="static/table.jsp"/>
</head>
<body>
<c:import url="static/menu.jsp"/>
<div id="wrapper">
    <h1>Ships List</h1>
    <table id="keywords" cellspacing="0" cellpadding="0">
        <thead>
        <tr>
            <th><span>id</span></th>
            <th><span>Name</span></th>
            <th><span>Capacity</span></th>
            <th><span>URI image</span></th>
            <th colspan="2"><span>Action</span></th>
        </tr>
        </thead>
        <c:forEach var="ship" items="${ships}">
            <tbody>
            <tr>
                <td class="lalign"><c:out value="${ship.ship_id}"/></td>
                <td class="lalign"><c:out value="${ship.name}"/></td>
                <td class="lalign" align="center"><c:out value="${ship.capacity}"/></td>
                <c:forEach var="image" items="${ship.shipImageList}">

                <td><c:out value="${image.uri}"/></td>
            </c:forEach>
                <td class="lalign">
                    <a href="/shipedit?id=<c:out value='${ship.ship_id}' />" class="btn btn-warning btn-sm"><fmt:message key="label.button.edit"/></a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="/shipdelete?id=<c:out value='${ship.ship_id}' />" class="btn btn-success btn-sm"><fmt:message key="label.button.delete"/></a>
                </td>
            </tr>
            </tbody>
        </c:forEach>
    </table>
    <div align = "center">
        <a href="${pageContext.request.contextPath}/shipadd?id=<c:out value='${ship.ship_id}' />"
           class="btn btn-primary btn-sm">Add</a>
    </div>
</div>
</body>
</html>
