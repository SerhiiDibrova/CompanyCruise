<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 8/22/2018
  Time: 10:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="countryadd" method="post">
    <p align="center"><label class="colortext"> ${message} </label></p>
    <table style="with: 50%">
        <tr>
            <td>Country</td>
            <td><input type="text" name="name" /></td>
        </tr>
        <tr>
            <td>City</td>
            <td><input type="text" name="city" /></td>
        </tr>


    </table>
    <input type="submit" value="Submit" /></form>

</body>
</html>
