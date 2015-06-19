<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="aircraftTemplate">

    <tiles:putAttribute name="body">    <!--main content start-->
    <!--main content start-->
    <div class="content">
        <div class="header">
            <h1>Add Staff</h1>
        </div>

        <div  class="main-content" data-ng-app="myApp">
            <div class="row">
                <div class="col-md-12">
                            <form:form method="POST" commandName="staff" action="${appBaseUrl}/admin/private/createStaff.web" cssClass="form-horizontal form-border" >
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
    <!--main content end-->
    </tiles:putAttribute>
</tiles:insertDefinition>


