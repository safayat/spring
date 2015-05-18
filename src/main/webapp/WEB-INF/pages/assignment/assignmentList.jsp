<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">

        <section class="main-content-wrapper">
            <div class="pageheader">
                <h1>Assignment Management</h1>
            </div>
            <section id="main-content" class="animated fadeInUp" data-ng-app="myApp">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Course Assignments</h3>
                            </div>
                            <div class="panel-body">
                                <table class="table table-responsive">
                                    <thead>
                                        <tr>
                                            <th>title</th>
                                            <th>deadline</th>
                                            <th>mark</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${assignmentList}" var="assignment">
                                            <tr>
                                                <td>${assignment.title}</td>
                                                <td>${assignment.startDateTime} - ${assignment.endDateTime}</td>
                                                <td>${assignment.mark}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <script type="text/javascript">
                var app = angular.module('myApp', []);


            </script>
        </section>


    </tiles:putAttribute>
</tiles:insertDefinition>

