  <%--Created by IntelliJ IDEA.
  User: safayat
  Date: 4/25/14
  Time: 11:51 AM
  To change this template use File | Settings | File Templates.
--%>



<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertDefinition name="aircraftTemplate">



    <tiles:putAttribute name="body">

        <div class="content" data-ng-app="myApp">

            <div class="header">
                <h1>Students</h1>
            </div>

            <div class="main-content" >
                <div class="row" data-ng-controller="MyController">
                    <div class="col-sm-2" ng-repeat="student in students" >
                        <div class="thumbnail">
                            <a href="${appBaseUrl}/private/profileView.web?profileId={{student.profile.profileId}}">
                                <img ng-if="student.profile.profileImageUrl == 'image/Default_Profile_Picture.png'" src="${appBaseUrl}/{{student.profile.profileImageUrl}}" alt="..." height="50px">
                                <img ng-if="student.profile.profileImageUrl != 'image/Default_Profile_Picture.png'" src="{{student.profile.profileImageUrl}}" alt="..." height="50px">
                                <div class="caption">
                                    <h4 style="overflow-x: hidden;overflow-y: hidden">{{student.profile.firstName}}</h4>
                                    <p>Roll:{{student.rollNumber}} &nbsp; Class:{{student.clazz.className}}</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </tiles:putAttribute>
</tiles:insertDefinition>

