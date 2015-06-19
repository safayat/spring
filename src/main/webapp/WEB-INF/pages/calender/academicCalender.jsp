<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/28/14
  Time: 4:22 PM
  To change this template use File | Settings | File Templates.

--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="aircraftTemplate">
    <tiles:putAttribute name="body">

    <!--main content start-->
    <div class="content">
        <div class="header">
            Academic Calender 2015
        </div>
        <div  class="main-content">
            <div data-ng-app="myApp">
                <div ng-controller="MyController">
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
    </tiles:putAttribute>
</tiles:insertDefinition>
