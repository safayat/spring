<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/25/14
  Time: 11:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


        <div class="form-group">
            <label class="col-sm-3 control-label">First Name</label>
            <div class="col-sm-6">
                <input ng-model="user.firstName" class="form-control" required="true"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">Last Name</label>
            <div class="col-sm-6">
                <input ng-model="user.lastName" class="form-control" required="true"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">UserName</label>
            <div class="col-sm-6">
                <input ng-model="user.username" class="form-control" id="username" ng-change="verifyUserName()" required="true"/>
                <span ng-if="usernameNotUnique == true" style="color: red">username exists</span>
                <span ng-if="user.username.length < 3" style="color: red">username should have at least 3 chars</span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label">Password</label>
            <div class="col-sm-6">
                <input type="password"  ng-model="user.password" class="form-control" required="true"/>
                <span ng-if="user.password != undefined && user.password.length < 4" style="color: red">password should have at least 4 chars</span>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-3 control-label">Email Address</label>
            <div class="col-sm-6">
                <input type="email" ng-model="user.email" class="form-control"  />
            </div>
        </div>



