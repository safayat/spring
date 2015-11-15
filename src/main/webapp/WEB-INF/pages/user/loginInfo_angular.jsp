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
    <label class="col-sm-3 control-label">UserName</label>
    <div class="col-sm-6">
        <input type="text" ng-model="username" class="form-control"  />
    </div>
</div>

<div class="form-group">
    <label class="col-sm-3 control-label">Password</label>
    <div class="col-sm-6">
        <input type ="password" ng-model="password" class="form-control" />
    </div>
<%--
        <div class="col-sm-2">
            <button type="button" class="btn btn-primary" ng-click="updateUserPassword()">Update</button>
        </div>
--%>
</div>

<div class="form-group">
    <label class="col-sm-3 control-label">Confirm Password</label>
    <div class="col-sm-6">
        <input type="password"  ng-model="confirmPassword" class="form-control" />
    </div>
</div>

<div class="form-group">
    <label class="col-sm-3 control-label">Email Address</label>
    <div class="col-sm-6">
       <input type="text"  ng-model="email" class="form-control" />
    </div>
</div>



