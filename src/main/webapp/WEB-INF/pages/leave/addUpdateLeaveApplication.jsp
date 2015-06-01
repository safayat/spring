<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/25/14
  Time: 11:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/pages/common/head.jsp"/>
<script type="text/javascript">
    var app = angular.module('myApp', []);

    angular.element(document).ready(function () {
        $('#fromDate').datepicker();
        $('#toDate').datepicker();
    });
</script>
<body>
<section id="main-wrapper" class="theme-default">
    <jsp:include page="/WEB-INF/pages/common/header.jsp"/>
    <jsp:include page="/WEB-INF/pages/common/menu.jsp"/>

    <!--main content start-->
    <section class="main-content-wrapper">
        <div class="pageheader">
            <h1>Leave Management</h1>

        </div>
        <section id="main-content" class="animated fadeInUp" data-ng-app="myApp">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Leave Application</h3>
                        </div>
                        <div class="panel-body">
                                <form:form method="POST" commandName="leaveApplication" action="/private/addUpdateLeaveApplication.web" cssClass="form-horizontal form-border" >

                                    <form:hidden path="leaveId"/>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"></label>
                                        <div class="col-sm-3">
                                            <label class="control-label">From</label>
                                            <form:input path="fromDate" cssClass="form-control" data-date="12/05/2015" data-date-format="dd/mm/yyyy"  readonly="true" />
                                        </div>
                                        <div class="col-sm-3">
                                            <label class="control-label">To</label>
                                            <form:input path="toDate" cssClass="form-control" data-date="12/05/2015" data-date-format="dd/mm/yyyy"  readonly="true"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Leave Category</label>
                                        <div class="col-sm-6">
                                            <form:select path="leaveType" cssClass="form-control">
                                                <form:option value="casual">Casual</form:option>
                                                <form:option value="medical">Medical</form:option>
                                            </form:select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Leave Description</label>
                                        <div class="col-sm-6">
                                            <form:textarea path="leaveDescription" cssClass="form-control" rows="10"/>
                                            <form:errors path="leaveDescription" cssClass="has-error"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Leave Address</label>
                                        <div class="col-sm-6">
                                            <form:textarea path="leaveAddress" cssClass="form-control" rows="5"/>
                                            <form:errors path="leaveAddress" cssClass="has-error"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"></label>
                                        <div class="col-sm-6">
                                            <button type="submit" class="btn btn-primary btn-block">Submit</button>
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
