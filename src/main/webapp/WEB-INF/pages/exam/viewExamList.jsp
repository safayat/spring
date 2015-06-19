<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="aircraftTemplate">
    <tiles:putAttribute name="body">

    <!--main content start-->
    <div class="content">
        <div class="header">
            <h1>Exam List</h1>
        </div>
        <div class="main-content"  >
            <div>
                <table class="table table-striped table-bordered dataTable no-footer">
                                    <thead>
                                        <tr>
                                            <th>Exam Name</th>
                                            <th>Year</th>
                                            <th>Exam Start Date</th>
                                            <th>Exam End Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${examGroupList}" var="examGroup" varStatus="status">
                                            <tr>
                                                <td>${examGroup.examName}</td>
                                                <td>${examGroup.examYear}</td>
                                                <td>${examGroup.examStartDate}</td>
                                                <td>${examGroup.examEndDate}</td>

                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
            </div>
        </div>
    </div>
    <!--main content end-->
    </tiles:putAttribute>
</tiles:insertDefinition>
