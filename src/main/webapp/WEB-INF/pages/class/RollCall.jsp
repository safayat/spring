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
    <section class="main-content-wrapper">
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
            <div class="row" data-ng-app="myApp">
                <div class="col-md-12">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Responsive table</h3>

                            <div class="actions pull-right">
                                <i class="fa fa-chevron-down"></i>
                                <i class="fa fa-times"></i>
                            </div>
                        </div>
                        <div class="panel-body" data-ng-controller="MyController">

                            <form method="post" action="${appBaseUrl}/private/rollCall.web">

                                <table class="table table-striped table-bordered dataTable no-footer">
                                    <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Role</th>
                                        <th class="presentStudentList">Present</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr ng-repeat="item in clazz.studentList">
                                        <td></td>
                                        <td>{{item.rollNumber}}</td>
                                        <td class="presentStudentList"><input type="checkbox"  name="presentStudentList" value="{{item.studentId}}" ></td>
                                    </tr>
                                    </tbody>
                                </table>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label"></label>
                                    <div class="col-sm-6">
                                        <button type="submit" class="btn btn-primary btn-block">Save Attendace</button>
                                    </div>
                                </div>
                                <input type="hidden" name="classId" value="${requestScope.classId}"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>
    <!--main content end-->
</section>
