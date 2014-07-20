<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/24/14
  Time: 5:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Login</title>
</head>




<body>
<form:form method="POST" commandName="login" action="/login.htm">
    <div>UserName</div>
    <div>
        <form:input path="userName"  />
    </div>
    <br>

    <div>Password</div>
    <div>
        <form:password path="password" />
    </div>
    <br>

    <div>
        <input type="submit" value="Submit">
    </div>

</form:form>
</body>
</html>
