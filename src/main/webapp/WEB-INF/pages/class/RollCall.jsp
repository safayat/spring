<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/pages/common/head.jsp"/>
<script type="text/javascript">
    var app = angular.module('myApp', []);
    function MyController($scope, $http){
        <%--$scope.clazzList = '${classList}';--%>
        $scope.clazzList = '${classList}';
        $scope.clazzList = JSON.parse($scope.clazzList);
        console.log($scope.clazzList);
        $scope.getStudentInfo = function(){

        $http({method: 'GET', url: 'getClass.web?classId='+$('#classIdSelect').val()}).
         success(function(data, status, headers, config) {
         $scope.clazz = data;

         });
        };

    }

    angular.element(document).ready(function () {
        $("#selectAll").click(function(){
            $(".presentBox").prop('checked',$(this).prop('checked'));
        });
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
            <div class="row" data-ng-app="myApp">
                <div class="col-md-12">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Roll Call</h3>
                        </div>
                        <div class="panel-body" data-ng-controller="MyController">

                            <form method="post" action="${appBaseUrl}/private/rollCall.web">

                                <div class="form-group" >
                                    <label class="col-sm-2 control-label">Class Name</label>
                                    <div class="col-sm-6">
                                        <select ng-change="getStudentInfo()" name="classId" id="classIdSelect" ng-model="classId" class="input-sm" style="width: 60%">
                                            <option value="">Select Class</option>
                                            <option ng-repeat="item in clazzList" value="{{item.classId}}">{{item.className}}</option>
                                        </select>
                                    </div>
                                </div>
                                <br/>
                                <div class="form-group" >
                                    <label class="col-sm-3 control-label">Student List</label>
                                    <div class="col-sm-12">
                                <table class="table table-striped table-bordered dataTable no-footer">
                                    <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Role</th>
                                        <th class="presentStudentList">Present <input id="selectAll" type="checkbox" />All
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr ng-repeat="item in clazz.studentList">
                                        <td>{{item.profile.firstName}}&nbsp;{{item.profile.lastName}}</td>
                                        <td>{{item.rollNumber}}</td>
                                        <td class="presentStudentList"><input type="checkbox" class="presentBox" name="presentStudentList" value="{{item.studentId}}" ></td>
                                    </tr>
                                    </tbody>
                                </table>
                                        </div>
                                    </div>

                                <c:if test="${loginInfo.userType == 'teacher'}">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"></label>
                                    <div class="col-sm-6">
                                        <button type="submit" class="btn btn-primary btn-block">Save Attendace</button>
                                    </div>
                                </div>
                                </c:if>
                                <%--<input type="hidden" name="classId" value="${requestScope.classId}"/>--%>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>
    <!--main content end-->
</section>
