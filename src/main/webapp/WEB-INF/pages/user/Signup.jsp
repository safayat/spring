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

    <form:form method="POST" commandName="signup" action="/signup.web" cssClass="form">

        <div class="form-group">
            <label>UserName</label>
            <form:input path="login.username" cssClass="form-control"/>
            <form:errors path="login.username" cssClass="error"/>
        </div>

        <div class="form-group">
            <label>Password</label>
            <form:password path="login.password" cssClass="form-control"/>
            <form:errors path="login.password" cssClass="error"/>
        </div>

        <div class="form-group">
            <label>Confirm Password</label>
            <form:password path="login.confirmPassword" class="form-control" />
        </div>

        <div class="form-group">
            <label>Email Address</label>
            <form:input path="login.email" cssClass="form-control" />
            <form:errors path="login.email" cssClass="has-error"/>
        </div>

        <form:select path="userType">
            <form:option value="teacher">Teacher</form:option>
            <form:option value="student">Student</form:option>
            <form:option value="parent">Parent</form:option>
        </form:select>

        <div class="form-group">
            <label>Designation</label>
            <form:input path="destination" cssClass="form-control" />
            <form:errors path="destination" cssClass="has-error"/>
        </div>

        <div class="form-group">
            <label>Joining Date</label>
            <form:input path="joiningDate" cssClass="form-control" />
            <form:errors path="joiningDate" cssClass="has-error"/>
        </div>

        <button type="submit" class="btn btn-primary">Signup</button>

    </form:form>
</div>
</body>
</html>