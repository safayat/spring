<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="/WEB-INF/pages/common/head.jsp"/>
<script type="text/javascript">
    var app = angular.module('myApp', []);


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
                            <h3 class="panel-title">Exam Result Paramaters</h3>
                        </div>
                        <div class="panel-body">
                            <form method="get" action="${appBaseUrl}/private/viewExamResult.web" class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Exam Name</label>
                                    <div class="col-sm-6">
                                       <select name="examGroupId" class="col-sm-4">
                                           <c:forEach items="${examGroupList}" var="examGroup">
                                               <option value="${examGroup.examGroupId}">${examGroup.examName}</option>
                                           </c:forEach>
                                       </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Class Name</label>
                                    <div class="col-sm-6">
                                       <select name="classId" class="col-sm-4">
                                           <c:forEach items="${clazzList}" var="clazz">
                                               <option  value="${clazz.classId}">${clazz.className}</option>
                                           </c:forEach>
                                       </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"></label>
                                    <div class="col-sm-6">
                                        <button class="btn btn-primary col-sm-4">View Result</button>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>
    <!--main content end-->
</section>
