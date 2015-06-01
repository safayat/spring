<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">

        <section class="main-content-wrapper">
            <div class="pageheader">
                <h1>Course Management</h1>
            </div>
            <section id="main-content" class="animated fadeInUp">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Add Course</h3>

                                <div class="actions pull-right">
                                    <i class="fa fa-chevron-down"></i>
                                    <i class="fa fa-times"></i>
                                </div>
                            </div>
                            <div class="panel-body">
                                <form:form method="POST" commandName="course" action="/private/addUpdateCourse.web"
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
                    </div>
                </div>
            </section>
        </section>


    </tiles:putAttribute>
</tiles:insertDefinition>

