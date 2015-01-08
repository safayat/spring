<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/24/14
  Time: 5:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Login</title>
</head>


<body>
<div class="container">
    <jsp:include page="/WEB-INF/pages/common/head.jsp"/>

    <form:form method="POST" commandName="login" action="/login.htm" cssClass="form-horizontal">

        <div class="form-group">
            <label class="col-sm-2 control-label">UserName</label>

            <div class="col-sm-5">
                <form:input path="userName" cssClass="form-control"/>
                <form:errors path="userName" cssClass="has-error"/>
            </div>
        </div>
        <br>

        <div class="form-group">
            <label class="col-sm-2 control-label">Password</label>

            <div class="col-sm-5">
                <form:password path="password" cssClass="form-control"/>
                <form:errors path="password" cssClass="has-error"/>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">Sign in</button>
            </div>
        </div>

    </form:form>
</div>



</body>
</html>
