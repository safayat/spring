<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="aircraftTemplate">
    <tiles:putAttribute name="body">

    <!--main content start-->
    <div class="content">
        <div class="header">
            <h1>View Attendance History</h1>
        </div>
        <div  class="main-content">
            <div  data-ng-app="myApp">
                <div ng-controller="formController">
                    <form class="form-inline" ng-submit="processForm()">

                        <div class="form-group">
                            <label>User</label>
                            <select name = "userId" ng-model = "formData.userId" class="form-control">
                                <option value="-1">ALL</option>
                                <c:forEach var="item" items="${userList}">
                                    <option value="${item.userId}">${item.profile.firstName}&nbsp;${item.profile.lastName}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>From</label>
                            <input type="text" id="attendancedateFrom"
                                   class="form-control" data-date="25/05/2015" data-date-format="dd/mm/yyyy"
                                    readonly="true" ng-model="formData.fromDate">
                        </div>

                        <div class="form-group">
                            <label>To</label>
                            <input type="text" id="attendancedateTo"  ng-model="formData.toDate"
                                   class="form-control" data-date="25/05/2012"
                                   data-date-format="dd/mm/yyyy"  readonly="true">
                        </div>

                        <button type="submit" class="btn btn-default">Show Attendace history</button>

                    </form>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>userId</th>
                                <th>Date</th>
                                <th>Present</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat = "item in attendanceList">
                                <td>{{item.user.profile.firstName}}&nbsp;{{item.user.profile.lastName}}</td>
                                <td>{{item.rollCallDate | date:'fullDate'}}</td>
                                <td><i ng-if="item.present == true" class="fa fa-check"></i> <i ng-if="item.present == false" class="fa fa-crosshairs"></i></td>
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

