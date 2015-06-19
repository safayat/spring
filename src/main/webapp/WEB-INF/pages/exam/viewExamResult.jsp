<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="aircraftTemplate">
    <tiles:putAttribute name="body">
    <!--main content start-->
    <div class="content">
        <div class="header">
            <h1>${examGroup.examName}</h1>
        </div>
        <div class="main-content"  >
            <div>
                            <h3 class="panel-title">${clazz.className}&nbsp; Result</h3>
                            <form method="post" action="${appBaseUrl}/edu/private/addUpdateExamResult.web">
                                <table class="table table-striped table-bordered dataTable no-footer">
                                    <thead>
                                        <tr>
                                            <th>Roll</th>
                                            <th>Name</th>
                                            <c:forEach items="${courseList}" var="course" varStatus="status">
                                                <th>${course.courseName}</th>
                                            </c:forEach>
                                            <th>Total Mark</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${studentCourseMarkMap}" var="item" varStatus="status">
                                            <tr>
                                                <td>${studentMap[item.key].rollNumber}</td>
                                                <td>${studentMap[item.key].profile.firstName}&nbsp;${studentMap[item.key].profile.lastName}</td>
                                                <c:forEach items="${item.value}" var="examResult" varStatus="innerStatus">
                                                    <td>${examResult.mark}</td>
                                                </c:forEach>
                                                <c:if test="${fn:length(item.value)<fn:length(courseList)}">
                                                    <c:forEach begin="1" end="${fn:length(courseList)-fn:length(item.value)}">
                                                        <td>0</td>
                                                    </c:forEach>
                                                </c:if>
                                                <td>${studentTotalCourseMarkMap[item.key]}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </form>
            </div>
        </div>
    </div>
    <!--main content end-->
    </tiles:putAttribute>
</tiles:insertDefinition>
