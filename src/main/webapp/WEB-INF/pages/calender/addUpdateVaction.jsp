<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/28/14
  Time: 4:22 PM
  To change this template use File | Settings | File Templates.

--%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="aircraftTemplate">
    <tiles:putAttribute name="body">

    <!--main content start-->
    <div class="content">
        <div class="header">
            <h1>Add/Update Vacation</h1>
        </div>
        <div class="main-content">
            <div data-ng-app="myApp">
                <form:form method="POST" commandName="vacation" action="${appBaseUrl}/admin/private/addUpdateVaction.web" cssClass="form-horizontal form-border">
                                <form:hidden path="vacationId"/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Vacation Name</label>
                                    <div class="col-sm-6">
                                        <form:input path="vacationName" cssClass="form-control"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">From</label>
                                    <div class="col-sm-6">
                                        <form:input path="startDate" cssClass="form-control" data-date="12/05/2015" data-date-format="dd/mm/yyyy"  readonly="true"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">To</label>
                                    <div class="col-sm-6">
                                        <form:input path="endDate" cssClass="form-control" data-date="12/05/2015" data-date-format="dd/mm/yyyy"  readonly="true"/>
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
    </tiles:putAttribute>
</tiles:insertDefinition>
