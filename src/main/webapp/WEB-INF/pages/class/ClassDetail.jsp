<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertDefinition name="aircraftTemplate">

    <tiles:putAttribute name="body">    <!--main content start-->
        <div class="content"  data-ng-app="myApp" data-ng-controller="MyController">
            <div class="header">
                {{clazz.className}}
            </div>
            <div class="main-content"  >
                    <div class=" pull-right">
                        <a href="${appBaseUrl}/edu/private/rollCall.web?classId={{clazz.classId}}" class="btn btn-success btn-lg">Roll Call</a>
                        &nbsp;&nbsp;<a href="${appBaseUrl}/private/classCourses.web?classId={{clazz.classId}}" class="btn btn-primary btn-lg">Course List</a>
                        &nbsp;&nbsp;<a href="${appBaseUrl}/private/CourseRoutine.web?classId={{clazz.classId}}" class="btn btn-primary btn-lg">Course Routine</a>
                    </div>

                    <label class="control-label">Class teacher &nbsp;:&nbsp; </label>{{clazz.classTeacher.profile.firstName}}
                    <br/>
                    <label class="control-label">Total Student &nbsp;:&nbsp; </label>{{clazz.studentList.length}}
                    <br/>
                    <label class="control-label">Student List</label>
                    <table class="table table-striped table-bordered dataTable no-footer">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Role</th>
                                <th>Admission Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="item in clazz.studentList">
                                <td>{{item.profile.firstName}}&nbsp;{{item.profile.lastName}}</td>
                                <td>{{item.rollNumber}}</td>
                                <td>{{item.admissionDate | date:'fullDate'}}</td>
                            </tr>
                        </tbody>
                    </table>
            </div>
        </div>
    <!--main content end-->
    </tiles:putAttribute>
</tiles:insertDefinition>
