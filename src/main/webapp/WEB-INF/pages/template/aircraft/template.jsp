<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
    <header>
        <tiles:insertAttribute name="head"/>
        <tiles:insertAttribute name="inlineJs"/>

    </header>
    <body class="theme-1">

        <tiles:insertAttribute name="header"/>
        <tiles:insertAttribute name="menu"/>

        <!--main content start-->
        <tiles:insertAttribute name="body"/>
        <!--main content end-->

    </body>
</html>