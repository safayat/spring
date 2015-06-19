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
                <h1>Teachers</h1>
            </div>

            <div class="main-content" >
                <div class="row" data-ng-controller="MyController">
                    <div class="col-sm-2" ng-repeat="teacher in teachers" >
                        <div class="thumbnail">
                            <a href="${appBaseUrl}/private/profileView.web?profileId={{teacher.profile.profileId}}">
                                <img ng-if="teacher.profile.profileImageUrl == 'image/Default_Profile_Picture.png'" src="${appBaseUrl}/{{teacher.profile.profileImageUrl}}" alt="..." height="50px">
                                <img ng-if="teacher.profile.profileImageUrl != 'image/Default_Profile_Picture.png'" src="{{teacher.profile.profileImageUrl}}" alt="..." height="50px">
                                <div class="caption">
                                    <h4 style="overflow-x: hidden;overflow-y: hidden">{{teacher.profile.firstName}}</h4>
                                    <p>{{teacher.destination}}</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </tiles:putAttribute>
</tiles:insertDefinition>

