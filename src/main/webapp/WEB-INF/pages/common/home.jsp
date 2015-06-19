
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<tiles:insertDefinition name="aircraftTemplate">
    <tiles:putAttribute name="body">
        <div class="content">
            <div class="header">
                Home
            </div>
            <div class="main-content">
                    ${pageContext.request.requestURL}<br/>
                    ${pageContext.request.requestURI}<br/>
            </div>
        </div>


    </tiles:putAttribute>
</tiles:insertDefinition>

