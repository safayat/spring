<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="aircraftTemplate">
    <tiles:putAttribute name="body">

    <!--main content start-->
    <div class="content">
        <div class="header">
            <h1>Course List</h1>
        </div>
        <div  class="main-content">
            <div>
                            <ul class="nav nav-tabs">
                                <li role="presentation" class="active"><a id="courseInfoAnchor" href="#">Course Info</a>
                                </li>
                                <li role="presentation"><a id="syllabusAnchor" href="#">Syllabus</a></li>
                            </ul>
                            <br/>
                            <table class="table table-striped table-bordered" id="courseInfoTable">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Course Name</th>
                                    <th>Course Code</th>
                                    <th>Teacher Name</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="course" items="${courseList}" varStatus="status">
                                    <tr>
                                        <td>${status.count}</td>
                                        <td>
                                            <a href="${appBaseUrl}/private/viewCourse.web?courseId=${course.courseId}">${course.courseName}</a>
                                        </td>
                                        <td>${course.courseCode}</td>
                                        <td>${course.teacher.fullName}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true"
                                 style="display: none">
                                <c:forEach items="${courseList}" var="course">
                                    <div class="panel panel-success" style="min-height: 0px">
                                        <div class="panel-heading" role="tab" id="heading_${course.courseId}">
                                                <a data-toggle="collapse" data-parent="#accordion"
                                                   href="#collapse_${course.courseId}" aria-expanded="true"
                                                   aria-controls="collapse_${course.courseId}">
                                                    <h4 class="panel-title">

                                                    ${course.courseName}
                                                    </h4>
                                                </a>

                                        </div>
                                        <div id="collapse_${course.courseId}" class="panel-collapse collapse"
                                             role="tabpanel" aria-labelledby="heading_${course.courseId}">
                                            <div class="panel-body">
                                                    ${course.syllabus}
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
        </div>
    </div>
    <!--main content end-->
    </tiles:putAttribute>
</tiles:insertDefinition>
