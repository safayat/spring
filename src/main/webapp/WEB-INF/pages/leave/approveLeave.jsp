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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/pages/common/head.jsp"/>
<script type="text/javascript">
    var app = angular.module('myApp', []);

    angular.element(document).ready(function () {
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
                            <h3 class="panel-title">Update Leave Application Status</h3>
                        </div>
                        <div class="panel-body">
                                <form:form method="POST" commandName="leaveApplication" action="/private/addUpdateLeaveApplication.web" cssClass="form-horizontal form-border" >

                                    <form:hidden path="leaveId"/>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"></label>
                                        <div class="col-sm-3">
                                            <label class="control-label">From</label>
                                            <form:input path="fromDate" cssClass="form-control" readonly="true"  />
                                        </div>
                                        <div class="col-sm-3">
                                            <label class="control-label">To</label>
                                            <form:input path="toDate" cssClass="form-control" readonly="true"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Leave Category</label>
                                        <div class="col-sm-6">
                                            <form:input cssClass="form-control" path="leaveType" readonly="true"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Leave Description</label>
                                        <div class="col-sm-6">
                                            <form:textarea path="leaveDescription" cssClass="form-control" rows="5" readonly="true"/>
                                            <form:errors path="leaveDescription" cssClass="has-error"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Leave Address</label>
                                        <div class="col-sm-6">
                                            <form:textarea path="leaveAddress" cssClass="form-control" rows="5" readonly="true"/>
                                            <form:errors path="leaveAddress" cssClass="has-error"/>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Leave Status</label>
                                        <div class="col-sm-6">
                                            <form:select path="leaveStatus"  cssClass="form-control">
                                                <form:option value="pending">pending</form:option>
                                                <form:option value="approve">approve</form:option>
                                                <form:option value="reject">reject</form:option>
                                            </form:select>
                                        </div>
                                    </div>
                                    <c:if test="${fn:length(userList) > 0}">
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label">Replacement</label>
                                            <div class="col-sm-6">
                                                <form:select path="replacementUserId"  cssClass="form-control">
                                                    <form:options items="${userList}" itemValue="userId"
                                                                  itemLabel="profile.firstName"/>
                                                </form:select>
                                            </div>
                                        </div>

                                    </c:if>

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
