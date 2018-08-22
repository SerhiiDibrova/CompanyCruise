<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 8/20/2018
  Time: 11:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
Login
<p align="center"><label class="colortext"> ${message} </label></p>
<form action="signin">

    Please enter your username
    <input type="text" name="email"/><br>

    Please enter your password
    <input type="text" name="password"/>

    <input type="submit" value="submit">

</form>
</body>
</html>
