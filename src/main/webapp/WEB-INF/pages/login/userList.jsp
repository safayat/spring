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
                <h1>Users</h1>
            </div>

            <div class="main-content" >
                <div class="row" data-ng-controller="MyController">
                    <div class="col-md-10 col-md-offset-1">
                        <form class="form-inline">
                            <div class="form-group">
                                <label class="sr-only"></label>
                                <input type="text" class="form-control" ng-model="param.firstName" placeholder="firstName" ng-change="loadNextUserList(0)" ng-model-options="{updateOn: 'blur'}">
                            </div>
                            <div class="form-group">
                                <label class="sr-only"></label>
                                <input type="text" class="form-control" ng-model="param.lastName" placeholder="lastName" ng-change="loadNextUserList(0)" ng-model-options="{updateOn: 'blur'}">
                            </div>

                            <div class="form-group">
                                <label class="sr-only"></label>
                                <input type="text" class="form-control" ng-model="param.username" placeholder="username" ng-change="loadNextUserList(0)" ng-model-options="{updateOn: 'blur'}">
                            </div>

                            <div class="form-group">
                                <label class="sr-only"></label>
                                <input type="text" class="form-control" ng-model="param.email" placeholder="email" ng-change="loadNextUserList(0)" ng-model-options="{updateOn: 'blur'}">
                            </div>

                            <div class="form-group">
                                <label class="sr-only"></label>
                                <input type="text" class="form-control" ng-model="param.mobileNo" placeholder="mobileNo" ng-change="loadNextUserList(0)" ng-model-options="{updateOn: 'blur'}">
                            </div>

                            <div class="form-group">
                                <label class="sr-only"></label>
                                <select type="text" class="form-control" ng-model="param.userType" placeholder="userType" ng-change="loadNextUserList(0)" >
                                    <option value="">select type</option>
                                    <option value="admin">admin</option>
                                    <option value="teacher">teacher</option>
                                    <option value="student">student</option>
                                    <option value="staff">staff</option>
                                </select>
                            </div>


                        </form>

                        <table class="table">
                            <thead>
                            <tr>
                                <th style="width: 50px;"></th>
                                <th>Name</th>
                                <th>fullname</th>
                                <th>email</th>
                                <th>type</th>
                                <th>mobile</th>
                                <th>Date Of Birth</th>
                            </tr>
                            </thead>
                            <tbody>

                            <tr ng-repeat="user in users">
                                <td><img class="user" src="${appBaseUrl}/{{user.profile.profileImageUrl}}"></td>
                                <td>{{user.login.username}}</td>
                                <td>{{user.profile.firstName}}&nbsp;{{user.profile.lastName}}</td>
                                <td>{{user.login.email}}</td>
                                <td>{{user.login.userType}}</td>
                                <td>{{user.profile.mobileNo}}</td>
                                <td>{{user.login.dateOfBirth}}</td>
                            </tr>
                            </tbody>
                        </table>
                        <nav>
                            <ul class="pagination">
                                <li>
                                    <a href aria-label="Previous" ng-click="loadNextUserList(param.offset-param.limit)">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li  ng-repeat="pageIndex in [0,1,2,3,4]">
                                    <a href ng-click="loadNextUserList(param.limit*pageIndex)">
                                        {{pageIndex}}
                                    </a>
                                </li>
                                <li>
                                    <a href aria-label="Next" ng-click="loadNextUserList(param.offset+param.Nlimit)">
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
                $scope.users = [];
                $scope.param = {};
                $scope.param.offset = 0;
                $scope.param.limit =10;

                $scope.loadNextUserList = function(offset){
                    $scope.param.offset = offset;
                    $http.get("${appBaseUrl}/private/getUsers.web" + getQueryString($scope.param)).success(function(data){
                        console.log(data);
                        $scope.users = [];
                        data.forEach(function(userDataArr){
                            var user = {};
                            user.profile = userDataArr[0];
                            user.login = userDataArr[1];
                            $scope.users.push(user);
                        });
                    }).error(function(){
                                console.log("error");

                            });


                }

                function getObjectProperties(obj){
                    var result = [];
                    for (var key in obj) {
                        if (obj.hasOwnProperty(key)) {
                            /* useful code here */
                            result.push(key);
                        }
                    }
                    return result;
                }

                function getQueryString(p_Obj){
                    var keys = getObjectProperties(p_Obj);
                    var q_str = "";
                    keys.forEach(function(key,index){
                        q_str = index == 0 ? "?" : q_str +"&";
                        q_str = q_str + key + "=" + p_Obj[key];
                    });
                    return q_str;
                }


            }
        </script>

    </tiles:putAttribute>
</tiles:insertDefinition>

