<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 4/28/14
  Time: 4:22 PM
  To change this template use File | Settings | File Templates.

--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" href="http://getbootstrap.com/favicon.ico">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:include page="/WEB-INF/pages/common/head.jsp" />

</head>
<section id="main-wrapper" class="theme-default">
    <jsp:include page="/WEB-INF/pages/common/header.jsp?v=2"/>
    <jsp:include page="/WEB-INF/pages/common/menu.jsp?v=2"/>

    <!--main content start-->
    <section class="main-content-wrapper">
        <div class="pageheader">
            <h1>User Info</h1>
        </div>
        <section id="main-content" class="animated fadeInUp">
            <div class="row" data-ng-app="myApp">
                <div class="col-md-12">

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Profile</h3>
                        </div>
                        <div class="panel-body">
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
        </div></div></div></div></section></section></section>