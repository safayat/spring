<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/25/14
  Time: 11:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/pages/common/head.jsp"/>
<script type="text/javascript">
    var app = angular.module('myApp', []);
    function MyController($scope, $http) {
        $http({method: 'GET', url: 'getUserData.web'}).
                success(function (data, status, headers, config) {
                    $scope.usersInfo = data;
                }).
                error(function (data, status, headers, config) {
                    // called asynchronously if an error occurs
                    // or server returns response with an error status.
                });
    }
</script>
<body>
<section id="main-wrapper" class="theme-default">
    <jsp:include page="/WEB-INF/pages/common/header.jsp?v=2"/>
    <jsp:include page="/WEB-INF/pages/common/menu.jsp?v=2"/>

    <!--main content start-->
    <section class="main-content-wrapper">
        <div class="pageheader">
            <h1>User Management</h1>
        </div>
        <section id="main-content" class="animated fadeInUp">
            <%-- <div data-ng-app="myApp">
                 <div data-ng-controller="MyController">--%>
            <div class="row" data-ng-app="myApp">
                <div class="col-md-12">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">User List</h3>
                        </div>
                        <div class="panel-body" data-ng-controller="MyController">

                            <select ng-model="search.userType" style="float: right" class="input-sm">
                                <option value="">ALL</option>
                                <option value="teacher">Teacher</option>
                                <option value="student">Student</option>
                                <option value="admin">Admin</option>
                                <option value="staff">Staff</option>
                            </select>
                            <br/>
                            <br/>
                            <div class="row">
                                <div class="col-md-2" ng-repeat="item in usersInfo | filter:search" style="width: 11%;padding: 5px">
                                    <div class="thumbnail" style="margin-bottom: 0px">
                                        <img ng-if="item.profile.profileImageUrl == 'image/Default_Profile_Picture.png'" src="${appBaseUrl}/{{item.profile.profileImageUrl}}" alt="..." height="50px" class="img-circle">
                                        <img ng-if="item.profile.profileImageUrl != 'image/Default_Profile_Picture.png'" src="{{item.profile.profileImageUrl}}" alt="..." height="50px" class="img-circle">
                                        <div class="caption">
                                            <h4 style="overflow-x: hidden;overflow-y: hidden">{{item.profile.firstName}}</h4>
                                            <p>{{item.userType}}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>
    <!--main content end-->
</section>


</body>


</html>
