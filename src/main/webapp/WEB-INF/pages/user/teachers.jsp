<%--Created by IntelliJ IDEA.
User: safayat
Date: 4/25/14
Time: 11:51 AM
To change this template use File | Settings | File Templates.
--%>



<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertDefinition name="aircraftTemplate">



    <tiles:putAttribute name="body">

        <div class="content" data-ng-app="myApp">

            <div class="header">
                <h1>Teachers <a href="${appBaseUrl}/admin/private/createTeacher.web" target="_blank" class="btn btn-success pull-right" >New Teacher</a>
                </h1>
            </div>

            <div class="main-content" >
                <div class="row" data-ng-controller="MyController">
                    <div class="col-md-10 col-md-offset-1">

                        <form class="form-inline">
                            <div class="form-group">
                                <label class="sr-only"></label>
                                <input type="text" class="form-control" ng-model="designation" placeholder="designation" ng-change="loadNewTeacherList(0)" ng-model-options="{updateOn: 'blur'}">
                            </div>
                            <div class="form-group">
                                <label class="sr-only"></label>
                                <input type="text" class="form-control" ng-model="name" placeholder="Name" ng-change="loadNewTeacherList(0)" ng-model-options="{updateOn: 'blur'}">
                            </div>


                        </form>

                        <table class="table">
                            <thead>
                            <tr>
                                <th style="width: 50px;"></th>
                                <th>Name</th>
                                <th>Desigantion</th>
                                <th>Joining Date</th>
                                <th>Birth Date</th>
                                <th>Mobile No</th>
                            </tr>
                            </thead>
                            <tbody>

                            <tr ng-repeat="teacher in teachers">
                                <td><a href="${appBaseUrl}/private/profileInfo.web?userId={{teacher.userId}}"><img class="user" src="${appBaseUrl}/{{teacher.profile.profileImageUrl}}"></a></td>
                                <td>{{teacher.fullName}}</td>
                                <td>{{teacher.destination}}</td>
                                <td>{{teacher.joiningDate | date : 'shortDate'}}</td>
                                <td>{{teacher.profile.dateOfBirth | date : 'shortDate'}}</td>
                                <td>{{teacher.profile.mobileNo}}</td>
                            </tr>
                            </tbody>
                        </table>
                        <nav>
                            <ul class="pagination">
                                <li>
                                    <a href aria-label="Previous" ng-click="loadNewTeacherList(offset-limit)">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li  ng-repeat="pageIndex in [0,1,2,3,4]">
                                    <a href ng-click="loadNewTeacherList(limit*pageIndex)">
                                        {{pageIndex}}
                                    </a>
                                </li>
                                <li>
                                    <a href aria-label="Next" ng-click="loadNewTeacherList(offset+limit)">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <script>

            var app = angular.module('myApp', []);
            app.controller("MyController", MyController);
            function MyController($scope, $http) {
                $scope.limit = 10;
                $scope.offset = 0;
                $scope.designation = "";
                $scope.name = "";


                $scope.loadNewTeacherList = function(offset){
                    $scope.offset = offset;
                    var param = {};
                    param.limit = $scope.limit;
                    param.designation = $scope.designation;
                    param.name = $scope.name;
                    param.offset = $scope.offset;


                    $http({
                        method: 'POST',
                        url: "${appBaseUrl}/private/getTeacherList.web",
                        data: $.param(param),
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
                    }).success(function (data) {
                                $scope.teachers = data;
                                console.log($scope.teachers);

                            }).error(function (data) {
                            });

                }
            }
        </script>

    </tiles:putAttribute>
</tiles:insertDefinition>

