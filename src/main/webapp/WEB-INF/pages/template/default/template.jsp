<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
    <header>
        <tiles:insertAttribute name="head"/>
    </header>
    <body class="theme-default">

        <tiles:insertAttribute name="header"/>
        <tiles:insertAttribute name="menu"/>

        <!--main content start-->
        <tiles:insertAttribute name="body"/>
        <!--main content end-->
        <tiles:insertAttribute name="footer"/>

    </body>
</html>