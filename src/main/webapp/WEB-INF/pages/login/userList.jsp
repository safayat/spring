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
            <h1>User List</h1>
            <%-- <div data-ng-app="myApp">
                 <div data-ng-controller="MyController">--%>
            <div class="main-content" data-ng-app="myApp">
                        <div data-ng-controller="MyController">

                            <select ng-model="search.userType" style="float: right" class="input-sm">
                                <option value="">ALL</option>
                                <option value="teacher">Teacher</option>
                                <option value="student">Student</option>
                                <option value="admin">Admin</option>
                                <option value="staff">Staff</option>
                            </select>
                            <br/>
                            <br/>
                            <div class="row">
                                <div class="col-md-2" ng-repeat="item in usersInfo | filter:search" style="width: 11%;padding: 5px">
                                    <div class="thumbnail" style="margin-bottom: 0px">
                                        <img ng-if="item.profile.profileImageUrl == 'image/Default_Profile_Picture.png'" src="${appBaseUrl}/{{item.profile.profileImageUrl}}" alt="..." height="50px" class="img-circle">
                                        <img ng-if="item.profile.profileImageUrl != 'image/Default_Profile_Picture.png'" src="{{item.profile.profileImageUrl}}" alt="..." height="50px" class="img-circle">
                                        <div class="caption">
                                            <h4 style="overflow-x: hidden;overflow-y: hidden">{{item.profile.firstName}}</h4>
                                            <p>{{item.userType}}</p>
                                            <%--<c:if test="${loginInfo.userType == 'admin'}">--%>
                                                <a ng-if = "item.userType == 'teacher' "  href="${appBaseUrl}/admin/private/createTeacher.web?userId={{item.userId}}">Edit</a>
                                                <a ng-if = "item.userType == 'student' "  href="${appBaseUrl}/admin/private/createStudent.web?userId={{item.userId}}">Edit</a>
                                                <a ng-if = "item.userType == 'staff' "  href="${appBaseUrl}/admin/private/createStaff.web?userId={{item.userId}}">Edit</a>
                                            <%--</c:if>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
            </div>
    <!--main content end-->
    </tiles:putAttribute>
</tiles:insertDefinition>
