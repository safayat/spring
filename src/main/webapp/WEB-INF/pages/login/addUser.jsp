<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/28/14
  Time: 4:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title></title>
</head>
<body>
<form:form method="POST" commandName="user">
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
        <form:input path="firstName"  />
    </div>

    <div>
        <form:input path="lastName"  />
    </div>
    <div>
        <input type="submit" value="Submit">
    </div>

</form:form>
</body>
</html>
