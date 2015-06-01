<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/28/14
  Time: 4:22 PM
  To change this template use File | Settings | File Templates.

--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" href="http://getbootstrap.com/favicon.ico">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:include page="/WEB-INF/pages/common/head.jsp" />
    <script type="text/javascript">
        var app = angular.module('myApp', []);
    </script>
</head>
<section id="main-wrapper" class="theme-default">
    <jsp:include page="/WEB-INF/pages/common/header.jsp?v=2"/>
    <jsp:include page="/WEB-INF/pages/common/menu.jsp?v=2"/>

    <!--main content start-->
    <section class="main-content-wrapper">
        <div class="pageheader">
            <h1>Accounts</h1>
        </div>
        <section id="main-content" class="animated fadeInUp">
            <div class="row" data-ng-app="myApp">
                <div class="col-md-12">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Salary Sheet</h3>
                        </div>
                        <div class="panel-body">
                            <form:form method="POST" commandName="salaryInfo" action="${appBaseUrl}/private/addUpdateSalary.web" cssClass="form-horizontal form-border">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">User Name</label>
                                    <div class="col-sm-6">
                                        <form:select path="userId" cssClass="form-control">
                                        <form:options items="${employeeList}" itemValue="userId"
                                                      itemLabel="profile.firstName"/>
                                        </form:select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Salary</label>
                                    <div class="col-sm-6">
                                        <form:input path="salary" cssClass="form-control"/>
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
        </div></div></div></section></section></section>