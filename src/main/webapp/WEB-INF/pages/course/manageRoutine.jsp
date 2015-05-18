<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">

        <section class="main-content-wrapper" data-ng-app="myApp">
            <div class="pageheader">
                <h1>Course Management</h1>
            </div>
            <section id="main-content" class="animated fadeInUp">
                <div class="row">
                    <div class="col-md-12">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Add Course</h3>
                            </div>
                            <div class="panel-body">


                                <form:form method="POST" commandName="courseRoutine"
                                           action="/private/addUpdateCourseRoutine.web?classId=${clazz.classId}"
                                           cssClass="form-horizontal form-border" name="courseRoutineForm">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Course Name</label>

                                        <div class="col-sm-6">
                                            <form:select path="courseId" cssClass="form-control">
                                                <form:options items="${courseMap}"/>
                                                <%--
                                                                                                <form:options items="${courseMap}" itemValue="courseId"
                                                                                                              itemLabel="courseName"/>
                                                --%>
                                            </form:select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Day</label>

                                        <div class="col-sm-6">
                                            <form:select path="day" cssClass="form-control">
                                                <option value="sat">Saturday</option>
                                                <option value="sun">Sunday</option>
                                                <option value="mon">Monday</option>
                                                <option value="tue">Tuesday</option>
                                                <option value="wed">Wednesday</option>
                                                <option value="thu">Thursday</option>
                                                <option value="fri">Friday</option>
                                            </form:select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Start Time</label>

                                        <div class="col-sm-6">
                                            <form:input path="startTime" ng-model="startTime"
                                                        ng-pattern="/^(1[012]|0[1-9]):[0-5][0-9]$/"/>
                                            <span ng-show="courseRoutineForm.startTime.$error.pattern"
                                                  style="color: red">Valid time format is HH:MM . Example 08:54</span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">End Time</label>

                                        <div class="col-sm-6">
                                            <form:input path="endTime" ng-model="endTime"
                                                        ng-pattern="/^(1[012]|0[1-9]):[0-5][0-9]$/"/>
                                            <span ng-show="courseRoutineForm.endTime.$error.pattern" style="color: red">Valid time format is HH:MM . Example 08:54</span>

                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"></label>

                                        <div class="col-sm-6">
                                            <button ng-disabled="courseRoutineForm.endTime.$invalid ||
                                                                   courseRoutineForm.endTime.$pristine ||
                                                                   courseRoutineForm.startTime.$invalid ||
                                                                   courseRoutineForm.startTime.$pristine " type="submit"
                                                    class="btn btn-primary btn-block">submit
                                            </button>
                                        </div>
                                    </div>
                                </form:form>

                                <div class="panel panel-default" style="min-height: 0px">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Routine</h3>
                                    </div>
                                    <div class="panel-body">

                                        <c:forEach items="${routineListByDay}" var="item">
                                            <h3>${item.key}</h3>
                                            <table class="table table-bordered">
                                                <thead>
                                                <tr>
                                                    <th>Course</th>
                                                    <th>Start Time</th>
                                                    <th>End Time</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${item.value}" var="cr">
                                                    <tr>
                                                        <td>${courseMap[cr.courseId]}</td>
                                                        <td>${cr.startTime}</td>
                                                        <td>${cr.endTime}</td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </c:forEach>
                                    </div>
                                </div>


                            </div>
                        </div>


                    </div>
                </div>

            </section>
        </section>
        <script type="text/javascript">
            var app = angular.module('myApp', []);

        </script>

    </tiles:putAttribute>
</tiles:insertDefinition>

