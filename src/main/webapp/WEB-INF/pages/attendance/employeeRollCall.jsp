<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/pages/common/head.jsp"/>
<script type="text/javascript">
    var app = angular.module('myApp', []);
    angular.element(document).ready(function () {
        $("#selectAll").click(function(){
            $(".presentBox").prop('checked',$(this).prop('checked'));
        });
    });

</script>
<section id="main-wrapper" class="theme-default">
    <jsp:include page="/WEB-INF/pages/common/header.jsp?v=2"/>
    <jsp:include page="/WEB-INF/pages/common/menu.jsp?v=2"/>

    <!--main content start-->
    <section class="main-content-wrapper">
        <div class="pageheader">
            <h1>Attendance</h1>
        </div>
        <section id="main-content" class="animated fadeInUp">
            <div class="row" data-ng-app="myApp">
                <div class="col-md-12">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Roll Call</h3>
                        </div>
                        <div class="panel-body">

                            <form method="post" action="${appBaseUrl}/private/attendance.web">


                                <div class="form-group" >
                                    <label class="col-sm-3 control-label">Employee List</label>
                                    <div class="col-sm-12">
                                <table class="table table-striped table-bordered dataTable no-footer">
                                    <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>User Type</th>
                                        <th class="presentEmployeeList">Present <input id="selectAll" type="checkbox" />All
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${empolyeeUserList}" varStatus="status" var="item">
                                        <tr>
                                            <td>${item.profile.firstName}&nbsp;${item.profile.lastName}</td>
                                            <td>${item.userType}</td>
                                            <td class="presentEmployeeList">
                                                <input type="checkbox" class="presentBox" name="presentEmployeeList" value="${item.userId}" >
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                        </div>
                                    </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label"></label>
                                    <div class="col-sm-6">
                                        <button type="submit" class="btn btn-primary btn-block">Save Attendace</button>
                                    </div>
                                </div>
                                <%--<input type="hidden" name="classId" value="${requestScope.classId}"/>--%>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>
    <!--main content end-->
</section>
