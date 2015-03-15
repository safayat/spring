<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/25/14
  Time: 11:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="form-group">
    <label class="col-sm-3 control-label">UserName</label>
    <div class="col-sm-6">
        <form:input path="username" cssClass="form-control"/>
        <form:errors path="username" cssClass="error"/>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-3 control-label">Password</label>
    <div class="col-sm-6">
        <form:password path="password" cssClass="form-control"/>
        <form:errors path="password" cssClass="error"/>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-3 control-label">Confirm Password</label>
    <div class="col-sm-6">
        <form:password path="confirmPassword" class="form-control" />
    </div>
</div>

<div class="form-group">
    <label class="col-sm-3 control-label">Email Address</label>
    <div class="col-sm-6">
        <form:input path="email" cssClass="form-control" />
        <form:errors path="email" cssClass="error"/>
    </div>
</div>



