<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/pages/common/head.jsp"/>

<section id="main-wrapper" class="theme-default">
    <jsp:include page="/WEB-INF/pages/common/header.jsp?v=2"/>
    <jsp:include page="/WEB-INF/pages/common/menu.jsp?v=2"/>

    <!--main content start-->
    <section class="main-content-wrapper">
        <div class="pageheader">
            <h1>Course Management</h1>
        </div>
        <section id="main-content" class="animated fadeInUp" >
            <div class="row">
                <div class="col-md-12">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Course List</h3>
                        </div>
                        <div class="panel-body">

                            <table class="table table-striped table-bordered dataTable no-footer">
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
                                            <td><a href="${appBaseUrl}/private/viewCourse.web?courseId=${course.courseId}">${course.courseName}</a></td>
                                            <td>${course.courseCode}</td>
                                            <td>${course.teacher.profile.firstName}&nbsp;${course.teacher.profile.lastName}</td>
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
