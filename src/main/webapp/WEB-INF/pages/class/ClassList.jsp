<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertDefinition name="aircraftTemplate">

    <tiles:putAttribute name="body">    <!--main content start-->
        <!--main content start-->

    <!--main content start-->
    <div class="content">
        <div class="pageheader">
            <h1>Class List</h1>
        </div>
        <div class="main-content">
            <div data-ng-app="myApp">
                        <div data-ng-controller="MyController">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Class Name</th>
                                        <th>Section Name</th>
                                        <th>Shift Name</th>
                                        <th>Class Teacher name</th>
                                        <th>Class captain name</th>
                                        <th>Count</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr ng-repeat="clazz in classInfo.classList">
                                        <td><a href="${appBaseUrl}/private/classDetail.web?classId={{clazz.classId}}">{{clazz.className}}</a></td>
                                        <td>{{clazz.sectionName}}</td>
                                        <td>{{clazz.shiftName}}</td>
                                        <td>{{clazz.classTeacher.fullName}}</td>
                                        <td>{{clazz.classCaptain.fullName}}</td>
                                        <td>{{clazz.studentCount}}</td>
                                        <td><a href="${appBaseUrl}/admin/private/addUpdateClass.web?classId={{clazz.classId}}"><i class="fa fa-edit"></i></a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
            </div>
        </div>
    </div>

        <script src="${appBaseUrl}/js/class.js"></script>
        <script>

            var app = angular.module('myApp', []);
            app.controller("MyController", MyController);
            function MyController($scope, $http) {

                initClazzList($http,'${appBaseUrl}/private/getClassList.web?includeClassCaptain=true&includeClassTeacher=true&includeStudentCount=true', function(data){
                    $scope.classInfo= data;
                });


            }
        </script>

    </tiles:putAttribute>
</tiles:insertDefinition>