<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/25/14
  Time: 11:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<tiles:insertDefinition name="aircraftTemplate">


    <tiles:putAttribute name="body"> <!--main content start-->
        <!--main content start-->
        <div class="content">
            <div class="header">
                <h1>Add Update Student</h1>
            </div>
            <div class="main-content" data-ng-app="myApp">
                <div class="row">
                    <div class="col-md-12" data-ng-controller="MyController">
                        <form method="POST" class="form-horizontal form-border" ng-submit="saveStudent()">


                            <jsp:include page="/WEB-INF/pages/user/loginInfo.jsp"/>
                            <input type="hidden" ng-model="user.classId"/>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Class</label>

                                <div class="col-sm-2">
                                    <select ng-model="s_className" class="form-control" id="classNameSelect" required="true" ng-change="selectClassForStudent()">
                                        <option value="">select class name</option>
                                        <option  ng-repeat="className in classInfo.classNames" value="{{className}}" ng-selected="{{s_className == className}}">{{className}}</option>
                                    </select>
                                </div>

                                <div class="col-sm-2">
                                    <select class="form-control" ng-model="s_sectionName" required="true" ng-change="selectClassForStudent()">
                                        <option value="">select section</option>
                                        <option ng-repeat="section in classInfo.sections" value="{{section}}" ng-selected="{{s_sectionName == section}}">{{section}}</option>
                                    </select>
                                </div>

                                <div class="col-sm-2">
                                        <%--<input id="sectionName" class="form-control"/>--%>
                                    <select class="form-control" ng-model="s_shiftName" required="true" ng-change="selectClassForStudent()">
                                        <option value="">select shift</option>
                                        <option ng-repeat="shift in classInfo.shifts" value="{{shift}}" ng-selected="{{s_shiftName == shift}}">{{shift}}</option>
                                    </select>
                                </div>
                                <span style="color: red" ng-show="showClassWarningMsg">Class not found</span>
                            </div>



                            <div class="form-group">
                                <label class="col-sm-3 control-label">Admission Date</label>
                                <div class="col-sm-6">
                                    <datepicker date-format="dd/MM/yyyy">
                                        <input ng-model="user.admissionDate" class="form-control" name = "admissionDate" id="admissionDate"/>
                                    </datepicker>

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Roll Number</label>

                                <div class="col-sm-6">
                                    <input ng-model="user.rollNumber" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label"></label>

                                <div class="col-sm-6">
                                    <button type="submit" class="btn btn-primary btn-block">Submit</button>
                                </div>
                            </div>
                            <div class="form-group" ng-show="showErrorMsg">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-6">
                                    <div class="alert-error alert">{{errorMsg}}</div>
                                </div>
                            </div>


                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--main content end-->
        <script src="${appBaseUrl}/js/class.js"></script>

        <script type="text/javascript">

            var app = angular.module('myApp', ['720kb.datepicker']);
            app.controller("MyController", MyController);
            function MyController($scope, $http){
                var selectedClassId;
                var vm = $scope;
                vm.user = {};
                vm.saveStudent = function(){
                    vm.showErrorMsg = false;
                    vm.user.userType="student";
                    if(vm.usernameNotUnique == true){
                        $('#username').focus();
                        return;
                    }
                    if(isEmpty(vm.user.classId)){
                        $('#classNameSelect').focus();
                        return;
                    }
                    $http({
                        method: 'POST',
                        url: '${appBaseUrl}/admin/private/createUser.web',
                        data: $.param(vm.user),
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
                    }).success(function (data) {
                        console.log(data);
                        if(data.successful){
                            window.location.href = '${appBaseUrl}/private/profileInfo.web?userId=' + data.data;
                        }
                        else{
                            vm.showErrorMsg = true;
                            vm.errorMsg = data.message;
                        }
                    });
                }


                initClazzList($http,'${appBaseUrl}/private/getClassList.web', function(data){
                    vm.classInfo= data;
                    $http.get("${appBaseUrl}/private/getSections.web").success(function(sections){
                        vm.classInfo.sections = sections;
                        console.log(vm.classInfo.sections);

                    });
                    $http.get("${appBaseUrl}/private/getShifts.web").success(function(shifts){
                        vm.classInfo.shifts = shifts;
                    });

                    console.log(vm.classInfo);

                });

                vm.selectClassForStudent = function(){
                    if(notEmpty(vm.s_className) && notEmpty(vm.s_sectionName) && notEmpty(vm.s_shiftName)){
                        vm.showClassWarningMsg = false;
                        vm.user.classId = filterClazz(vm.classInfo.classList,vm.s_className, vm.s_sectionName, vm.s_shiftName).pop();
                        if(vm.user.classId == undefined){
                            vm.showClassWarningMsg = true;
                        }
                        console.log(vm.user.classId);
                    }
                }

                vm.verifyUserName = function () {
                    if (vm.user.username.length < 3)
                        return;
                    $http.get('${appBaseUrl}/private/search/login.web?username=' + vm.user.username).success(function (data) {
                        vm.usernameNotUnique = data != '';
                    }).error(function (data) {
                        console.log('error');
                    });
                }



            }



        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
