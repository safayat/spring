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
        <div class="content" data-ng-app="myApp">
            <div class="header">
                Home
            </div>
            <div class="main-content">
                <div class="col-md-2">
                    <form action="${appBaseUrl}/private/uploadProfilePicture.web" method="post" enctype="multipart/form-data">
                        <div class="img-thumbnail">
                            <img src="<c:if test="${profile.profileImageUrl == 'image/Default_Profile_Picture.png'}">${appBaseUrl}/</c:if>${profile.profileImageUrl}" height="200">
                        </div>
                        <input name="profileImage" type="file" placeholder="upload profile picture">
                        <input name="profileId" type="hidden" value="${profile.profileId}">
                        <button class="btn btn-success">upload</button>
                    </form>
                </div>
                <div class="col-md-10">
                <form:form method="POST" commandName="profile" action="/private/updateProfile.web" cssClass="form-horizontal form-border">

                    <form:hidden path="profileId"/>
                    <form:hidden path="profileImageUrl"/>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">First Name</label>
                        <div class="col-sm-6">
                            <form:input path="firstName" cssClass="form-control"/>
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
                            <form:input path="dateOfBirth" class="form-control"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">Mobile No</label>
                        <div class="col-sm-6">
                            <form:input path="mobileNo" cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"></label>
                        <div class="col-sm-6">
                            <button type="submit" class="btn btn-primary btn-block">Update Profile</button>
                        </div>
                    </div>


                </form:form>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>
