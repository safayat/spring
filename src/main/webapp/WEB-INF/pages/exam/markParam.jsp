<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<tiles:insertDefinition name="aircraftTemplate">
    <tiles:putAttribute name="body">

    <!--main content start-->
    <div class="content">
        <div class="header">
            <h1>Exam Mark Paramaters</h1>
        </div>
        <div id="main-content" class="main-content" >
            <div >
                <form method="get" action="${appBaseUrl}/edu/private/addUpdateExamResult.web" class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Exam Name</label>
                                    <div class="col-sm-6">
                                       <select name="examGroupId" class="col-sm-4">
                                           <c:forEach items="${examGroupList}" var="examGroup">
                                               <option value="${examGroup.examGroupId}">${examGroup.examName}</option>
                                           </c:forEach>
                                       </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Course Name</label>
                                    <div class="col-sm-6">
                                       <select name="courseId" class="col-sm-4">
                                           <c:forEach items="${courseList}" var="course">
                                               <option  class="courseOption_${course.classId}" value="${course.courseId}">${course.courseName}&nbsp;(${clazzMap[course.classId].className})</option>
                                           </c:forEach>
                                       </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"></label>
                                    <div class="col-sm-6">
                                        <button class="btn btn-primary col-sm-4">Update Marks</button>
                                    </div>
                                </div>

                            </form>
            </div>
        </div>
    </div>
    <!--main content end-->
    </tiles:putAttribute>

</tiles:insertDefinition>

