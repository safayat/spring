<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="aircraftTemplate">

    <tiles:putAttribute name="body">    <!--main content start-->
        <div class="content"  data-ng-app="myApp" data-ng-controller="MyController">
            <div class="header">
                Add/Update class
            </div>
            <div class="main-content"  >
                <form:form method="post" action="${appBaseUrl}/admin/private/addUpdateClass.web" commandName="clazz" cssClass="form-horizontal form-border">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">Class Name</label>
                        <div class="col-sm-6">
                            <form:input path="className" cssClass="form-control"/>
                        </div>
                    </div>

                    <div class="form-group" >
                        <label class="col-sm-3 control-label">Class Teacher</label>
                        <div class="col-sm-6">
                            <form:select path="classTeacherId" cssClass="form-control">
                                <form:options items="${teacherList}" itemValue="teacherId" itemLabel="profile.firstName"/>
                            </form:select>
                        </div>
                    </div>

                    <div class="form-group" >
                        <label class="col-sm-3 control-label">Class Captain</label>
                        <div class="col-sm-6">
                            <form:select path="classId" cssClass="form-control">
                                <form:options items="${clazz.studentList}" itemValue="studentId" itemLabel="profile.firstName"/>
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
    <!--main content end-->
    </tiles:putAttribute>
</tiles:insertDefinition>
