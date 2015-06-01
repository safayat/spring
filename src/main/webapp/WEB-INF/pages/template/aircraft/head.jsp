<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- start: Mobile Specific -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- end: Mobile Specific -->

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<c:set var="appBaseUrl" value="${pageContext.servletContext.contextPath}" scope="application"/>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="${appBaseUrl}/css/neuboard/bootstrap.min.css">
<link rel="stylesheet" href="${appBaseUrl}/css/aircraft/theme.css">
<link rel="stylesheet" href="${appBaseUrl}/css/aircraft/premium.css">
<link rel="stylesheet" href="${appBaseUrl}/css/aircraft/css?family=Open+Sans:400,700">
<!-- Fonts  -->
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="${appBaseUrl}/css/datepicker.css">




<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.0/angular.js"></script>
<script src="${appBaseUrl}/js/neuboard/jquery-1.11.1.min.js"></script>
<script src="${appBaseUrl}/js/neuboard/bootstrap.min.js"></script>
<script src="${appBaseUrl}/js/bootstrap-datepicker.js"></script>

<script type="text/javascript">
    $(function() {
        var match = document.cookie.match(new RegExp('color=([^;]+)'));
        if(match) var color = match[1];
        if(color) {
            $('body').removeClass(function (index, css) {
                return (css.match (/\btheme-\S+/g) || []).join(' ')
            })
            $('body').addClass('theme-' + color);
        }

        $('[data-popover="true"]').popover({html: true});

    });
</script>
<style type="text/css">
    #line-chart {
        height:300px;
        width:800px;
        margin: 0px auto;
        margin-top: 1em;
    }
    .navbar-default .navbar-brand, .navbar-default .navbar-brand:hover {
        color: #fff;
    }
</style>

<script type="text/javascript">
    $(function() {
        var uls = $('.sidebar-nav > ul > *').clone();
        uls.addClass('visible-xs');
        $('#main-menu').append(uls.clone());
    });
</script>
