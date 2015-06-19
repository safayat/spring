<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<tiles:insertDefinition name="aircraftTemplate">
    <tiles:putAttribute name="body">

    <!--main content start-->
    <div class="content">
        <div class="header">
            <h1>${examGroup.examName}</h1>
        </div>
        <div  class="main-content"  >
            <div>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">${clazz.className}&nbsp; ${course.courseName} Marks</h3>
                        </div>
                        <div class="panel-body">


                            <label class="control-label">Student List</label>
                            <form method="post" action="${appBaseUrl}/edu/private/addUpdateExamResult.web">
                                <button class="btn btn-primary">Update Marks</button>
                                <input type="hidden" name="examGroupId" value="${examGroup.examGroupId}">
                                <input type="hidden" name="courseId" value="${course.courseId}">
                                <table class="table table-striped table-bordered dataTable no-footer">
                                    <thead>
                                        <tr>
                                            <th>Role</th>
                                            <th>Name</th>
                                            <th>Mark</th>
                                            <th>Total Mark</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${examResultList}" var="item" varStatus="status">
                                            <tr>
                                                <td>${studentMap[item.studentId].rollNumber}</td>
                                                <td>${studentMap[item.studentId].profile.firstName}&nbsp;${studentMap[item.studentId].profile.lastName}</td>
                                                <td>
                                                    <input type="number" name="student_${item.resultId}_${item.studentId}" value="${item.mark}">
                                                </td>
                                                <td>${item.totalMark}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
            </div>
        </div>
    </div>
    <!--main content end-->
    </tiles:putAttribute>
</tiles:insertDefinition>
