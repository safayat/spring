<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<tiles:insertDefinition name="aircraftTemplate">
    <tiles:putAttribute name="body">

    <!--main content start-->
    <div class="content">
        <div class="header">
            <h1>Exam Result Paramaters</h1>
        </div>
        <div class="main-content"  >
            <div>
                <form method="get" action="${appBaseUrl}/edu/private/viewExamResult.web" class="form-horizontal">
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
                                    <label class="col-sm-3 control-label">Class Name</label>
                                    <div class="col-sm-6">
                                       <select name="classId" class="col-sm-4">
                                           <c:forEach items="${clazzList}" var="clazz">
                                               <option  value="${clazz.classId}">${clazz.className}</option>
                                           </c:forEach>
                                       </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label"></label>
                                    <div class="col-sm-6">
                                        <button class="btn btn-primary col-sm-4">View Result</button>
                                    </div>
                                </div>

                            </form>
            </div>
        </div>
    </div>
    <!--main content end-->
    </tiles:putAttribute>

</tiles:insertDefinition>

