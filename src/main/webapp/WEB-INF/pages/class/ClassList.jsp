<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertDefinition name="aircraftTemplate">

    <tiles:putAttribute name="body">    <!--main content start-->
        <!--main content start-->

    <!--main content start-->
    <div class="content" data-ng-app="myApp">
        <div class="header">
            <h1>Class List
            </h1>
        </div>
        <div class="main-content" data-ng-controller="MyController">
            <div >
                <div class="modal fade" tabindex="-1" role="dialog" id="classAddUpdateModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Add Class</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" ng-submit = "saveOrUpdateClass()" class="form-horizontal form-border">
                                    <input type="hidden" ng-model="param.classId"/>
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
                                            <select class="form-control" ng-model="param.sectionName">
                                                <option ng-repeat="sc in classInfo.sections" value="{{sc}}" ng-selected="sc == param.sectionName">{{sc}}</option>
                                            </select>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Shift Name</label>
                                        <div class="col-sm-6">
                                            <%--<autocomplete ng-model="param.shiftName" data="classInfo.shifts" attr-input-class="form-control" attr-placeholder=""></autocomplete>--%>
                                                <select class="form-control" ng-model="param.shiftName">
                                                    <option ng-repeat="sf in classInfo.shifts" value="{{sf}}" ng-selected="sf == param.shiftName">{{sf}}</option>
                                                </select>


                                        </div>
                                    </div>
                                        <%--on-type="updateMovies"--%>
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
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
                        <div >
                            <div class="col-md-10 col-md-offset-1">
                                <button class="btn btn-success pull-right" data-toggle="modal" data-target="#classAddUpdateModal" ng-click="initDefaultValues()">New Class</button>

                                <div class="form-inline"><input placeholder="Add section" class="form-control" ng-model="newSectionName">&nbsp;<button ng-click="addSectionName()" class="btn btn-success"><i class="fa fa-plus"></i></button>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input placeholder="Add shift" class="form-control" ng-model="newShiftName">&nbsp;<button ng-click="addShiftName()" class="btn btn-success"><i class="fa fa-plus"></i></button></div>
                                <div class="alert alert-success" ng-show="showOtherSuccessMsg">{{otherSuccessMsg}}</div>
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
                                        <td><a href ng-click="editClass(clazz.classId)" data-toggle="modal" data-target="#classAddUpdateModal"><i class="fa fa-edit"></i></a></td>
                                    </tr>
                                </tbody>
                            </table>
                                </div>
                        </div>
            </div>
        </div>
    </div>

        <script src="${appBaseUrl}/js/class.js"></script>
        <script>

            var app = angular.module('myApp', ['autocomplete']);
            app.controller("MyController", MyController);
            function MyController($scope, $http) {
                var vm = $scope; 
                initClazzList($http,'${appBaseUrl}/private/getClassList.web?includeClassCaptain=true&includeClassTeacher=true&includeStudentCount=true', function(data){
                    vm.classInfo= data;
                    $http.get("${appBaseUrl}/private/getSections.web").success(function(sections){
                        vm.classInfo.sections = sections;
                        console.log(vm.classInfo.sections);

                    });
                    $http.get("${appBaseUrl}/private/getShifts.web").success(function(shifts){
                        vm.classInfo.shifts = shifts;
                    });

                });
                vm.initDefaultValues = function(){
                    initDefaultValues();
                }
                function initDefaultValues(){
                    vm.showSuccessMsg = false;
                    vm.showErrorMsg = false;
                    vm.showOtherSuccessMsg = false;
                }
                vm.saveOrUpdateClass = function(){
                    console.log(vm.param);
                    initDefaultValues();
                    var formData={};
                    formData.className = vm.param.className;
                    formData.sectionName = vm.param.sectionName;
                    formData.shiftName = vm.param.shiftName;
                    if(vm.param.classId != undefined){
                        formData.classId = vm.param.classId;
                    }
                    console.log(formData);

                    $http({
                        method: 'POST',
                        url: "${appBaseUrl}/admin/private/addUpdateClass.web",
                        data: $.param(formData),
                        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
                    }).success(function (data) {
                        console.log(data);
                        initClazzList($http,'${appBaseUrl}/private/getClassList.web?includeClassCaptain=true&includeClassTeacher=true&includeStudentCount=true', function(data){
                            vm.classInfo= data;

                        });

                        vm.showSuccessMsg = true;
                        vm.param = {};

                    }).error(function (data) {
                        vm.showErrorMsg = true;

                    });

                }

                vm.addSectionName = function(){
                    vm.showOtherSuccessMsg = false;
                    $http.get("${appBaseUrl}/private/addSection.web?section="+vm.newSectionName).success(function(data){
                        vm.showOtherSuccessMsg = true;
                        vm.otherSuccessMsg = "Added section " + vm.newSectionName + " successfully";

                    });
                }

                vm.addShiftName = function(){
                    vm.showOtherSuccessMsg = false;
                    $http.get("${appBaseUrl}/private/addShift.web?shift="+vm.newShiftName).success(function(data){
                        vm.showOtherSuccessMsg = true;
                        vm.otherSuccessMsg = "Added shift " + vm.newShiftName + " successfully";
                    });
                }

                vm.editClass = function(editClassId){
                    initDefaultValues();
                    vm.param = vm.classInfo.clazzMap[editClassId];
                    console.log(vm.param);
                }



            }
        </script>

    </tiles:putAttribute>
</tiles:insertDefinition>