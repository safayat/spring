<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">

        <section class="main-content-wrapper">
            <div class="pageheader">
                <h1>Course Management</h1>
            </div>
            <section id="main-content" class="animated fadeInUp">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Course Info</h3>
                            </div>
                            <div class="panel-body">
                                <label class="control-label">Course Name &nbsp;:&nbsp;${course.courseName}</label><br/>
                                <label class="control-label">Course Code &nbsp;:&nbsp;${course.courseCode}</label><br/>
                                <label class="control-label">Class Name</label><br/>
                                <label class="control-label">Teacher Name&nbsp;:&nbsp;${course.teacher.profile.firstName}&nbsp;${course.teacher.profile.lastName}</label><br/>

                                <h4>Assignment List</h4>
                                <table class="table table-responsive table-bordered">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Title</th>
                                            <th>deadline</th>
                                            <th>Mark</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${assignMentList}" var="assignment" varStatus="status">
                                            <tr>
                                                <td>${status.count}</td>
                                                <td><a href="${appBaseUrl}/private/viewAssignment.web?id=${assignment.assignmentId}">${assignment.title}</a></td>
                                                <td>${assignment.endDateTime}</td>
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
        </section>


    </tiles:putAttribute>
</tiles:insertDefinition>

