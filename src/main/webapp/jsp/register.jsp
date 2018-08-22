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

<form action="signup" method="post">
    <p align="center"><label class="colortext"> ${messageRegister} </label></p>
    <table style="with: 50%">
        <tr>
            <td>Login</td>
            <td><input type="text" name="login" /></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="password" name="password" /></td>
        </tr>
        <tr>
            <td>First Name</td>
            <td><input type="text" name="firstName" /></td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td><input type="text" name="lastName" /></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="text" name="email" /></td>
        </tr>

      </table>
    <input type="submit" value="Submit" /></form>

</body>
</html>
