<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/25/14
  Time: 11:51 AM
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
            <h1>Leave Application List</h1>
        </div>
        <div id="main-content" class="main-content" data-ng-app="myApp">
            <div>
                <div ng-controller = "MyController">

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
    <!--main content end-->
    </tiles:putAttribute>
</tiles:insertDefinition>
