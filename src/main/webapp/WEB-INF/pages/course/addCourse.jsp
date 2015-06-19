<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="aircraftTemplate">
    <tiles:putAttribute name="body">

        <div class="content">
            <div class="header">
                <h1>Add Course</h1>
            </div>
            <div  class="main-content">
                <form:form method="POST" commandName="course" action="/edu/private/addUpdateCourse.web"
                                           cssClass="form-horizontal form-border">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Course Name</label>

                                        <div class="col-sm-6">
                                            <form:input path="courseName" cssClass="form-control"/>
                                            <form:errors path="courseName" cssClass="has-error"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Course Code</label>

                                        <div class="col-sm-6">
                                            <form:input path="courseCode" cssClass="form-control"/>
                                            <form:errors path="courseCode" cssClass="has-error"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Course Syllabus</label>

                                        <div class="col-sm-6">
                                            <form:textarea path="syllabus" cssClass="form-control" rows="10"/>
                                            <form:errors path="syllabus" cssClass="has-error"/>
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
                                        <label class="col-sm-3 control-label">Teacher Name</label>

                                        <div class="col-sm-6">
                                            <form:select path="teacherId" cssClass="form-control">
                                                <form:options items="${teacherList}" itemValue="teacherId"
                                                              itemLabel="profile.firstName"/>
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
    </tiles:putAttribute>
</tiles:insertDefinition>

