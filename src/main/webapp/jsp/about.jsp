<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="static/taglib.jsp" %>
<html>
<head>
    <title><fmt:message key="menu.about.us"/></title>
    <c:import url="static/head.jsp"/>
</head>
<body>
<c:import url="static/menu.jsp"/>
<div class="container ">
    <hr>
    <blockquote class="blockquote">
        <p class="mb-0"><fmt:message key="about.my.name"/></p>
        <footer class="blockquote-footer"> <fmt:message key="about.dev"/> </footer>
    </blockquote>
    <hr>
</div>
<div class="container about" align="right">
    <hr>
<blockquote class="blockquote">
    <p class="mb-0"><fmt:message key="about.teacher.name"/></p>
    <footer class="blockquote-footer"><fmt:message key="about.investor"/></footer>
</blockquote>
    <hr>
</div>
<div class="team">


    <div class="container about">
        <h1 align="center"><fmt:message key="about"/></h1>
        <article>
            <br><p><fmt:message key="about.article"/></p>
        </article>
    </div>

</div>
<style>
    p {
        text-indent: 30px; /* Отступ первой строки в пикселах */
    }
</style>
</body>
</html>
