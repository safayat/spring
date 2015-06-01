<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/25/14
  Time: 11:51 AM
  To change this template use File | Settings | File Templates.
--%>

<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/25/14
  Time: 11:51 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/pages/common/head.jsp"/>

<script type="text/javascript">

    var app = angular.module('myApp', []);

    angular.element(document).ready(function () {
        $('#dateOfJoin').datepicker();
    });
</script>
<body>
<section id="main-wrapper" class="theme-default">
    <jsp:include page="/WEB-INF/pages/common/header.jsp"/>
    <jsp:include page="/WEB-INF/pages/common/menu.jsp"/>

    <!--main content start-->
    <section class="main-content-wrapper">
        <div class="pageheader">
            <h1>User Management</h1>


        </div>

        <section id="main-content" class="animated fadeInUp" data-ng-app="myApp">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Add Staff</h3>
                            <div class="actions pull-right">
                                <i class="fa fa-chevron-down"></i>
                                <i class="fa fa-times"></i>
                            </div>
                        </div>
                        <div class="panel-body">
                            <form:form method="POST" commandName="staff" action="${appBaseUrl}/private/createStaff.web" cssClass="form-horizontal form-border" >
                                <jsp:include page="/WEB-INF/pages/user/loginInfo.jsp" />
                                <form:hidden path="staffId"/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Designation</label>
                                    <div class="col-sm-6">
                                        <form:input path="designation" cssClass="form-control"/>
                                        <form:errors path="designation" cssClass="has-error"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Employee level / Paying Scale</label>
                                    <div class="col-sm-6">
                                        <form:input path="employeeLevel" cssClass="form-control"/>
                                        <form:errors path="employeeLevel" cssClass="has-error"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Joining Date</label>
                                    <div class="col-sm-6"  >
                                        <form:input path="dateOfJoin" cssClass="form-control" data-date="12/02/2012" data-date-format="dd/mm/yyyy"  readonly="true"/>
                                        <form:errors path="dateOfJoin" cssClass="has-error"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label"></label>
                                    <div class="col-sm-6">
                                        <button type="submit" class="btn btn-primary btn-block">Signup</button>
                                    </div>
                                </div>

                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>
    <!--main content end-->
</section>

</body>

</html>


