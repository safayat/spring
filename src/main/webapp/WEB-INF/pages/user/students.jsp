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
                <h1>Students</h1>
            </div>

            <div class="main-content" >
                <div class="row" data-ng-controller="MyController">
                    <div class="col-md-10 col-md-offset-1">

                    <form class="form-inline">
                        <div class="form-group">
                            <label class="sr-only"></label>
                            <select ng-model="s_className" class="form-control" required="true" ng-change="filterClass()">
                                <option value="">select class name</option>
                                <option  ng-repeat="className in classInfo.classNames" value="{{className}}" ng-selected="{{s_className == className}}">{{className}}</option>
                            </select>

                        </div>
                        <div class="form-group">
                            <label class="sr-only"></label>
                            <select class="form-control" ng-model="s_sectionName" required="true" ng-change="filterClass()">
                                <option value="">select section</option>
                                <option ng-repeat="section in classInfo.sections" value="{{section}}" ng-selected="{{s_sectionName == section}}">{{section}}</option>
                            </select>

                        </div>
                        <div class="form-group">
                            <label class="sr-only"></label>
                            <select class="form-control" ng-model="s_shiftName" required="true" ng-change="filterClass()">
                                <option value="">select shift</option>
                                <option ng-repeat="shift in classInfo.shifts" value="{{shift}}" ng-selected="{{s_shiftName == shift}}">{{shift}}</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="sr-only"></label>
                            <input type="text" class="form-control" ng-model="rollNumber" placeholder="Roll Number" ng-change="loadNewStudentList(0)" ng-model-options="{updateOn: 'blur'}">
                        </div>
                        <div class="form-group">
                            <label class="sr-only"></label>
                            <input type="text" class="form-control" ng-model="fullName" placeholder="Name" ng-change="loadNewStudentList(0)" ng-model-options="{updateOn: 'blur'}">
                        </div>
                        <div class="form-group">
                            <a href="${appBaseUrl}/admin/private/createStudent.web" target="_blank" class="btn btn-success pull-right" >New Student</a>
                        </div>


                    </form>

                    <table class="table">
                        <thead>
                        <tr>
                            <th style="width: 50px;"></th>
                            <th>Name</th>
                            <th>Class</th>
                            <th>Roll number</th>
                            <th>Admission Date</th>
                            <th>Birth Date</th>
                            <th>Mobile No</th>
                        </tr>
                        </thead>
                        <tbody>

                        <tr ng-repeat="student in students">
                            <td><a href="${appBaseUrl}/private/profileInfo.web?userId={{student.userId}}"><img class="user" src="${appBaseUrl}/{{student.profile.profileImageUrl}}"></a></td>
                            <td>{{student.fullName}}</td>
                            <td>{{classInfo.clazzMap[student.classId].className}}&nbsp;{{classInfo.clazzMap[student.classId].sectionName}}&nbsp;{{classInfo.clazzMap[student.classId].shiftName}}</td>
                            <td>{{student.rollNumber}}</td>
                            <td>{{student.admissionDate | date : 'shortDate'}}</td>
                            <td>{{student.profile.dateOfBirth | date : 'shortDate'}}</td>
                            <td>{{student.profile.mobileNo}}</td>
                        </tr>
                        </tbody>
                    </table>
                        <nav>
                            <ul class="pagination">
                                <li>
                                    <a href aria-label="Previous" ng-click="loadNewStudentList(offset-limit)">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li  ng-repeat="pageIndex in [0,1,2,3,4]">
                                    <a href ng-click="loadNewStudentList(limit*pageIndex)">
                                        {{pageIndex}}
                                    </a>
                                </li>
                                <li>
                                    <a href aria-label="Next" ng-click="loadNewStudentList(offset+limit)">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
</div>
                </div>
            </div>
        </div>
        <script src="${appBaseUrl}/js/class.js"></script>
        <script>

            var app = angular.module('myApp', []);
            app.controller("MyController", MyController);
            function MyController($scope, $http) {
                var vm = $scope;
                vm.classInfo = {};
                vm.classIds = [];
                vm.limit = 10;
                vm.offset = 0;
                vm.rollNumber = "";
                vm.fullName = "";

/*
                initClazzList($http,'${appBaseUrl}/private/getClassList.web', function(data){
                    vm.classInfo= data;
                });
*/

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


                vm.filterClass = function(){
                    vm.classIds = filterClazz(vm.classInfo.classList, vm.s_className, vm.s_sectionName, vm.s_shiftName);
                    vm.loadNewStudentList(0);

                };

                vm.loadNewStudentList = function(offset){
                    vm.offset = offset;
                    var param = {};
                    param.limit = vm.limit;
                    param.rollNumber = vm.rollNumber;
                    param.name = vm.fullName;
                    param.offset = vm.offset;
                    param.classIds = vm.classIds.toString();


                    $http({
                        method: 'POST',
                        url: "${appBaseUrl}/private/getStudentList.web",
                        data: $.param(param),
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
                    }).success(function (data) {
                                vm.students = data;
                                console.log(vm.students);
                            }).error(function (data) {
                            });

                }
            }
        </script>

    </tiles:putAttribute>
</tiles:insertDefinition>

