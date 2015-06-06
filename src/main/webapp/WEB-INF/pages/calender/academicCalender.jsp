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

            var months = [{"month":{"name":"January","value":0,"days":31}},{"month":{"name":"February","value":1,"days":28}},{"month":{"name":"March","value":2,"days":31}},{"month":{"name":"April","value":3,"days":30}},{"month":{"name":"May","value":4,"days":31}},{"month":{"name":"June","value":5,"days":30}},{"month":{"name":"July","value":6,"days":31}},{"month":{"name":"August","value":7,"days":31}},{"month":{"name":"September","value":8,"days":30}},{"month":{"name":"October","value":9,"days":31}},{"month":{"name":"November","value":10,"days":30}},{"month":{"name":"December","value":11,"days":31}}];
            var defaultDate = new Date();
            $scope.academicMonth = defaultDate.getMonth();
            $scope.updateCalender = function(){

                defaultDate.setMonth($scope.academicMonth);
                defaultDate.setDate(1);
                $scope.academicMonthDays = getDaysInAMonth($scope.academicMonth);
                $scope.academicPreviousMonthDays = getDaysInAMonth($scope.academicMonth-1);
                $scope.dayIndex= $scope.academicPreviousMonthDays-defaultDate.getDay();

                var totoalRow = parseInt(($scope.academicMonthDays+defaultDate.getDay())/7);
                if(($scope.academicMonthDays+defaultDate.getDay())%7>0){
                    totoalRow++;
                }
                $scope.weekArray = [];
                for(var i=0;i<totoalRow;i++){
                    $scope.weekArray.push(i);
                }

            }

            $scope.updateCalender();

            function getDaysInAMonth(monthNo){
              if(monthNo<0)monthNo=11;
              if(monthNo>11)monthNo=monthNo%12;
              return months.filter(function(item){
                  return item.month.value ==  monthNo
              }).map(function(item){
                          return item.month.days;
                      }).pop();
            }
        }
        app.filter("datePosition", function() {
            return function(input,pmdays,mdays,week,day) {
                input = input + 7*week + day;
                if(week ==0){
                    if(input<=pmdays)
                       return input;
                }
                input = input - pmdays;
                if(input>mdays)
                    return input%mdays;
                return input;

            }

        });


    </script>
</head>
<section id="main-wrapper" class="theme-default">
    <jsp:include page="/WEB-INF/pages/common/header.jsp?v=2"/>
    <jsp:include page="/WEB-INF/pages/common/menu.jsp?v=2"/>

    <!--main content start-->
    <section class="main-content-wrapper">
        <div class="pageheader">
            <h1>Academic Calender 2015</h1>
        </div>
        <section id="main-content" class="animated fadeInUp">
            <div class="row" data-ng-app="myApp">
                <div class="col-md-12">

                    <div class="panel panel-default">
                        <div class="panel-body" ng-controller="MyController">


                            <select class="input-sm" ng-model="academicMonth" ng-change="updateCalender()">
                                <option value="0">January</option>
                                <option value="1">February</option>
                                <option value="2">March</option>
                                <option value="3">April</option>
                                <option value="4">May</option>
                                <option value="5">June</option>
                                <option value="6">July</option>
                                <option value="7">August</option>
                                <option value="8">September</option>
                                <option value="9">October</option>
                                <option value="10">November</option>
                                <option value="11">December</option>
                            </select>
                            <br/>
                             <br/>
                            <table class="table tab-bottom table-bordered">
                                <thead>
                                    <tr style="background-color: rgba(139, 139, 169, 0.99)">
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
                                   <tr ng-repeat = "n in weekArray" style="height: 100px;line-height: normal;font-weight: bold;font-size: 25px;text-align: center">
                                       <td>{{ (dayIndex)  |  datePosition:academicPreviousMonthDays:academicMonthDays:n:1 }}</td>
                                       <td>{{ (dayIndex)  |  datePosition:academicPreviousMonthDays:academicMonthDays:n:2 }}</td>
                                       <td>{{ (dayIndex)  |  datePosition:academicPreviousMonthDays:academicMonthDays:n:3 }}</td>
                                       <td>{{ (dayIndex)  |  datePosition:academicPreviousMonthDays:academicMonthDays:n:4 }}</td>
                                       <td>{{ (dayIndex)  |  datePosition:academicPreviousMonthDays:academicMonthDays:n:5 }}</td>
                                       <td style="color: red">{{ (dayIndex)  | datePosition:academicPreviousMonthDays:academicMonthDays:n:6 }}</td>
                                       <td style="color: red">{{ (dayIndex)  | datePosition:academicPreviousMonthDays:academicMonthDays:n:7 }}</td>
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