<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<tiles:insertDefinition name="aircraftTemplate">

    <tiles:putAttribute name="body">    <!--main content start-->
    <!--main content start-->
    <div class="content">
        <div class="header">
            <h1>Add Staff</h1>
        </div>

        <div  class="main-content" data-ng-app="myApp">
            <div class="row">
                <div class="col-md-12" data-ng-controller="MyController">
                            <form method="POST" class="form-horizontal form-border" ng-submit="saveStaff()">

                                <jsp:include page="/WEB-INF/pages/user/loginInfo.jsp" />
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Designation</label>
                                    <div class="col-sm-6">
                                        <input ng-model="user.designation" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Joining Date</label>
                                    <div class="col-sm-6"  >
                                        <datepicker date-format="dd/MM/yyyy">
                                            <input ng-model="user.dateOfJoin" class="form-control"/>
                                        </datepicker>

                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label"></label>
                                    <div class="col-sm-6">
                                        <button type="submit" class="btn btn-primary btn-block">Create Staff</button>
                                    </div>
                                </div>

                            </form>
            </div>
        </div>
    </div>
        <!--main content end-->
        <script type="text/javascript">
            var app = angular.module('myApp', ['720kb.datepicker']);
            app.controller("MyController", MyController);
            function MyController($scope, $http){

                var vm = $scope;
                vm.user = {};
                vm.saveStaff = function(){
                    vm.showErrorMsg = false;
                    vm.user.userType="staff";
                    if(vm.usernameNotUnique == true){
                        $('#username').focus();
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


