<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/pages/common/head.jsp"/>
<link rel="stylesheet" href="${appBaseUrl}/css/calender.css">
<script type="text/javascript">
    // define angular module/app
    var formApp = angular.module('formApp', []);
    // create angular controller and pass in $scope and $http
    function formController($scope, $http) {
        // create a blank object to hold our form information
        // $scope will allow this to pass between controller and view
        $scope.formData = {};
        // process the form
        $scope.processForm = function() {
            $scope.formData.attendancedateFrom = $('#attendancedateFrom').val();
            $scope.formData.attendancedateTo = $('#attendancedateTo').val();
            $http({
                method  : 'POST',
                url     : '${appBaseUrl}/private/AttendanceHistory.web',
                data    : $.param($scope.formData),  // pass in data as strings
                headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
            })
                    .success(function(data) {
                        console.log(data);
                        $scope.absentDateList = data;

                    });
        };
    }
    angular.element(document).ready(function () {
        $('#attendancedateFrom').datepicker();
        $('#attendancedateTo').datepicker();
    });
</script>
<section id="main-wrapper" class="theme-default" >
    <jsp:include page="/WEB-INF/pages/common/header.jsp?v=2"/>
    <jsp:include page="/WEB-INF/pages/common/menu.jsp?v=2"/>

    <!--main content start-->
    <section class="main-content-wrapper" ng-app="formApp" ng-controller="formController">
        <div class="pageheader">
            <h1>Home</h1>

            <div class="breadcrumb-wrapper hidden-xs">
                <span class="label">Roll Call</span>
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
            <div class="row">
                <div class="col-md-12">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Attendance History</h3>
                        </div>
                        <div class="panel-body">

                            <form class="form-inline" ng-submit="processForm()">

                                <div class="form-group">
                                    <label>Student</label>
                                    <select name = "studentId" value="2" ng-model = "formData.studentId" >
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
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


                            <div class="cal-month-box">


                                <div class="cal-row-fluid cal-before-eventlist">
                                    <div class="cal-cell1 cal-cell" data-cal-row="-day1" ng-repeat="item in absentDateList">
                                        <div class="cal-month-day cal-day-outmonth cal-day-weekend cal-month-first-row">
                                            <span class="pull-right" data-cal-date="2013-02-24" data-cal-view="day"
                                                  data-toggle="tooltip" title="" data-original-title="">{{item}}</span>

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
