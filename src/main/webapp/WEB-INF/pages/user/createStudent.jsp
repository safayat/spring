<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/25/14
  Time: 11:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<tiles:insertDefinition name="aircraftTemplate">


    <tiles:putAttribute name="body"> <!--main content start-->
        <!--main content start-->
        <div class="content">
            <div class="header">
                <h1>Add Update Student</h1>
            </div>
            <div class="main-content" data-ng-app="myApp">
                <div class="row">
                    <div class="col-md-12" data-ng-controller="MyController">
                        <form:form method="POST" commandName="student" action="/admin/private/createStudent.web"
                                   cssClass="form-horizontal form-border">
                            <c:set var="readOnly" value="${student.id > 0}" scope="request"/>

                            <jsp:include page="/WEB-INF/pages/user/loginInfo.jsp"/>
                            <form:hidden path="studentId"/>
                            <form:hidden path="userId"/>


                            <div class="form-group">
                                <label class="col-sm-3 control-label">Class Name</label>

                                <div class="col-sm-6">
                                    <form:select path="classId" cssClass="form-control">
                                        <form:options items="${classList}" itemValue="classId" itemLabel="className"/>
                                    </form:select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Admission Date</label>
                                <div class="col-sm-6">
                                    <form:input path="admissionDate" cssClass="form-control" data-date="12/02/2012"
                                                data-date-format="dd/mm/yyyy" readonly="true"/>
                                    <form:errors path="admissionDate" cssClass="has-error"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Roll Number</label>

                                <div class="col-sm-6">
                                    <form:input path="rollNumber" cssClass="form-control"/>
                                    <form:errors path="rollNumber" cssClass="has-error"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">Parent</label>

                                <div class="col-sm-6">
                                    <form:input path="parentUserId" cssClass="form-control"/>
                                    <form:errors path="parentUserId" cssClass="has-error"/>
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
        <!--main content end-->
    </tiles:putAttribute>
</tiles:insertDefinition>
