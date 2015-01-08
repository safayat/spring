<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/25/14
  Time: 11:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="http://getbootstrap.com/favicon.ico">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:include page="/WEB-INF/pages/common/head.jsp" />

</head>
<body>
    <%--<jsp:include page="/WEB-INF/pages/common/header.jsp" />--%>

<div class="container" style="width: 500px">
    <c:if test="${not empty requestScope.errorMsg}">
        <div class="alert alert-danger">
            ${requestScope.errorMsg}
        </div>
    </c:if>
    <h1>Signup</h1>

    <form:form method="POST" commandName="signup" action="/signup.htm" cssClass="form">

        <div class="form-group">
            <label>UserName</label>
            <form:input path="userName" cssClass="form-control"/>
            <form:errors path="userName" cssClass="error"/>
        </div>

        <div class="form-group">
            <label>Password</label>
            <form:password path="password" cssClass="form-control"/>
            <form:errors path="password" cssClass="error"/>
        </div>

        <div class="form-group">
            <label>Confirm Password</label>
            <input type="password" class="form-control" id="confirmPassword"/>
        </div>

        <div class="form-group">
            <label>Email Address</label>
            <form:input path="email" cssClass="form-control" />
            <form:errors path="email" cssClass="has-error"/>
        </div>

        <button type="submit" class="btn btn-primary">Signup</button>

    </form:form>
</div>
</body>
</html>
