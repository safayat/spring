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
                        <form:form method="POST" commandName="student" action="/admin/private/createStudent.web"
                                   cssClass="form-horizontal form-border" >

                            <c:set var="readOnly" value="${student.studentId > 0}" scope="request"/>

                            <jsp:include page="/WEB-INF/pages/user/loginInfo.jsp"/>
                            <form:hidden path="studentId"/>
                            <form:hidden path="userId"/>
                            <form:hidden path="classId"/>
                            <input name="login.userType" id="login.userType" value="student" style="display: none"/>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Class</label>

                                <div class="col-sm-2">
                                    <select ng-model="s_className" class="form-control" required="true" ng-change="selectClassForStudent()">
                                        <option value="">select class name</option>
                                        <option  ng-repeat="className in classNames" value="{{className}}" ng-selected="{{s_className == className}}">{{className}}</option>
                                    </select>
                                </div>

                                <div class="col-sm-2">
                                    <select class="form-control" ng-model="s_sectionName" required="true" ng-change="selectClassForStudent()">
                                        <option value="">select section</option>
                                        <option ng-repeat="section in sections" value="{{section}}" ng-selected="{{s_sectionName == section}}">{{section}}</option>
                                    </select>
                                </div>

                                <div class="col-sm-2">
                                        <%--<input id="sectionName" class="form-control"/>--%>
                                    <select class="form-control" ng-model="s_shiftName" required="true" ng-change="selectClassForStudent()">
                                        <option value="">select shift</option>
                                        <option ng-repeat="shift in shifts" value="{{shift}}" ng-selected="{{s_shiftName == shift}}">{{shift}}</option>
                                    </select>
                                </div>

                            </div>



                            <div class="form-group">
                                <label class="col-sm-3 control-label">Admission Date</label>
                                <div class="col-sm-6">
<%--
                                    <form:input path="admissionDate" class="form-control" data-date="12/02/2012"
                                                data-date-format="dd/mm/yyyy" readonly="true"/>


--%>
                                    <datepicker date-format="dd/MM/yyyy">
                                        <input ng-model="admissionDate" class="form-control" name = "admissionDate" id="admissionDate"/>
                                    </datepicker>

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Roll Number</label>

                                <div class="col-sm-6">
                                    <form:input path="rollNumber" cssClass="form-control"/>
                                    <form:errors path="rollNumber" cssClass="has-error"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label"></label>

                                <div class="col-sm-6">
                                    <button type="submit" class="btn btn-primary btn-block">Signup</button>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
        <!--main content end-->
        <script type="text/javascript">

            var app = angular.module('myApp', ['720kb.datepicker']);
            app.controller("MyController", MyController);
            angular.element(document).ready(function () {
                console.log("in ready");
                $('#admissionDate').datepicker();
            });
            function MyController($scope, $http){
                $scope.classList = [];
                var selectedClassId;
                $http.get('${appBaseUrl}/private/getClassList.web').success(function(data){
                    console.log(data);
                    $scope.classList = data;
                    function concatUniqueElements(list, elem){
                        var result = '';
                        if(list.indexOf(elem) == -1){
                            if(list != ''){
                                result = result + ',';
                            }
                            result = result + elem;
                        }
                        return result;

                    }
                    var sections = '';
                    var shifts = '';
                    var classNames = '';

                    $scope.classList.forEach(function(clazz){
                        classNames = classNames + concatUniqueElements(classNames,clazz.className);
                        shifts = shifts + concatUniqueElements(shifts,clazz.shiftName);
                        sections = sections + concatUniqueElements(sections,clazz.sectionName);
                    });
                    $scope.sections = sections.split(',');
                    $scope.shifts = shifts.split(',');
                    $scope.classNames = classNames.split(',');


                }).error(function(data,status){
                            console.log("error");
                        });

                $scope.selectClassForStudent = function(){
                    if($scope.s_className !="" && $scope.s_sectionName !="" && $scope.s_shiftName !=""){
                        $scope.classList.forEach(function(clazz){
                            if(clazz.shiftName == $scope.s_shiftName && clazz.sectionName == $scope.s_sectionName && clazz.className == $scope.s_className ){
                                selectedClassId = clazz.classId;
                            }
                            console.log(selectedClassId);
                        });
                        $("#classId").val(selectedClassId);

                    }
                }

                $scope.verifyUserName = function(){
                    if($scope.loginUsername.length <3) return;
                    $http.get('${appBaseUrl}/private/search/login.web?username='+$scope.loginUsername).success(function(data){
                        if(data == ''){
                            $scope.usernameNotUnique = false;
                        }else{
                            $scope.usernameNotUnique = true;
                        }

                    }).error(function(data){
                                console.log('error');

                            });
                }


            }



        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
