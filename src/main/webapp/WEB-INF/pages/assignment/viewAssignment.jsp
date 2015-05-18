<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">

        <section class="main-content-wrapper">
            <div class="pageheader">
                <h1>Assignment Management</h1>
            </div>
            <section id="main-content" class="animated fadeInUp" data-ng-app="myApp" ng-controller="formController">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">${assignment.title}</h3>
                            </div>
                            <div class="panel-body" >
                                <div class="description">${assignment.description}</div><br/><br/>NA
                                <a class="btn btn-primary" href="${appBaseUrl}/private/addUpdateAssignment.web?id=${assignment.assignmentId}">Edit Assignment</a>
                                <br/><br/>
                                <h2>comments</h2>

                                <div class="well" ng-repeat="item in messageList">{{item.message}}</div>
                                <br/>
                                <form ng-submit="processForm()">
                                    <input type="hidden" ng-model="formData.messageKey" id="messageKey" name="messageKey" value="${assignment.messageKey}">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Write Comment</label>

                                        <div>
                                            <textarea ng-model="formData.messageText" name="messageText" class="form-control" ></textarea>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary">post</button>
                                </form>
                            </div>
                        </div>


                    </div>
                </div>
            </section>
            <script type="text/javascript">
                var app = angular.module('myApp', []);
                function formController($scope, $http) {
                    var getMessages = function($scope, $http){
                        $http({method: 'GET', url: '${appBaseUrl}/private/getMessages.web?messageKey='+  $('#messageKey').val()}).
                                success(function(data, status, headers, config) {
                                    console.log(data);
                                    $scope.messageList = data;
                                });
                    };
                    getMessages($scope, $http);
                    $scope.formData = {};
                    $scope.formData.messageKey = $('#messageKey').val();

                    $scope.processForm = function() {

                        $http({
                            method  : 'POST',
                            url     : '${appBaseUrl}/private/saveMessage.web',
                            data    : $.param($scope.formData),  // pass in data as strings
                            headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
                        })
                        .success(function(data) {
                            console.log(data);
                            $scope.formData.messageText = "";
                            getMessages($scope, $http);
                        });
                    };
                }

            </script>
        </section>


    </tiles:putAttribute>
</tiles:insertDefinition>

