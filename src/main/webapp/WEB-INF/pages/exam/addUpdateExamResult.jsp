<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="/WEB-INF/pages/common/head.jsp"/>
<script type="text/javascript">
    var app = angular.module('myApp', []);

    /*angular.element(document).ready(function () {
     $('#admissionDate').datepicker();
     });*/
</script>
<section id="main-wrapper" class="theme-default">
    <jsp:include page="/WEB-INF/pages/common/header.jsp?v=2"/>
    <jsp:include page="/WEB-INF/pages/common/menu.jsp?v=2"/>

    <!--main content start-->
    <section class="main-content-wrapper">
        <div class="pageheader">
            <h1>${examGroup.examName}</h1>
        </div>
        <section id="main-content" class="animated fadeInUp"  >
            <div class="row">
                <div class="col-md-12">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">${clazz.className}&nbsp; ${course.courseName} Marks</h3>
                        </div>
                        <div class="panel-body">


                            <label class="control-label">Student List</label>
                            <form method="post" action="${appBaseUrl}/private/addUpdateExamResult.web">
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
        </section>
    </section>
    <!--main content end-->
</section>
