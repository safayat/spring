<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/pages/common/head.jsp"/>

<script type="text/javascript">
    var app = angular.module('myApp', []);
    function MyController($scope, $http){
        $http({method: 'GET', url: 'getClassList.web'}).
                success(function(data, status, headers, config) {
                    $scope.clazzList = data;

                });

    }
</script>


<section id="main-wrapper" class="theme-default">
    <jsp:include page="/WEB-INF/pages/common/header.jsp?v=2"/>
    <jsp:include page="/WEB-INF/pages/common/menu.jsp?v=2"/>

    <!--main content start-->
    <section class="main-content-wrapper">
        <div class="pageheader">
            <h1>Class Management</h1>
        </div>
        <section id="main-content" class="animated fadeInUp">
            <div class="row" data-ng-app="myApp">
                <div class="col-md-12">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Class List</h3>

                            <div class="actions pull-right">
                                <i class="fa fa-chevron-down"></i>
                                <i class="fa fa-times"></i>
                            </div>
                        </div>
                        <div class="panel-body" data-ng-controller="MyController">
                            <table class="table table-striped table-bordered dataTable no-footer">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Class Name</th>
                                        <th>Class Teacher name</th>
                                        <th>Count</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${clazzList}" var="clazz">
                                    <tr>
                                        <td>${clazz.classId}</td>
                                        <td><a href="${appBaseUrl}/private/classDetail.web?classId=${clazz.classId}">${clazz.className}</a></td>
                                        <td>${clazz.classTeacher.profile.firstName}&nbsp;${clazz.classTeacher.profile.lastName}</td>
                                        <td>${studentCountMap[clazz.classId]}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>
    <!--main content end-->
</section>
