<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- start: Mobile Specific -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- end: Mobile Specific -->

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<c:set var="appBaseUrl" value="${pageContext.servletContext.contextPath}" scope="application"/>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="${appBaseUrl}/css/neuboard/bootstrap.min.css">
<!-- Fonts  -->
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<%--<link href="${appBaseUrl}/css/neuboard/font-awesome.min.css" rel="stylesheet">--%>

<%--<link rel="stylesheet" href="${appBaseUrl}/css/neuboard/simple-line-icons.css">--%>
<%--<!-- Switchery -->--%>
<%--<link rel="stylesheet" href="${appBaseUrl}/css/neuboard/switchery.min.css">--%>
<%--<!-- CSS Animate -->--%>
<link rel="stylesheet" href="${appBaseUrl}/css/neuboard/animate.css">
<!-- Custom styles for this theme -->
<link rel="stylesheet" href="${appBaseUrl}/css/datepicker.css">
<link rel="stylesheet" href="${appBaseUrl}/css/neuboard/main.css">

<%--<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>--%>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.0/angular.js"></script>

<!-- Feature detection -->
<%--<script src="${appBaseUrl}/js/neuboard/modernizr-2.6.2.min.js"></script>--%>
<script src="${appBaseUrl}/js/neuboard/jquery-1.11.1.min.js"></script>
<script src="${appBaseUrl}/js/neuboard/bootstrap.min.js"></script>
<%--<script src="${appBaseUrl}/js/neuboardjquery.navgoco.min.js"></script>--%>
<%--<script src="${appBaseUrl}/js/neuboard/switchery.min.js"></script>--%>
<%--<script src="${appBaseUrl}/js/neuboard/pace.min.js"></script>--%>
<script src="${appBaseUrl}/js/bootstrap-datepicker.js"></script>
<script src="${appBaseUrl}/js/neuboard/app.js"></script>

<script>
    $(document).on('click', '.nav-dropdown',function(){
        $(this).children('.nav-sub').toggle(500);
    });
</script>