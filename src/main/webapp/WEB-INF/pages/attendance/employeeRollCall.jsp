<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="aircraftTemplate">
    <tiles:putAttribute name="body">

    <!--main content start-->
    <div class="content">
        <div class="header">
            <h1>Roll Call</h1>
        </div>
        <div  class="main-content">
            <div class="row" data-ng-app="myApp">
                <div class="col-md-12">
                    <form method="post" action="${appBaseUrl}/admin/private/attendance.web">
                        <div class="form-group" >
                            <label class="col-sm-3 control-label">Employee List</label>
                            <div class="col-sm-12">
                        <table class="table table-striped table-bordered dataTable no-footer">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>User Type</th>
                                <th class="presentEmployeeList">Present <input id="selectAll" type="checkbox" />All
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${empolyeeUserList}" varStatus="status" var="item">
                                <tr>
                                    <td>${item.profile.firstName}&nbsp;${item.profile.lastName}</td>
                                    <td>${item.userType}</td>
                                    <td class="presentEmployeeList">
                                        <input type="checkbox" class="presentBox" name="presentEmployeeList" value="${item.userId}" >
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                                </div>
                            </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label"></label>
                            <div class="col-sm-6">
                                <button type="submit" class="btn btn-primary btn-block">Save Attendace</button>
                            </div>
                        </div>
                        <%--<input type="hidden" name="classId" value="${requestScope.classId}"/>--%>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--main content end-->
    </tiles:putAttribute>
</tiles:insertDefinition>

