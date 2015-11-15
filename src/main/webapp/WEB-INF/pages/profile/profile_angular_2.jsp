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
        <div class="content" data-ng-app="myApp">
            <div class="header">
                Profile
            </div>
            <div class="main-content" data-ng-controller="MyController">
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
                        <div class="panel panel-default">
                            <div class="panel-heading">User Info</div>

                            <div class="panel-body">
                                <div class="form-horizontal form-border">
                                    <div class="form-group" ng-init="editFirstName = false"
                                         ng-click="editFirstName = true" ng-mouseleave="editFirstName = false">
                                        <label class="col-sm-3 control-label">First Name</label>

                                        <div class="col-sm-6">
                                            <input ng-show="editFirstName" ng-model="profile.firstName"
                                                   class="form-control"
                                                   ng-blur="updateProfile('firstName',profile.firstName,'editFirstName')"
                                                   ng-model-options="{updateOn: 'blur'}"/>

                                            <p class="form-control-static" ng-show="!editFirstName">
                                                {{profile.firstName}}</p>
                                        </div>
                                    </div>

                                    <div class="form-group" ng-init="editLastName = false"
                                         ng-click="editLastName = true">
                                        <label class="col-sm-3 control-label">Last Name</label>

                                        <div class="col-sm-6">
                                            <input ng-show="editLastName" ng-model="profile.lastName"
                                                   class="form-control"
                                                   ng-blur="updateProfile('lastName',profile.lastName,'editLastName')"
                                                   />

                                            <p class="form-control-static" ng-show="!editLastName">
                                                {{profile.lastName}}</p>
                                        </div>

                                    </div>

                                    <div class="form-group" ng-init="editMotherName = false"
                                         ng-click="editMotherName = true">
                                        <label class="col-sm-3 control-label">Mother Name</label>

                                        <div class="col-sm-6">
                                            <input ng-show="editMotherName" ng-model="profile.motherName"
                                                   class="form-control"
                                                   ng-blur="updateProfile('motherName',profile.motherName,'editMotherName')"
                                                   ng-model-options="{updateOn: 'blur'}"/>

                                            <p class="form-control-static" ng-show="!editMotherName">
                                                {{profile.motherName}}</p>
                                        </div>

                                    </div>

                                    <div class="form-group" ng-init="editFatherName = false"
                                         ng-click="editFatherName = true">
                                        <label class="col-sm-3 control-label">Father Name</label>

                                        <div class="col-sm-6">
                                            <input ng-show="editFatherName" ng-model="profile.fatherName"
                                                   class="form-control"
                                                   ng-blur="updateProfile('fatherName',profile.fatherName,'editFatherName')"/>

                                            <p class="form-control-static" ng-show="!editFatherName">
                                                {{profile.fatherName}}</p>
                                        </div>

                                    </div>

                                    <div class="form-group" ng-init="editDateOfBirth = false"
                                         ng-click="editDateOfBirth = true">
                                        <label class="col-sm-3 control-label">Date Of Birth</label>

                                        <div class="col-sm-6">
                                            <datepicker date-format="dd/MM/yyyy">
                                                <input ng-model="profile.dateOfBirth" ng-show="editDateOfBirth"
                                                       ng-model="profile.dateOfBirth" class="form-control"
                                                       data-date="12/02/2012"
                                                       data-date-format="dd/mm/yyyy"
                                                       ng-change="updateProfile('dateOfBirth',profile.dateOfBirth,'editDateOfBirth','date')"/>
                                            </datepicker>
                                            <p class="form-control-static" ng-show="!editDateOfBirth">
                                                {{profile.dateOfBirth | date:'dd/MM/yyyy'}}</p>
                                        </div>

                                    </div>

                                    <div class="form-group" ng-init="editMobileNo = false"
                                         ng-click="editMobileNo = true">
                                        <label class="col-sm-3 control-label">Mobile No</label>

                                        <div class="col-sm-6">
                                            <input ng-show="editMobileNo" ng-model="profile.mobileNo"
                                                   class="form-control"
                                                   ng-blur="updateProfile('mobileNo',profile.mobileNo,'editMobileNo')"
                                                   ng-model-options="{updateOn: 'blur'}"/>

                                            <p class="form-control-static" ng-show="!editMobileNo">
                                                {{profile.mobileNo}}</p>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
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
                                    <button class="btn btn-danger">Change Password</button>
                                </ul>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>

            // <div ng-controller="homeController"></div>


            //            app.controller("homeController", function ($scope) {

            var app = angular.module('myApp', ['720kb.datepicker']);
            app.controller("MyController", MyController);
            function MyController($scope, $http) {
                console.log(window.location);
                $scope.userId = window.location.search.split("=")[1];
                $http.get('${appBaseUrl}/private/userDetail.web?userId=' + $scope.userId).success(function (data) {
                    $scope.login = data.login;
                    $scope.userType = data.login.userType;
                    $scope.login = data.login;
                    $scope.profile = data.profile;
                    $scope.profile_copy = JSON.parse(JSON.stringify($scope.profile));
                    console.log($scope.profile);
                    console.log($scope.profile_copy);
                    $scope.user = data;
                }).error(function (data) {

                        });

                $scope.updateProfile = function (fieldName, field, showInputBox, fieldtype) {
                    console.log("called");
                    if ($scope.profile_copy[fieldName] == field) {
                        $scope[showInputBox] = false;
                        return;
                    }

                    var formData = {
                        profileId: $scope.profile.profileId,
                        fieldName: fieldName,
                        value: field
                    };
                    if (fieldtype != undefined) {
                        formData.fieldtype = fieldtype;
                    }
                    $http({
                        method: 'POST',
                        url: '${appBaseUrl}/private/update/single.web',
                        data: $.param(formData),
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
                    }).success(function (data) {
                                console.log(data);
                                if (data.successful) {
                                    $scope.profile_copy[fieldName] = field;
                                    $scope[showInputBox] = false;
                                }

                            }).error(function (data) {
                            });
                }


            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>
