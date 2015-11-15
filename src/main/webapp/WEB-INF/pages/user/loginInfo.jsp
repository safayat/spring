<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/25/14
  Time: 11:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form:hidden path="login.userId"/>

<div class="form-group">
    <label class="col-sm-3 control-label">First Name</label>
    <div class="col-sm-6">
        <form:input path="profile.firstName" cssClass="form-control" />
        <form:errors path="profile.firstName" cssClass="error"/>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-3 control-label">Last Name</label>
    <div class="col-sm-6">
        <form:input path="profile.lastName" cssClass="form-control" />
        <form:errors path="profile.lastName" cssClass="error"/>
    </div>
</div>
<div class="form-group">
    <label class="col-sm-3 control-label">UserName</label>
    <div class="col-sm-6">
        <form:input path="login.username" cssClass="form-control"  ng-model="loginUsername" ng-change="verifyUserName()"/>
        <span ng-if="usernameNotUnique == true" style="color: red">username exists</span>
        <span ng-if="loginUsername.length < 3" style="color: red">username should have at least 3 chars</span>
        <form:errors path="login.username" cssClass="error"/>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-3 control-label">Password</label>
    <div class="col-sm-6">
        <form:password path="login.password" cssClass="form-control" ng-model="userPassword" required="true"/>
        <form:errors path="login.password" cssClass="error"/>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-3 control-label">Confirm Password</label>
    <div class="col-sm-6">
        <form:password path="login.confirmPassword" class="form-control" ng-model="confirmPassword" required="true"/>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-3 control-label">Email Address</label>
    <div class="col-sm-6">
        <form:input path="login.email" cssClass="form-control"  />
        <form:errors path="login.email" cssClass="error"/>
    </div>
</div>



