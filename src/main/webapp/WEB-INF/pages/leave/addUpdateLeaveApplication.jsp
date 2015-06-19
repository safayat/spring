<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/25/14
  Time: 11:51 AM
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
            <h1>Leave Application</h1>
        </div>
        <div id="main-content" class="main-content" data-ng-app="myApp">
            <div>
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
    <!--main content end-->
    </tiles:putAttribute>

</tiles:insertDefinition>
