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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/pages/common/head.jsp"/>
<script type="text/javascript">
    var app = angular.module('myApp', []);
    function MyController($scope, $http){

        $http({method: 'GET', url: '${appBaseUrl}/private/getLeaveApplicationData.web'}).
        success(function(data, status, headers, config) {
            $scope.leaveApplications = data;

        });

    }
    angular.element(document).ready(function () {
    });
</script>
<body>
<section id="main-wrapper" class="theme-default">
    <jsp:include page="/WEB-INF/pages/common/header.jsp"/>
    <jsp:include page="/WEB-INF/pages/common/menu.jsp"/>

    <!--main content start-->
    <section class="main-content-wrapper">
        <div class="pageheader">
            <h1>Leave Management</h1>

        </div>
        <section id="main-content" class="animated fadeInUp" data-ng-app="myApp">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Leave Application List</h3>
                        </div>
                        <div class="panel-body" ng-controller = "MyController">

                            <select ng-model="leaveType"  class="input-sm">
                                <option value="">Select Leave Type</option>
                                <option value="medical">medical</option>
                                <option value="casual">casual</option>
                            </select>

                            <select ng-model="applicantUser.userType"  class="input-sm">
                                <option value="">Select User Type</option>
                                <option value="teacher">Teacher</option>
                                <option value="student">Student</option>
                                <option value="admin">Admin</option>
                            </select>
                            <br/>
                            <br/>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                       <th>Applicant</th>
                                       <th>User Type</th>
                                       <th>Leave Interval</th>
                                       <th>Leave Type</th>
                                       <th>Leave Status</th>
                                       <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat = "app in leaveApplications | filter: applicantUser.userType | filter: leaveType ">
                                        <td>{{app.applicantUser.profile.firstName}} &nbsp; {{app.applicantUser.profile.firstName}}</td>
                                        <td>{{app.applicantUser.userType}}</td>
                                        <td>{{app.fromDate | date:'fullDate'}} - {{app.toDate | date:'fullDate'}}</td>
                                        <td>{{app.leaveType}}</td>
                                        <td>{{app.leaveStatus}}</td>
                                        <td><a href="${appBaseUrl}/private/approveLeave.web?leaveId={{app.leaveId}}">View Detail</a></td>
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
