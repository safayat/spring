<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertDefinition name="aircraftTemplate">

    <tiles:putAttribute name="body">    <!--main content start-->
        <div class="content"  data-ng-app="myApp" data-ng-controller="MyController">
            <div class="header">
                <h1>Add/Update Class <a ng-if="param.classId != undefined" href="${appBaseUrl}/private/classList.web" class="btn btn-primary" style="float:right">Back</a></h1>

            </div>
            <div class="main-content"  >
                <form method="post" ng-submit = "saveOrUpdateClass()" class="form-horizontal form-border">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Class Name</label>
                        <div class="col-sm-6">
                                <%--<input ng-model="param.className" class="form-control"/>--%>
                            <autocomplete ng-model="param.className" data="classInfo.classNames" attr-input-class="form-control" attr-placeholder=""></autocomplete>

                        </div>

                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Section Name</label>
                        <div class="col-sm-6">
                            <%--<input ng-model="param.sectionName" class="form-control"/>--%>
                            <autocomplete ng-model="param.sectionName" data="classInfo.sections" attr-input-class="form-control" attr-placeholder=""></autocomplete>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Shift Name</label>
                        <div class="col-sm-6">
                            <autocomplete ng-model="param.shiftName" data="classInfo.shifts" attr-input-class="form-control" attr-placeholder=""></autocomplete>

                        </div>
                    </div>
<%--on-type="updateMovies"--%>
                    <div class="form-group" ng-show="param.classId != undefined " >
                        <label class="col-sm-3 control-label">Class Teacher</label>
                        <div class="col-sm-6">
                            <select ng-model="param.classTeacherId" class="form-control">
                                <option ng-repeat="teacher in teachers" value="{{teacher.teacherId}}">
                                    {{teacher.fullName}}
                                </option>
                            <select>
                            <%--<autocomplete ng-model="param.shiftName" data="classInfo.shifts" attr-input-class="form-control" attr-placeholder=""></autocomplete>--%>

                        </div>
                    </div>


                    <div class="form-group" ng-show="param.classId != undefined">
                        <label class="col-sm-3 control-label">Class Captain</label>
                        <div class="col-sm-6">
                            <input type="hidden" ng-model="param.classCaptainId" />
                            <input ng-model="captainName" class="form-control" ng-change="loadStudnets()"/>
                            <ul  ng-show="showStudentList == true" style="background-color: white;z-index: 1000;position: absolute;width: 95%" class="list-group">
                                <li style="line-height: 15px" ng-repeat="student in students" ng-click=processStudentSelection(student) class="list-group-item">
                                   <a href> {{student.fullName}}</a>
                                </li>

                            </ul>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"></label>
                        <div class="col-sm-6">
                            <button type="submit" class="btn btn-primary btn-block">submit</button>
                            <div ng-show="showSuccessMsg == true" class="alert alert-success" style="text-align: center"> saved successfully</div>
                            <div ng-show="showErrorMsg == true" class="alert alert-error" style="text-align: center">Failed</div>

                        </div>
                    </div>


                </form>
            </div>
        </div>
    <!--main content end-->
        <script src="${appBaseUrl}/js/class.js"></script>
        <script>

            var app = angular.module('myApp', ['autocomplete']);
            app.controller("MyController", MyController);
            function MyController($scope, $http) {
                $scope.showStudentList = false;
                initClazzList($http,'${appBaseUrl}/private/getClassList.web', function(data){
                    $scope.classInfo= data;
                    if(window.location.search.indexOf("classId=") != -1){
                        var classId = window.location.search.split("classId=")[1];
                        $scope.param = $scope.classInfo.clazzMap[classId];
//                        loadStudnets("");
                        $http.get("${appBaseUrl}/private/user.web?userSpecificId=" + $scope.param.classCaptainId + "&userType=student").success(function(user){
                           $scope.captainName = user.fullName;
                        });
                        loadTeachers("");
                    }

                });
               $scope.processStudentSelection = function(student){
                   $scope.param.classCaptainId = student.studentId;
                   $scope.captainName = student.fullName;
                   $scope.showStudentList=false
               }
               $scope.loadStudnets = function(){
                    console.log($scope.captainName);
                    $http.get("${appBaseUrl}/private/getStudentList.web?limit=100&offset=0&classIds=" + $scope.param.classId + "&name=" + $scope.captainName).success(function(data){
                        $scope.students = data;
                        if($scope.students.length>0){
                            $scope.showStudentList = true;
                        }
                    }).error(function(){
                                console.log("error");
                            });

                }

                function loadTeachers(name){
                    $http.get("${appBaseUrl}/private/getTeacherList.web?limit=100&offset=0&name=" + name).success(function(data){
                        $scope.teachers = data;
                    }).error(function(){
                                console.log("error");
                            });

                }

                $scope.saveOrUpdateClass = function(){
                    console.log($scope.param);
                    $scope.showSuccessMsg = false;
                    $scope.showErrorMsg = false;

                    var formData={};
                    formData.classId = $scope.param.classId;
                    formData.className = $scope.param.className;
                    formData.sectionName = $scope.param.sectionName;
                    formData.shiftName = $scope.param.shiftName;
                    formData.classCaptainId = $scope.param.classCaptainId;
                    formData.classTeacherId = $scope.param.classTeacherId;
                    console.log(formData);

                    $http({
                        method: 'POST',
                        url: "${appBaseUrl}/admin/private/addUpdateClass.web",
                        data: $.param(formData),
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
                    }).success(function (data) {
                                console.log(data);
                                $scope.param = $scope.classInfo.clazzMap[data];
                                loadTeachers("");
                                $scope.showSuccessMsg = true;

                            }).error(function (data) {
                                $scope.showErrorMsg = true;

                            });

                }
            }
        </script>

    </tiles:putAttribute>
</tiles:insertDefinition>
