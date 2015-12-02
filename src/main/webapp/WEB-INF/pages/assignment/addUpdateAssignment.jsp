<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="aircraftTemplate">
    <tiles:putAttribute name="body">

        <section class="main-content-wrapper">
            <div class="pageheader">
                <h1>Assignment Management</h1>
            </div>
            <section id="main-content" class="animated fadeInUp" data-ng-app="myApp">
                <div>
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Add/Update Assignment</h3>
                            </div>
                            <div class="panel-body">
                                <form:form method="POST" commandName="assignment" action="/private/addUpdateAssignment.web"
                                           cssClass="form-horizontal form-border">

                                    <form:hidden path="assignmentId" />
                                    <form:hidden path="messageKey" />
                                    <form:hidden path="courseId" />
                                    <form:hidden path="postDateTime" />

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Assignment Name</label>

                                        <div class="col-sm-6">
                                            <form:input path="title" cssClass="form-control"/>
                                            <form:errors path="title" cssClass="has-error"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Description</label>

                                        <div class="col-sm-6">
                                            <form:textarea path="description" cssClass="form-control" rows="20"></form:textarea>
                                            <form:errors path="description" cssClass="has-error"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Deadline</label>

                                        <div class="col-sm-6">
                                            from &nbsp;<form:input  path="startDateTime" data-date="12/02/2012" data-date-format="dd/mm/yyyy"  readonly="true" cssClass="input-sm"/>
                                            &nbsp;to&nbsp;<form:input path="endDateTime" data-date="12/02/2012" data-date-format="dd/mm/yyyy"  readonly="true" cssClass="input-sm"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Mark</label>

                                        <div class="col-sm-6">
                                            <form:input path="mark" cssClass="form-control"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"></label>
                                        <div class="col-sm-6">
                                            <button type="submit" class="btn btn-primary btn-block">submit</button>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
            <script type="text/javascript">
                var app = angular.module('myApp', []);

                angular.element(document).ready(function () {
                    $('#startDateTime').datepicker();
                    $('#endDateTime').datepicker();
                });
            </script>
        </section>


    </tiles:putAttribute>
</tiles:insertDefinition>

