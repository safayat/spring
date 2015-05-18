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
            <h1>Exam Management</h1>
        </div>
        <section id="main-content" class="animated fadeInUp"  >
            <div class="row">
                <div class="col-md-12">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Exam List</h3>
                        </div>
                        <div class="panel-body">


                                <table class="table table-striped table-bordered dataTable no-footer">
                                    <thead>
                                        <tr>
                                            <th>Exam Name</th>
                                            <th>Year</th>
                                            <th>Exam Start Date</th>
                                            <th>Exam End Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${examGroupList}" var="examGroup" varStatus="status">
                                            <tr>
                                                <td>${examGroup.examName}</td>
                                                <td>${examGroup.examYear}</td>
                                                <td>${examGroup.examStartDate}</td>
                                                <td>${examGroup.examEndDate}</td>

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
