<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/25/14
  Time: 11:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

