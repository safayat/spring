<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">

        <section class="main-content-wrapper">
            <div class="pageheader">
                <h1>Course Management</h1>
            </div>
            <section id="main-content" class="animated fadeInUp" data-ng-app="myApp">

                <div class="row">
                    <div class="col-md-12">

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Course Routine</h3>
                            </div>
                            <div class="panel-body">
                                <a id="toggleViewEditeMode" class="btn btn-primary pull-right"><span>Edit</span><span style="display: none">View</span>&nbsp;Mode</a>
                                <table class="table table-bordered table-striped classRoutineListDisplay">
                                    <c:forEach items="${classRoutine}" var="outerTtem" varStatus="outerStatus">
                                        <tr <c:if test="${outerStatus.count>1}">style="height: 100px;line-height: normal"</c:if> >
                                            <c:forEach items="${outerTtem}" var="innerTtem" varStatus="innerStatus">
                                                <c:choose>
                                                    <c:when test="${outerStatus.count>1 && innerStatus.count>1 }">
                                                        <td>${courseMap[innerTtem].courseName}<c:if test="${innerTtem == '-1'}">BREAK</c:if></td>

                                                    </c:when>
                                                <c:otherwise>
                                                    <td style="background-color: rgb(227, 250, 215)">${innerTtem}</td>
                                                </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </tr>
                                    </c:forEach>
                                </table>
                                <form class="classRoutineListDisplay" action="${appBaseUrl}/private/CourseRoutine.web" method="post" style="display: none">
                                    <input type="hidden" name="classId" value="${clazz.classId}">
                                    <button class="btn btn-success">Update Routine</button>
                                    <table class="table table-bordered table-striped">
                                        <c:forEach items="${classRoutine}" var="outerTtem" varStatus="outerStatus">
                                            <tr <c:if test="${outerStatus.count>1}">style="height: 100px;line-height: normal"</c:if> >
                                                <c:forEach items="${outerTtem}" var="innerTtem" varStatus="innerStatus">
                                                    <c:choose>
                                                        <c:when test="${outerStatus.count>1 && innerStatus.count>1 && innerTtem !='-1'}">
                                                            <td>
                                                                <select name="courseRoutineList" >
                                                                    <option value="">select course</option>
                                                                    <c:forEach items="${courseMap}" var="course">
                                                                        <option <c:if test="${innerTtem == course.key}">selected="selected" </c:if> value="${outerStatus.index}_${innerStatus.index}_${course.value.courseId}">${course.value.courseName}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:if test="${innerTtem != '-1'}"><td style="background-color: rgb(227, 250, 215)">${innerTtem}</c:if><c:if test="${innerTtem == '-1'}"><td>BREAK</td></c:if></td>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </tr>
                                        </c:forEach>
                                    </table>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>

            </section>

        </section>
        <script type="text/javascript">
            var app = angular.module('myApp', []);

            angular.element(document).ready(function () {
                $("#toggleViewEditeMode").click(function()
                {
                    console.log("1111");
                    $(this).children("span").toggle();
                    $(".classRoutineListDisplay").toggle();
                });
            });



        </script>

    </tiles:putAttribute>

</tiles:insertDefinition>

