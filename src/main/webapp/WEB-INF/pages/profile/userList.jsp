<%--
  Created by IntelliJ IDEA.
  User: safayat
  Date: 8/4/14
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="http://getbootstrap.com/favicon.ico">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:include page="/WEB-INF/pages/common/head.jsp"/>
</head>
<body>
<div class="row">
    <div class="col-md-2">
    </div>
    <div class="col-md-8">
        <jsp:include page="/WEB-INF/pages/common/header.jsp"/>
        <div class="col-md-3">
            <jsp:include page="/WEB-INF/pages/common/menu.jsp"/>
        </div>
        <div class="col-md-9">
            body
        </div>
    </div>
    <div class="col-md-2">
    </div>


</div>
</body>

</html>
