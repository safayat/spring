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

        angular.element(document).ready(function () {
            $('#dateOfBirth').datepicker();
        });
    </script>
</head>
<section id="main-wrapper" class="theme-default">
    <jsp:include page="/WEB-INF/pages/common/header.jsp?v=2"/>
    <jsp:include page="/WEB-INF/pages/common/menu.jsp?v=2"/>

    <!--main content start-->
    <section class="main-content-wrapper">
        <div class="pageheader">
            <h1>Admission</h1>
        </div>
        <section id="main-content" class="animated fadeInUp">
            <div class="row" data-ng-app="myApp">
                <div class="col-md-12">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Admission Form</h3>
                        </div>
                        <div class="panel-body">
                            <form:form method="POST" commandName="addmissionForm" action="${appBaseUrl}/addmissionForm.web" cssClass="form-horizontal form-border">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">First Name</label>
                                    <div class="col-sm-6">
                                        <form:input path="firstName" cssClass="form-control" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Last Name</label>
                                    <div class="col-sm-6">
                                        <form:input path="lastName" cssClass="form-control"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Date Of Birth</label>
                                    <div class="col-sm-6">
                                        <form:input path="dateOfBirth" cssClass="form-control" data-date="12/05/2015" data-date-format="dd/mm/yyyy"  readonly="true"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Father's Name</label>
                                    <div class="col-sm-6">
                                        <form:input path="father" cssClass="form-control"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Mother's Name</label>
                                    <div class="col-sm-6">
                                        <form:input path="mother" cssClass="form-control"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Guardian</label>
                                    <div class="col-sm-6">
                                        <form:input path="gurdian" cssClass="form-control"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Relationship With Guardian</label>
                                    <div class="col-sm-6">
                                        <form:input path="relationShipWithGuardian" cssClass="form-control"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Current Address</label>
                                    <div class="col-sm-6">
                                        <form:textarea rows="5" path="currentAddress" cssClass="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Permanent Address</label>
                                    <div class="col-sm-6">
                                        <form:textarea rows="5" path="permanentAddress" cssClass="form-control"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Religion</label>
                                    <div class="col-sm-6">
                                        <form:input path="religion" cssClass="form-control"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Gender</label>
                                    <div class="col-sm-6">
                                        <form:select path="gender" cssClass="form-control">
                                            <form:option value="male">Male</form:option>
                                            <form:option value="female">Female</form:option>
                                        </form:select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Family Income</label>
                                    <div class="col-sm-6">
                                        <form:input path="yearlyFamilyIncome" cssClass="form-control"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Latest Exam Result</label>
                                    <div class="col-sm-6">
                                        <form:input path="latestExamResult" cssClass="form-control"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Email Address</label>
                                    <div class="col-sm-6">
                                        <form:input path="emailAddress" cssClass="form-control"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Current School</label>
                                    <div class="col-sm-6">
                                        <form:input path="currentSchool" cssClass="form-control"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Class Name</label>

                                    <div class="col-sm-6">
                                        <form:select path="classId" cssClass="form-control">
                                            <form:options items="${classList}" itemValue="classId"
                                                          itemLabel="className"/>
                                        </form:select>
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