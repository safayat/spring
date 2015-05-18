  <%--Created by IntelliJ IDEA.
  User: safayat
  Date: 4/25/14
  Time: 11:51 AM
  To change this template use File | Settings | File Templates.
--%>



<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertDefinition name="defaultTemplate">



    <tiles:putAttribute name="body">

        <section class="main-content-wrapper" data-ng-app="myApp">

        <div class="pageheader">
                <h1>Home</h1>

            <div class="breadcrumb-wrapper hidden-xs">
                <span class="label">You are here:</span>
                <ol class="breadcrumb">
                    <li>
                        <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/index.html">Dashboard</a>
                    </li>
                    <li>Pages</li>
                    <li class="active">Blank Page</li>
                </ol>
            </div>
            </div>
            <section id="main-content" class="animated fadeInUp" >
                <div class="panel panel-default" style="min-height: 600px; ">
                    <div class="panel-heading">
                        <h3 class="panel-title">Teachers</h3>
                    </div>
                    <div class="panel-body">


                        <div class="row" data-ng-controller="MyController">
                            <div class="col-sm-2" ng-repeat="teacher in teachers" >
                                <div class="thumbnail">
                                    <a href="${appBaseUrl}/private/profileView.web?profileId={{teacher.profile.profileId}}">
                                        <img ng-if="teacher.profile.profileImageUrl == 'image/Default_Profile_Picture.png'" src="${appBaseUrl}/{{teacher.profile.profileImageUrl}}" alt="..." height="50px">
                                        <img ng-if="teacher.profile.profileImageUrl != 'image/Default_Profile_Picture.png'" src="{{teacher.profile.profileImageUrl}}" alt="..." height="50px">
                                        <div class="caption">
                                            <h4 style="overflow-x: hidden;overflow-y: hidden">{{teacher.profile.firstName}}</h4>
                                            <p>{{teacher.destination}}</p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </section>

        <script type="text/javascript">
            var app = angular.module('myApp', []);
            function MyController($scope, $http){
                $http({method: 'GET', url: 'getTeacherList.web'}).
                        success(function(data, status, headers, config) {
                            $scope.teachers = data;
                        });

            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

