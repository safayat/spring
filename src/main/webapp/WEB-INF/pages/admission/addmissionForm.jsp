
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="aircraftTemplate">
    <tiles:putAttribute name="body">

    <!--main content start-->
    <div class="content">
        <div class="header">
            <h1>Admission</h1>
        </div>
        <div class="main-content">
            <div data-ng-app="myApp">
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
        </div>
    </div>
    </tiles:putAttribute>
</tiles:insertDefinition>
