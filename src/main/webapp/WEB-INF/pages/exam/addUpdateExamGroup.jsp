<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="aircraftTemplate">
    <tiles:putAttribute name="body">

        <div class="content">
            <div class="header">
                <h1>Add/Update Exam</h1>
            </div>
            <div class="main-content">
                <div>
                    <form:form method="POST" commandName="examGroup" action="${appBaseUrl}/edu/private/addUpdateExamGroup.web"
                                           cssClass="form-horizontal form-border">
                                    <form:hidden path="examGroupId" />
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Exam Name</label>

                                        <div class="col-sm-6">
                                            <form:input path="examName" cssClass="form-control"/>
                                            <form:errors path="examName" cssClass="has-error"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Year</label>

                                        <div class="col-sm-6">
                                            <form:input path="examYear" cssClass="form-control"/>
                                            <form:errors path="examYear" cssClass="has-error"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Start Date</label>

                                        <div class="col-sm-6">
                                            <form:input path="examStartDate" cssClass="form-control" data-date="12/02/2015" data-date-format="dd/mm/yyyy" readonly="true"/>
                                            <form:errors path="examStartDate" cssClass="has-error"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">End Date</label>

                                        <div class="col-sm-6">
                                            <form:input path="examEndDate" cssClass="form-control" data-date="12/02/2015" data-date-format="dd/mm/yyyy"  readonly="true"/>
                                            <form:errors path="examEndDate" cssClass="has-error"/>
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
                                            <button type="submit" class="btn btn-primary btn-block">submit</button>
                                        </div>
                                    </div>
                                </form:form>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>

