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
<div class="form-group">
    <label class="col-sm-3 control-label"></label>
    <div class="col-sm-6">
        <div id="updateUserPasswordSuccesMsg" style="display: none" class="alert alert-success">Password update successful</div>
        <div id="updateUserPasswordErrorMsg" style="display: none" class="alert alert-danger">Password update failed</div>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-3 control-label">UserName</label>
    <div class="col-sm-6">
        <c:if test="${readOnly == 'true'}"><form:input path="username" cssClass="form-control" readonly="true" /></c:if>
        <c:if test="${readOnly != 'true'}"><form:input path="username" cssClass="form-control" /></c:if>
        <form:errors path="username" cssClass="error"/>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-3 control-label">Password</label>
    <div class="col-sm-6">
        <form:password path="password" cssClass="form-control" ng-model="userPassword"/>
        <form:errors path="password" cssClass="error"/>
    </div>
    <c:if test="${readOnly == 'true'}">
        <div class="col-sm-2">
            <button type="button" class="btn btn-primary" ng-click="updateUserPassword()">Update</button>
        </div>
    </c:if>
</div>

<div class="form-group">
    <label class="col-sm-3 control-label">Confirm Password</label>
    <div class="col-sm-6">
        <form:password path="confirmPassword" class="form-control" ng-model="confirmPassword" />
    </div>
</div>

<div class="form-group">
    <label class="col-sm-3 control-label">Email Address</label>
    <div class="col-sm-6">
        <c:if test="${readOnly == 'true'}"><form:input path="email" cssClass="form-control" readonly="true" /></c:if>
        <c:if test="${readOnly != 'true'}"><form:input path="email" cssClass="form-control"/></c:if>
        <form:errors path="email" cssClass="error"/>
    </div>
</div>



