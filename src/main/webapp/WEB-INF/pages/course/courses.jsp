<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/pages/common/head.jsp"/>
<script>
    angular.element(document).ready(function () {
        $("#syllabusAnchor").click(function () {
            $(this).parent().addClass('active');
            $('#courseInfoAnchor').parent().removeClass('active');
            $("#courseInfoTable").hide();
            $("#accordion").show();
        });
        $("#courseInfoAnchor").click(function () {
            $(this).parent().addClass('active');
            $('#syllabusAnchor').parent().removeClass('active');
            $("#accordion").hide();
            $("#courseInfoTable").show();
        });
    });


</script>
<section id="main-wrapper" class="theme-default">
    <jsp:include page="/WEB-INF/pages/common/header.jsp?v=2"/>
    <jsp:include page="/WEB-INF/pages/common/menu.jsp?v=2"/>

    <!--main content start-->
    <section class="main-content-wrapper">
        <div class="pageheader">
            <h1>Course Management</h1>
        </div>
        <section id="main-content" class="animated fadeInUp">
            <div class="row">
                <div class="col-md-12">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Course List</h3>
                        </div>
                        <div class="panel-body">
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
                                        <td>${course.teacher.profile.firstName}&nbsp;${course.teacher.profile.lastName}</td>
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
            </div>
        </section>
    </section>
    <!--main content end-->
</section>
