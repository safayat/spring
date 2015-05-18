<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/pages/common/head.jsp"/>
<script type="text/javascript">
    var app = angular.module('myApp', []);
    function MyController($scope, $http){
        $http({method: 'GET', url: 'getClass.web?classId=${requestScope.classId}'}).
                success(function(data, status, headers, config) {
                    $scope.clazz = data;

                });

    }
    /*angular.element(document).ready(function () {
     $('#admissionDate').datepicker();
     });*/
</script>
<section id="main-wrapper" class="theme-default">
    <jsp:include page="/WEB-INF/pages/common/header.jsp?v=2"/>
    <jsp:include page="/WEB-INF/pages/common/menu.jsp?v=2"/>

    <!--main content start-->
    <section class="main-content-wrapper"  data-ng-app="myApp">
        <div class="pageheader">
            <h1>Class Management</h1>
        </div>
        <section id="main-content" class="animated fadeInUp"  data-ng-controller="MyController">
            <div class="row">
                <div class="col-md-12">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">{{clazz.className}}</h3>
                        </div>
                        <div class="panel-body">
                            <div class=" pull-right">
                                <a href="${appBaseUrl}/private/rollCall.web?classId={{clazz.classId}}" class="btn btn-success btn-lg">Roll Call</a>
                                &nbsp;&nbsp;<a href="${appBaseUrl}/private/classCourses.web?classId={{clazz.classId}}" class="btn btn-primary btn-lg">Course List</a>
                                &nbsp;&nbsp;<a href="${appBaseUrl}/private/CourseRoutine.web?classId={{clazz.classId}}" class="btn btn-primary btn-lg">Course Routine</a>
                            </div>

                            <label class="control-label">Class teacher &nbsp;:&nbsp; </label>{{clazz.classTeacher.profile.firstName}}
                            <br/>
                            <label class="control-label">Total Student &nbsp;:&nbsp; </label>{{clazz.studentList.length}}
                            <br/>
                            <label class="control-label">Student List</label>
                            <table class="table table-striped table-bordered dataTable no-footer">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Role</th>
                                        <th>Admission Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="item in clazz.studentList">
                                        <td>{{item.profile.firstName}}&nbsp;{{item.profile.lastName}}</td>
                                        <td>{{item.rollNumber}}</td>
                                        <td>{{item.admissionDate | date:'fullDate'}}</td>
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
