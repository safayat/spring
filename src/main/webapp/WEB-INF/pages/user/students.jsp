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
                        <h3 class="panel-title">Students</h3>
                    </div>
                    <div class="panel-body">


                        <div class="row" data-ng-controller="MyController">
                            <div class="col-sm-2" ng-repeat="student in students" >
                                <div class="thumbnail">
                                    <a href="${appBaseUrl}/private/profileView.web?profileId={{student.profile.profileId}}">
                                        <img ng-if="student.profile.profileImageUrl == 'image/Default_Profile_Picture.png'" src="${appBaseUrl}/{{student.profile.profileImageUrl}}" alt="..." height="50px">
                                        <img ng-if="student.profile.profileImageUrl != 'image/Default_Profile_Picture.png'" src="{{student.profile.profileImageUrl}}" alt="..." height="50px">
                                        <div class="caption">
                                            <h4 style="overflow-x: hidden;overflow-y: hidden">{{student.profile.firstName}}</h4>
                                            <p>Roll:{{student.rollNumber}} &nbsp; Class:{{student.clazz.className}}</p>
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
                $http({method: 'GET', url: 'getStudentList.web'}).
                        success(function(data, status, headers, config) {
                            $scope.students = data;
                        });

            }
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

