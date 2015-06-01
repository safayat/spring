<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/pages/common/head.jsp"/>
<script type="text/javascript">
    var formApp = angular.module('formApp', []);
    // create angular controller and pass in $scope and $http
    function formController($scope, $http) {
        // create a blank object to hold our form information
        // $scope will allow this to pass between controller and view
        $scope.formData = {};

        // process the form
        $scope.processForm = function() {
            $scope.formData.fromDate = $('#attendancedateFrom').val();
            $scope.formData.toDate = $('#attendancedateTo').val();
            $http({
                method  : 'POST',
                url     : '${appBaseUrl}/private/getFilteredAttendance.web',
                data    : $.param($scope.formData),  // pass in data as strings
                headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
            })
                    .success(function(data) {
                        console.log(data);
                        $scope.attendanceList = data;

                    });
        };
    }
    angular.element(document).ready(function () {
        $('#attendancedateFrom').datepicker();
        $('#attendancedateTo').datepicker();

    });

</script>
<section id="main-wrapper" class="theme-default">
    <jsp:include page="/WEB-INF/pages/common/header.jsp?v=2"/>
    <jsp:include page="/WEB-INF/pages/common/menu.jsp?v=2"/>

    <!--main content start-->
    <section class="main-content-wrapper">
        <div class="pageheader">
            <h1>Attendance</h1>
        </div>
        <section id="main-content" class="animated fadeInUp">
            <div class="row" data-ng-app="formApp">
                <div class="col-md-12">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">View Attendance History</h3>
                        </div>
                        <div class="panel-body" ng-controller="formController">

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
        </section>
    </section>
    <!--main content end-->
</section>
