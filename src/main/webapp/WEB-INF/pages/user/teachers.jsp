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
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:include page="/WEB-INF/pages/common/head.jsp"/>

</head>
<script type="text/javascript">
    var app = angular.module('myApp', []);
    function MyController($scope, $http){
        $http({method: 'GET', url: 'getTeacherList.web'}).
                success(function(data, status, headers, config) {
                    $scope.teachers = data;
                });

    }
</script>
<body>
<div data-ng-app="myApp">
    <div data-ng-controller="MyController">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>Designation</th>
                <th>Joining Date</th>
            </tr>
            </thead>
            <tbody>
            <tr ng-repeat="teacher in teachers">
                <td>{{teacher.designation}}</td>
                <td>{{teacher.joiningDate | date:'yyyy-MM-dd'}}</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
