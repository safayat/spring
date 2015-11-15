<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/28/14
  Time: 4:22 PM
  To change this template use File | Settings | File Templates.

--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="aircraftTemplate">
    <tiles:putAttribute name="body">
        <!--main content start-->
        <div class="content" data-ng-app="myApp" data-ng-controller="MyController">
            <div class="header">
                {{profile.firstName}}&nbsp; {{profile.lastName}}
            </div>
            <div class="main-content" >
                <div class="row">
                    <div class="col-md-2">
                        <form action="${appBaseUrl}/private/uploadProfilePicture.web" method="post"
                              enctype="multipart/form-data">
                            <img src="${appBaseUrl}/{{profile.profileImageUrl}}" class="img-rounded" width="100%">
                            <input name="profileImage" type="file" placeholder="upload profile picture">
                            <input name="profileId" type="hidden" value="{{profile.profileId}}">
                            <button class="btn btn-success">upload</button>
                        </form>
                    </div>
                        <%--<form method="POST" commandName="profile" action="/private/updateProfile.web" class="form-horizontal form-border">--%>
                    <div class="col-md-6">
                        <div class="panel panel-default" ng-init="viewMode = true">
                            <div class="panel-heading">User Info
                                <a href class="pull-right" ng-click="viewMode = !viewMode">
                                    <span ng-show="viewMode"  class="text-info fa fa-edit fa-fw" ></span>
                                    <span ng-show="!viewMode" class="text-info fa fa-eye fa-fw" ></span>
                                </a>
                            </div>
                            <div class="panel-body">
                                <form class="form-horizontal form-border" ng-submit="updateProfile()" >
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">First Name</label>

                                        <div class="col-sm-6">
                                            <input ng-show="!viewMode" ng-model="profile.firstName" class="form-control"/>
                                            <p class="form-control-static" ng-show="viewMode">{{profile.firstName}}</p>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Last Name</label>
                                        <div class="col-sm-6">
                                            <input ng-show="!viewMode" ng-model="profile.lastName" class="form-control"/>
                                            <p class="form-control-static" ng-show="viewMode">{{profile.lastName}}</p>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Mother Name</label>

                                        <div class="col-sm-6">
                                            <input ng-show="!viewMode" ng-model="profile.motherName" class="form-control"/>
                                            <p class="form-control-static" ng-show="viewMode">
                                                {{profile.motherName}}</p>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Father Name</label>

                                        <div class="col-sm-6">
                                             <input ng-show="!viewMode" ng-model="profile.fatherName" class="form-control"/>
                                            <p class="form-control-static" ng-show="viewMode"> {{profile.fatherName}}</p>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Date Of Birth</label>

                                        <div class="col-sm-6">
                                            <datepicker date-format="dd/MM/yyyy">
                                                <input ng-model="profile.dateOfBirth" class="form-control" ng-show="!viewMode"/>
                                            </datepicker>
                                            <p class="form-control-static" ng-show="viewMode">
                                                {{profile.dateOfBirth}}</p>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Mobile No</label>

                                        <div class="col-sm-6">
                                            <input ng-show="!viewMode" ng-model="profile.mobileNo"
                                                   class="form-control"/>

                                            <p class="form-control-static" ng-show="viewMode">
                                                {{profile.mobileNo}}</p>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"></label>

                                        <div class="col-sm-6">
                                            <button class="btn btn-block btn-success" ng-show="!viewMode">Update</button>
                                        </div>

                                    </div>


                                </form>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="row">
                            <div class="panel panel-default">
                            <div class="panel-heading">Account Info</div>
                            <div class="panel-body">
                                <ul class="list-unstyled list-info">
                                    <li>
                                        <span class="text-info fa fa-user fa-fw"></span>
                                        {{login.username}}
                                    </li>
                                    <li>
                                        <span class="text-info fa fa-envelope fa-fw"></span>
                                        {{login.email}}
                                    </li>

                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">
                                        Change Password
                                    </button>

                                    <!-- Modal -->
                                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title" id="myModalLabel">Update Password</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form class="form-horizontal form-border" ng-submit="updatePassword()" >
                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">Password</label>

                                                            <div class="col-sm-6">
                                                                <input type="password" ng-model="userPassord" class="form-control" required/>
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label class="col-sm-3 control-label">Confirm Password</label>
                                                            <div class="col-sm-6">
                                                                <input type="password" ng-model="confirmUserPassword" class="form-control" required/>
                                                            </div>

                                                        </div>

                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" id="passwordModalcloseButton" data-dismiss="modal">Close</button>
                                                            <button class="btn btn-primary">Save changes</button>
                                                        </div>

                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </ul>

                            </div>
                        </div>
                            <div class="panel panel-default" ng-init="viewAcademicInfoMode = true">
                            <div class="panel-heading">Academic Info
                                <a href class="pull-right" ng-click="viewAcademicInfoMode = !viewAcademicInfoMode">
                                    <span ng-show="viewAcademicInfoMode"  class="text-info fa fa-edit fa-fw" ></span>
                                    <span ng-show="!viewAcademicInfoMode" class="text-info fa fa-eye fa-fw" ></span>
                                </a>
                            </div>
                            <div class="panel-body">
                                <form  ng-submit="updateUser()" ng-if="login.userType == 'teacher'">
                                    <div class="form-group">
                                        <label class="control-label">Designation</label>

                                            <input ng-show="!viewAcademicInfoMode" ng-model="user.destination" class="form-control"/>
                                            <span ng-show="viewAcademicInfoMode">{{user.destination}}</span>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Joining Date</label>
                                            <datepicker date-format="dd/MM/yyyy">
                                                <input ng-model="user.joiningDate" class="form-control" ng-show="!viewAcademicInfoMode"/>
                                            </datepicker>
                                            <span ng-show="viewAcademicInfoMode">{{user.joiningDate}}</span>

                                    </div>

                                    <button class="btn btn-success" ng-show="!viewAcademicInfoMode">Update</button>

                                </form>

                                <form  ng-submit="updateUser()" ng-show="login.userType == 'student'">
                                        <div class="form-group">
                                            <label class="control-label">Class</label>
                                                <select ng-show="!viewAcademicInfoMode" ng-model="s_className" class="form-control" required="true" ng-change="selectClassForStudent()">
                                                    <option value="">select class name</option>
                                                    <option  ng-repeat="className in classInfo.classNames" value="{{className}}" ng-selected="{{s_className == className}}">{{className}}</option>
                                                </select>
                                                <span ng-show="viewAcademicInfoMode">{{s_className}}</span>

                                                <select ng-show="!viewAcademicInfoMode" class="form-control" ng-model="s_sectionName" required="true" ng-change="selectClassForStudent()">
                                                    <option value="">select section</option>
                                                    <option ng-repeat="section in classInfo.sections" value="{{section}}" ng-selected="{{s_sectionName == section}}">{{section}}</option>
                                                </select>
                                                <span style="display: block" ng-show="viewAcademicInfoMode">Section&nbsp;{{s_sectionName}}</span>

                                                <select ng-show="!viewAcademicInfoMode" class="form-control" ng-model="s_shiftName" required="true" ng-change="selectClassForStudent()">
                                                    <option value="">select shift</option>
                                                    <option ng-repeat="shift in classInfo.shifts" value="{{shift}}" ng-selected="{{s_shiftName == shift}}">{{shift}}</option>
                                                </select>
                                            <span style="display: block" ng-show="viewAcademicInfoMode">Shift&nbsp;{{s_shiftName}}</span>

                                        </div>


                                        <div class="form-group">
                                        <label class="control-label">Roll Number</label>

                                            <input ng-show="!viewAcademicInfoMode" ng-model="user.rollNumber" class="form-control"/>
                                            <span ng-show="viewAcademicInfoMode">{{user.rollNumber}}</span>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Admission Date</label>
                                            <datepicker date-format="dd/MM/yyyy">
                                                <input ng-model="user.admissionDate" class="form-control" ng-show="!viewAcademicInfoMode"/>
                                            </datepicker>
                                            <span ng-show="viewAcademicInfoMode">{{user.admissionDate}}</span>
                                    </div>

                                    <button class="btn btn-success" ng-show="!viewAcademicInfoMode">Update</button>

                                </form>

                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="${appBaseUrl}/js/class.js"></script>

        <script>

            var app = angular.module('myApp', ['720kb.datepicker']);
            app.controller("MyController", MyController);
            function MyController($scope, $http,$filter) {
                console.log(window.location);
                var userUpdateUrl = "";
                $scope.classInfo = {};
                $scope.s_shiftName = "";
                $scope.s_sectionName  = "";
                $scope.s_className = "";
                $scope.userId = window.location.search.split("=")[1];
                $http.get('${appBaseUrl}/private/userDetail.web?userId=' + $scope.userId).success(function (data) {
                    console.log(data);
                    $scope.login = data.login;
                    $scope.userType = data.login.userType;
                    $scope.login = data.login;
                    $scope.profile = data.profile;
                    $scope.profile.dateOfBirth = $filter('date')($scope.profile.dateOfBirth, "dd/MM/yyyy");
                    if(data.joiningDate != undefined){
                        data.joiningDate = $filter('date')(data.joiningDate, "dd/MM/yyyy");
                    }

                    if(data.admissionDate != undefined){
                        data.admissionDate = $filter('date')(data.admissionDate, "dd/MM/yyyy");
                    }
                    if($scope.login.userType == 'student'){
                        userUpdateUrl = "${appBaseUrl}/admin/private/update/student.web";
                        initClazzList($http,'${appBaseUrl}/private/getClassList.web'
                                ,function(data){
                            $scope.classInfo= data;
                            var studentClazz = filterClazzById($scope.classInfo.classList , $scope.user.classId);
                            console.log("in callback");
                            $scope.s_shiftName = studentClazz.shiftName;
                            $scope.s_sectionName  = studentClazz.sectionName;
                            $scope.s_className = studentClazz.className;

                                });


                    }
                    if($scope.login.userType == 'teacher'){
                        userUpdateUrl = "${appBaseUrl}/admin/private/update/teacher.web";
                    }
                    $scope.user = data;
                    $scope.user.login = {};
                    $scope.user.profile = {};

                    console.log($scope.profile);
                    $scope.user = data;
                }).error(function (data) {

                        });

                $scope.updateProfile = function () {
                    console.log("called");
                    $http({
                        method: 'POST',
                        url: '${appBaseUrl}/private/updateProfile.web',
                        data: $.param($scope.profile),
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
                    }).success(function (data) {
                                console.log(data);
                                if (data.successful) {
                                }

                            }).error(function (data) {
                            });
                }

                $scope.updatePassword = function () {
                    console.log("called");
                    if($scope.userPassord.length == 0 || $scope.userPassord != $scope.confirmUserPassword)
                        return;
                    $http({
                        method: 'POST',
                        url: '${appBaseUrl}/admin/private/updatePassword.web',
                        data: $.param({
                            "userId" : $scope.userId,
                            "password" : $scope.userPassord
                        }),
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
                    }).success(function (data) {
                                console.log(data);
                                if (data.successful) {
                                    $("#passwordModalcloseButton").click();
                                    $scope.userPassord = "";
                                    $scope.confirmUserPassword = "";
                                }

                            }).error(function (data) {
                            });
                }
                $scope.updateUser = function () {
                    console.log("called");

                    $http({
                        method: 'POST',
                        url: userUpdateUrl,
                        data: $.param($scope.user),
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
                    }).success(function (data) {
                                console.log(data);
                                if (data.successful) {
                                }

                            }).error(function (data) {
                            });
                }


                $scope.selectClassForStudent = function(){
                    console.log($scope);
                    var classIds = filterClazz($scope.classInfo.classList, $scope.s_className,$scope.s_sectionName,$scope.s_shiftName );
                    if(classIds != undefined && classIds.length == 1){
                        $scope.user.classId = classIds[0];
                        console.log($scope.user.classId);
                    }
                }


            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
