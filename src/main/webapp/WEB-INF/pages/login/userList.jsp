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
    <%--<jsp:include page="/WEB-INF/pages/common/header.jsp" />--%>
</head>

<script type="text/javascript">
    var app = angular.module('myApp', []);
    function MyController($scope, $http){
        $http({method: 'GET', url: 'getUserData.web'}).
                success(function(data, status, headers, config) {
                    $scope.usersInfo = data;
                }).
                error(function(data, status, headers, config) {
                    // called asynchronously if an error occurs
                    // or server returns response with an error status.
                });
    }
</script>
</head>
<body>
<div data-ng-app="myApp">
    <div data-ng-controller="MyController">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Username</th>
                <th>Firstname</th>
                <th>Lastname</th>
                <th>Email</th>
                <th>Date of birth</th>
            </tr>
            </thead>
            <tbody>
                <tr ng-repeat="item in usersInfo">
                    <td>{{item.username}}</td>
                    <td>{{item.profile.firstname}}</td>
                    <td>{{item.profile.lastName}}</td>
                    <td>{{item.email}}</td>
                    <td>{{item.profile.dateOfBirth | date:'yyyy-MM-dd'}}</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
</body>


</html>
