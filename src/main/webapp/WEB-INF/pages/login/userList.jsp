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
            <h1>Home</h1>

            <div class="breadcrumb-wrapper hidden-xs">
                <span class="label">You are here:</span>
                <ol class="breadcrumb">
                    <li>
                        <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/index.html">Dashboard</a>
                    </li>
                    <li>Pages</li>
                    <li class="active">Blank Page</li>
                </ol>
            </div>
        </div>
        <section id="main-content" class="animated fadeInUp">
            <%-- <div data-ng-app="myApp">
                 <div data-ng-controller="MyController">--%>
            <div class="row" data-ng-app="myApp">
                <div class="col-md-12">

                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Responsive table</h3>

                            <div class="actions pull-right">
                                <i class="fa fa-chevron-down"></i>
                                <i class="fa fa-times"></i>
                            </div>
                        </div>
                        <div class="panel-body" data-ng-controller="MyController">
                            <table class="table table-striped table-bordered dataTable no-footer">
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
                </div>
            </div>
        </section>
    </section>
    <!--main content end-->
</section>


</body>


</html>
