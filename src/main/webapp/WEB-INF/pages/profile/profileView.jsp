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
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:include page="/WEB-INF/pages/common/head.jsp"/>

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
                                <div class="img-thumbnail">
                                    <img src="<c:if test="${profile.profileImageUrl == 'image/Default_Profile_Picture.png'}">${appBaseUrl}/</c:if>${profile.profileImageUrl}"
                                         height="200">
                                </div>
                            </div>
                            <div class="col-md-10">
                                <div class="thumbnail">
                                    <ul>
                                        <li>Name: ${profile.firstName}&nbsp;${profile.lastName}</li>
                                        <li>Mobile: ${profile.mobileNo}</li>
                                        <li>Date Of Birth: ${profile.dateOfBirth}</li>
                                        <li>Email: ${profile.login.email}</li>
                                        <li>User Type: ${profile.login.userType}</li>
                                    </ul>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </section>
</section>