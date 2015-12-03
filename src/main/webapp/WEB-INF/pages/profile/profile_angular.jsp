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
                            <img ng-if="profile.profileImageUrl == 'image/Default_Profile_Picture.png' " src="../{{profile.profileImageUrl}}" class="img-rounded" width="100%">
                            <img ng-if="profile.profileImageUrl != 'image/Default_Profile_Picture.png' " src="${appBaseUrl}/{{profile.profileImageUrl}}" class="img-rounded" width="100%">
                            <input name="profileImage" type="file" placeholder="upload profile picture">
                            <input name="profileId" type="hidden" value="{{userId}}">
                            <button class="btn btn-success">upload</button>
                        </form>
                    </div>
                        <%--<form method="POST" commandName="profile" action="/private/updateProfile.web" class="form-horizontal form-border">--%>
                    <div class="col-md-3">
                        <div class="panel panel-default">
                            <div class="panel-heading">User Info
                                <a href class="pull-right" data-toggle="modal" data-target="#profileModal">
                                    <span class="text-info fa fa-edit fa-fw" ng-click="showProfileUpdateSuccessMsg=false;showProfileUpdateErrorMsg=false;" ></span>
                                </a>
                            </div>
                            <div class="panel-body">
                                <table class="table table_no_border">
                                    <tr>
                                        <td>Name</td>
                                        <td>{{profile.firstName}} &nbsp;{{profile.lastName}}</td>
                                    </tr>
                                    <tr>
                                        <td>Mother Name</td>
                                        <td>{{profile.motherName}}</td>
                                    </tr>
                                    <tr>
                                        <td>Father Name</td>
                                        <td>{{profile.fatherName}}</td>
                                    </tr>
                                    <tr>
                                        <td>Date Of Birth</td>
                                        <td>{{profile.dateOfBirth}}</td>
                                    </tr>
                                    <tr>
                                        <td>Mobile No</td>
                                        <td>{{profile.mobileNo}}</td>
                                    </tr>
                                </table>
                            <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="profileModalLabel">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" ng-click="showProfileUpdateSuccessMsg=false;showProfileUpdateErrorMsg=false;"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="profileModalLabel">Update Info</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form class="form-horizontal form-border" ng-submit="updateProfile()" >
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">First Name</label>

                                                        <div class="col-sm-6">
                                                            <input  ng-model="profile.firstName" class="form-control"/>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Last Name</label>
                                                        <div class="col-sm-6">
                                                            <input ng-model="profile.lastName" class="form-control"/>
                                                        </div>

                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Mother Name</label>

                                                        <div class="col-sm-6">
                                                            <input  ng-model="profile.motherName" class="form-control"/>
                                                        </div>

                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Father Name</label>

                                                        <div class="col-sm-6">
                                                            <input  ng-model="profile.fatherName" class="form-control"/>
                                                        </div>

                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Date Of Birth</label>

                                                        <div class="col-sm-6">
                                                            <datepicker date-format="dd/MM/yyyy">
                                                                <input ng-model="profile.dateOfBirth" class="form-control"/>
                                                            </datepicker>
                                                        </div>

                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label">Mobile No</label>

                                                        <div class="col-sm-6">
                                                            <input  ng-model="profile.mobileNo"
                                                                   class="form-control"/>

                                                        </div>

                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label"></label>

                                                        <div class="col-sm-6">
                                                            <button class="btn btn-block btn-success" >Update</button>
                                                            <div ng-show="showProfileUpdateSuccessMsg == true" class="alert alert-success" style="text-align: center">Saved successfully</div>
                                                            <div ng-show="showProfileUpdateErrorMsg == true" class="alert alert-error" style="text-align: center">Failed</div>
                                                        </div>

                                                    </div>


                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>


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
                            <div class="panel panel-default">
                            <div class="panel-heading">Academic Info
                                <a href class="pull-right">
                                    <span  class="text-info fa fa-edit fa-fw" data-toggle="modal" data-target="#userUpdateModal" ng-click="showUserUpdateSuccessMsg=false;showUserUpdateErrorMsg=false;"></span>
                                </a>
                            </div>
                            <div class="panel-body">
                                    <ul ng-show="login.userType == 'staff'">
                                            <li>Designation: {{user.designation}}</li>

                                        <li>Joining Date: {{user.dateOfJoin}} </li>
                                        <li>Employee Level: {{user.employeeLevel}} </li>

                                </ul>
                                    <ul ng-show="login.userType == 'teacher'">
                                            <li>Designation: {{user.destination}}</li>

                                        <li>Joining Date: {{user.joiningDate}} </li>

                                </ul>

                                <ul ng-show="login.userType == 'student'">
                                            <li>Class: {{s_className}}</li>

                                                <li>Section&nbsp;{{s_sectionName}}</li>

                                            <li >Shift&nbsp;{{s_shiftName}}</li>

                                        <li>Roll Number: {{user.rollNumber}}</li>


                                        <li>Admission Date: {{user.admissionDate}}</li>
                                </ul>
                                <div class="modal fade" id="userUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="userUpdateModalLabel">Update Academic Info</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form  ng-submit="updateUser()" ng-show="login.userType == 'staff'">
                                                    <div class="form-group">
                                                        <label class="control-label">Employee Level</label>
                                                        <input  ng-model="user.employeeLevel" class="form-control"/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Designation</label>
                                                        <input  ng-model="user.designation" class="form-control"/>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="control-label">Joining Date</label>
                                                        <datepicker date-format="dd/MM/yyyy">
                                                            <input ng-model="user.dateOfJoin" class="form-control" />
                                                        </datepicker>
                                                    </div>

                                                    <button class="btn btn-success" >Update</button>
                                                    <div ng-show="showUserUpdateSuccessMsg == true" class="alert alert-success" style="text-align: center">Saved successfully</div>
                                                    <div ng-show="showUserUpdateErrorMsg == true" class="alert alert-success" style="text-align: center">Failed</div>

                                                </form>

                                                <form  ng-submit="updateUser()" ng-show="login.userType == 'teacher'">
                                                    <div class="form-group">
                                                        <label class="control-label">Designation</label>
                                                        <input  ng-model="user.destination" class="form-control"/>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="control-label">Joining Date</label>
                                                        <datepicker date-format="dd/MM/yyyy">
                                                            <input ng-model="user.joiningDate" class="form-control" />
                                                        </datepicker>
                                                    </div>

                                                    <button class="btn btn-success" >Update</button>
                                                    <div ng-show="showUserUpdateSuccessMsg == true" class="alert alert-success" style="text-align: center">Saved successfully</div>
                                                    <div ng-show="showUserUpdateErrorMsg == true" class="alert alert-success" style="text-align: center">Failed</div>

                                                </form>

                                                <form  ng-submit="updateUser()" ng-show="login.userType == 'student'">
                                                    <div class="form-group">
                                                        <label class="control-label">Class</label>
                                                        <select ng-model="s_className" class="form-control" required="true" ng-change="selectClassForStudent()">
                                                            <option value="">select class name</option>
                                                            <option  ng-repeat="className in classInfo.classNames" value="{{className}}" ng-selected="{{s_className == className}}">{{className}}</option>
                                                        </select>

                                                        <select class="form-control" ng-model="s_sectionName" required="true" ng-change="selectClassForStudent()">
                                                            <option value="">select section</option>
                                                            <option ng-repeat="section in classInfo.sections" value="{{section}}" ng-selected="{{s_sectionName == section}}">{{section}}</option>
                                                        </select>

                                                        <select class="form-control" ng-model="s_shiftName" required="true" ng-change="selectClassForStudent()">
                                                            <option value="">select shift</option>
                                                            <option ng-repeat="shift in classInfo.shifts" value="{{shift}}" ng-selected="{{s_shiftName == shift}}">{{shift}}</option>
                                                        </select>

                                                    </div>


                                                    <div class="form-group">
                                                        <label class="control-label">Roll Number</label>

                                                        <input  ng-model="user.rollNumber" class="form-control"/>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="control-label">Admission Date</label>
                                                        <datepicker date-format="dd/MM/yyyy">
                                                            <input ng-model="user.admissionDate" class="form-control"/>
                                                        </datepicker>
                                                    </div>

                                                    <button class="btn btn-success" >Update</button>
                                                    <div ng-show="showUserUpdateSuccessMsg == true" class="alert alert-success" style="text-align: center">Saved successfully</div>
                                                    <div ng-show="showUserUpdateErrorMsg == true" class="alert alert-success" style="text-align: center">Failed</div>

                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <style>
            table.table_no_border tr td{
                border: none;
            }
        </style>
        <script src="${appBaseUrl}/js/class.js"></script>

        <script>

            var app = angular.module('myApp', ['720kb.datepicker']);
            app.controller("MyController", MyController);
            function MyController($scope, $http,$filter) {
                console.log(window.location);
                var userUpdateUrl = "";
                $scope.classInfo = {};
                $scope.showProfileUpdateErrorMsg = false;
                $scope.showProfileUpdateSuccessMsg = false;
                $scope.showUserUpdateErrorMsg = false;
                $scope.showUserUpdateSuccessMsg = false;
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

                    if(data.dateOfJoin != undefined){
                        data.dateOfJoin = $filter('date')(data.dateOfJoin, "dd/MM/yyyy");
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
                    if($scope.login.userType == 'staff'){
                        userUpdateUrl = "${appBaseUrl}/admin/private/update/staff.web";
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
                                    $scope.showProfileUpdateSuccessMsg = true;
                                }else{
                                    $scope.showProfileUpdateErrorMsg = true;
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
                                    $scope.showUserUpdateSuccessMsg = true;
                                }else{
                                    $scope.showUserUpdateErrorMsg = true;

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
