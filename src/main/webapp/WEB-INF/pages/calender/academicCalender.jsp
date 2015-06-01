<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/28/14
  Time: 4:22 PM
  To change this template use File | Settings | File Templates.

--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" href="http://getbootstrap.com/favicon.ico">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:include page="/WEB-INF/pages/common/head.jsp"/>
    <script type="text/javascript">
        var app = angular.module('myApp', []);

//        d.setFullYear(2020, 0, 14);
        function MyController($scope){
            var months = [{"month":{"name":"January","value":0,"days":31}},{"month":{"name":"February","value":1,"days":28}},{"month":{"name":"March","value":2,"days":31}},{"month":{"name":"April","value":3,"days":30}},{"month":{"name":"May","value":4,"days":31}},{"month":{"name":"June","value":5,"days":30}},{"month":{"name":"July","value":6,"days":31}},{"month":{"name":"August","value":7,"days":30}},{"month":{"name":"September","value":8,"days":31}},{"month":{"name":"October","value":9,"days":30}},{"month":{"name":"November","value":10,"days":30}},{"month":{"name":"December","value":11,"days":31}}];
            console.log($scope.months);
//            $scope.parsedMonths = JSON.parse(months);
            $scope.parsedMonths = months;
            console.log($scope.parsedMonths);
/*
 {{myVar === "two" ? "it's true" : "it's false"}}
* */
            $scope.defaultDate = new Date();
            $scope.defaultDate.setDate(1);
            console.log("$scope.defaultDate " + $scope.defaultDate.getDay());
            $scope.academicMonth = $scope.defaultDate.getMonth();
            $scope.academicDayOffset = $scope.defaultDate.getDay();
            $scope.academicMonthDays = getDaysInAMonth($scope.academicMonth);
            if($scope.academicMonthDays>0)
                $scope.academicPreviousMonthDays = getDaysInAMonth($scope.academicMonth-1);
            else
                $scope.academicPreviousMonthDays = getDaysInAMonth(11);
            $scope.weekArray = [0,1,2,3,4,5];

            function getDaysInAMonth(monthNo){
                return months.filter(function(item){
                    return item.month.value ==  monthNo
                }).map(function(item){
                            return item.month.days;
                        }).pop();
            }
            console.log($scope.academicMonthDays);
            $scope.updateCalender = function(){

                $scope.academicMonthDays = months.filter(function(item){
                    return item.month.value ==  $scope.academicMonth
                }).map(function(item){
                            return item.month.days;
                        }).pop();
                console.log($scope.academicMonthDays);


            }
        }

    </script>
</head>
<section id="main-wrapper" class="theme-default">
    <jsp:include page="/WEB-INF/pages/common/header.jsp?v=2"/>
    <jsp:include page="/WEB-INF/pages/common/menu.jsp?v=2"/>

    <!--main content start-->
    <section class="main-content-wrapper">
        <div class="pageheader">
            <h1>Academic Calender</h1>
        </div>
        <section id="main-content" class="animated fadeInUp">
            <div class="row" data-ng-app="myApp">
                <div class="col-md-12">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Calender</h3>
                        </div>
                        <div class="panel-body" ng-controller="MyController">

                            <select ng-model="academicMonth" ng-change="updateCalender()">
                                <option ng-repeat="item in parsedMonths" value="{{item.month.value}}">{{item.month.name}}</option>
                            </select>
                            <%--<select ng-model="academicYear">
                            </select>--%>

                            <table class="table tab-bottom table-bordered">
                                <thead>
                                    <tr>
                                        <th>Sun</th>
                                        <th>MON</th>
                                        <th>Tues</th>
                                        <th>Wed</th>
                                        <th>Thurs</th>
                                        <th>Fri</th>
                                        <th>Sat</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <%--<c:forEach begin="0" end="4" var="week" varStatus="status">
                                        <tr>
                                            <td>${(week*7+1)%30}</td>
                                            <td>${(week*7+2)%30}</td>
                                            <td>${(week*7+3)%30}</td>
                                            <td>${(week*7+4)%30}</td>
                                            <td>${(week*7+5)%30}</td>
                                            <td>${(week*7+6)%30}</td>
                                            <td>${(week*7+7)%30}</td>
                                        </tr>
                                    </c:forEach>--%>
                                       <tr ng-repeat = "n in weekArray">
                                            <td>{{(n*7+1)%(academicMonthDays)+1}}</td>
                                            <td>{{(n*7+2)%(academicMonthDays)+1}}</td>
                                            <td>{{(n*7+3)%(academicMonthDays)+1}}</td>
                                            <td>{{(n*7+4)%(academicMonthDays)+1}}</td>
                                            <td>{{(n*7+5)%(academicMonthDays)+1}}</td>
                                            <td>{{(n*7+6)%(academicMonthDays)+1}}</td>
                                            <td>{{(n*7+7)%(academicMonthDays)+1}}</td>
                                       </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>
</section>