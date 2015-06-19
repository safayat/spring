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
            <h1>User Info</h1>
            <div class="main-content">
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
    </tiles:putAttribute>
</tiles:insertDefinition>
