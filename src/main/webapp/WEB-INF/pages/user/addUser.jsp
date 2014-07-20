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
<form:form method="POST" commandName="user" action="/userAdd.htm">
    <div>First Name</div>
    <div>
        <form:input path="firstName"  />
    </div>
    <br>

    <div>Last Name</div>
    <div>
        <form:input path="lastName" />
    </div>
    <br>

    <div>Mobile NO</div>
    <div>
        <form:input path="mobileNo" />
    </div>

    <div>Login Id</div>
    <div>
        <form:input path="loginId" value="0"/>
    </div>

    <div>
        <input type="submit" value="Submit">
    </div>

</form:form>
</body>
</html>
