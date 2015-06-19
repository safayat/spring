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
    <div class="content">
        <div class="header">
            <h1>Salary Sheet</h1>
        </div>
        <div  class="main-content">
            <div data-ng-app="myApp">
                <table class="table tab-bottom table-bordered">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>User Name</th>
                                        <th>Salary</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${salaryList}" var="salaryInfo" varStatus="status">
                                        <tr>
                                            <td>${status.count}</td>
                                            <td>${salaryInfo.user.profile.firstName}&nbsp;${salaryInfo.user.profile.lastName}</td>
                                            <td>${salaryInfo.salary}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
            </div>
        </div>
    </div>
    </tiles:putAttribute>
</tiles:insertDefinition>
