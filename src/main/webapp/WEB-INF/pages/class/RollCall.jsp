<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<tiles:insertDefinition name="aircraftTemplate">

    <tiles:putAttribute name="body">    <!--main content start-->
        <!--main content start-->
    <div class="content">
        <div class="pageheader">
            <h1>Attendance</h1>
        </div>
        <div class="main-content">
            <div  data-ng-app="myApp">
                <div data-ng-controller="MyController">

                            <form method="post" action="${appBaseUrl}/edu/private/rollCall.web">

                                <div class="form-group" >
                                    <label class="col-sm-2 control-label">Class Name</label>
                                    <div class="col-sm-6">
                                        <select ng-change="getStudentInfo()" name="classId" id="classIdSelect" ng-model="classId" class="input-sm" style="width: 60%">
                                            <option value="">Select Class</option>
                                            <option ng-repeat="item in clazzList" value="{{item.classId}}">{{item.className}}</option>
                                        </select>
                                    </div>
                                </div>
                                <br/>
                                <div class="form-group" >
                                    <label class="col-sm-3 control-label">Student List</label>
                                    <div class="col-sm-12">
                                <table class="table table-striped table-bordered dataTable no-footer">
                                    <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Role</th>
                                        <th class="presentStudentList">Present <input id="selectAll" type="checkbox" />All
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr ng-repeat="item in clazz.studentList">
                                        <td>{{item.profile.firstName}}&nbsp;{{item.profile.lastName}}</td>
                                        <td>{{item.rollNumber}}</td>
                                        <td class="presentStudentList"><input type="checkbox" class="presentBox" name="presentStudentList" value="{{item.studentId}}" ></td>
                                    </tr>
                                    </tbody>
                                </table>
                                        </div>
                                    </div>

                                <c:if test="${loginInfo.userType == 'teacher'}">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"></label>
                                    <div class="col-sm-6">
                                        <button type="submit" class="btn btn-primary btn-block">Save Attendace</button>
                                    </div>
                                </div>
                                </c:if>
                                <%--<input type="hidden" name="classId" value="${requestScope.classId}"/>--%>
                            </form>
                        </div>
            </div>
        </div>
    </div>
    <!--main content end-->
    </tiles:putAttribute>
</tiles:insertDefinition>

