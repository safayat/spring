<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertDefinition name="aircraftTemplate">

    <tiles:putAttribute name="body">    <!--main content start-->
        <!--main content start-->

    <!--main content start-->
    <div class="content">
        <div class="pageheader">
            <h1>Class List</h1>
        </div>
        <div class="main-content">
            <div data-ng-app="myApp">
                        <div data-ng-controller="MyController">
                            <table class="table table-striped table-bordered dataTable no-footer">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Class Name</th>
                                        <th>Class Teacher name</th>
                                        <th>Count</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${clazzList}" var="clazz">
                                    <tr>
                                        <td>${clazz.classId}</td>
                                        <td><a href="${appBaseUrl}/private/classDetail.web?classId=${clazz.classId}">${clazz.className}</a></td>
                                        <td>${clazz.classTeacher.profile.firstName}&nbsp;${clazz.classTeacher.profile.lastName}</td>
                                        <td>${studentCountMap[clazz.classId]}</td>
                                        <td><a href="${appBaseUrl}/admin/private/addUpdateClass.web?classId=${clazz.classId}">Edit</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
            </div>
        </div>
    </div>
    </tiles:putAttribute>
</tiles:insertDefinition>