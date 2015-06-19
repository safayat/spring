<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertDefinition name="aircraftTemplate">

    <tiles:putAttribute name="body">    <!--main content start-->

    <div class="content" ng-app="myApp" ng-controller="formController">
        <div class="header">
            <h1>Attendance History</h1>
        </div>
        <div class="main-content">
            <div>
                <form class="form-inline" ng-submit="processForm()">

                        <div class="form-group">
                            <label>Student</label>
                            <select name = "studentId" value="2" ng-model = "formData.studentId" >
                                <option value="2" ng-repeat = "student in studentList" value="{{student.studentId}}">{{student.profile.firstName}}</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>From</label>
                            <input type="text" id="attendancedateFrom"
                                   class="form-control" data-date="12/02/2012" data-date-format="dd/mm/yyyy"
                                   value="12/02/2012" readonly="true" ng-model="formData.attendancedateFrom">
                        </div>

                        <div class="form-group">
                            <label>To</label>
                            <input type="text" id="attendancedateTo"  ng-model="formData.attendancedateTo"
                                   class="form-control" data-date="12/02/2012"
                                   data-date-format="dd/mm/yyyy" value="12/02/2012" readonly="true">
                        </div>

                        <button type="submit" class="btn btn-default">Show Attendace history</button>

                    </form>
                    <br/>
                    <br/>
                    <div class="cal-month-box" style="padding: 20px;display: inline;background-color: palevioletred"  ng-repeat="item in absentDateList">
                           <b>{{item | date:'fullDate'}}</b>
                    </div>
            </div>
        </div>
    </div>
    <!--main content end-->
    </tiles:putAttribute>
</tiles:insertDefinition>
