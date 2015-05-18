<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                            <h3 class="panel-title">${clazz.className}&nbsp; Result</h3>
                        </div>
                        <div class="panel-body">


                            <form method="post" action="${appBaseUrl}/private/addUpdateExamResult.web">
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
            </div>
        </section>
    </section>
    <!--main content end-->
</section>
