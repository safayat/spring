<%--

<jsp:include page="/WEB-INF/pages/common/head.jsp" />
<body class="skin-blue">
    <jsp:include page="/WEB-INF/pages/common/header.jsp" />
    <div class="wrapper row-offcanvas row-offcanvas-left">
        <jsp:include page="/WEB-INF/pages/common/menu.jsp" />
        <aside class="right-side">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>
                    Blank page
                    <small>it all starts here</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li><a href="#">Examples</a></li>
                    <li class="active">Blank page</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">


            </section><!-- /.content -->
        </aside><!-- /.right-side -->
    </div>
</body>--%>


<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="appBaseUrl" value="${pageContext.servletContext.contextPath}"/>
<!-- saved from url=(0099)http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/pages-blank-page.html -->
<html class=" js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths">
<!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>NeuBoard</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <!-- Favicon -->
    <%--<link rel="shortcut icon" href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/assets/img/favicon.ico" type="image/x-icon">--%>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="${appBaseUrl}/css/neuboard/bootstrap.min.css">
    <!-- Fonts  -->
    <%--<link rel="stylesheet" href="${appBaseUrl}/css/neuboard/font-awesome.min.css">--%>
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${appBaseUrl}/css/neuboard/simple-line-icons.css">
    <%--<link rel="stylesheet" href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/assets/css/simple-line-icons.css">--%>
    <!-- Switchery -->
    <link rel="stylesheet" href="${appBaseUrl}/css/neuboard/switchery.min.css">
    <!-- CSS Animate -->
    <link rel="stylesheet" href="${appBaseUrl}/css/neuboard/animate.css">
    <!-- Custom styles for this theme -->
    <link rel="stylesheet" href="${appBaseUrl}/css/neuboard/main.css">
    <!-- Feature detection -->
    <script src="${appBaseUrl}/js/neuboard/modernizr-2.6.2.min.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <!--<script src="assets/js/vendor/html5shiv.js"></script>-->
    <%--<script src="assets/js/vendor/respond.min.js"></script>--%>
    <![endif]-->
</head>

<body class=" pace-done">
<div class="pace  pace-inactive">
    <div class="pace-progress" data-progress-text="100%" data-progress="99" style="width: 100%;">
        <div class="pace-progress-inner"></div>
    </div>
    <div class="pace-activity"></div>
</div>
<section id="main-wrapper" class="theme-default">
<header id="header">
    <!--logo start-->
    <div class="brand">
        <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/index.html" class="logo">
            <i class="glyphicon glyphicon-list"></i>
            <span>NEU</span>BOARD</a>
    </div>
    <!--logo end-->
    <ul class="nav navbar-nav navbar-left">
        <li class="toggle-navigation toggle-left">
            <button class="sidebar-toggle" id="toggle-left">
                <i class="fa fa-bars"></i>
            </button>
        </li>
        <li class="toggle-profile hidden-xs">
            <button type="button" class="btn btn-default" id="toggle-profile">
                <i class="glyphicon glyphicon-user"></i>
            </button>
        </li>
        <li class="hidden-xs">
            <input type="text" class="search" placeholder="Search project...">
            <button type="submit" class="btn btn-sm btn-search"><i class="fa fa-search"></i>
            </button>
        </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
        <li class="dropdown profile hidden-xs">
            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="meta">
                            <span class="avatar">
                                <img src="./NeuBoard_blank_files/profile.jpg" class="img-circle" alt="">
                            </span>
                        <span class="text">Admin</span>
                        <span class="caret"></span>
                        </span>
            </a>
            <ul class="dropdown-menu animated fadeInRight" role="menu">
                <li>
                    <span class="arrow top"></span>
                    <h5>
                        <span>80%</span>
                        <small class="text-muted">Profile complete</small>
                    </h5>
                    <div class="progress progress-xs">
                        <div class="progress-bar progress-bar" style="width: 80%">
                        </div>
                    </div>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="javascript:void(0);">
                                <span class="icon"><i class="fa fa-user"></i>
                                </span>My Account</a>
                </li>
                <li>
                    <a href="javascript:void(0);">
                                <span class="icon"><i class="fa fa-envelope"></i>
                                </span>Messages</a>
                </li>
                <li>
                    <a href="javascript:void(0);">
                                <span class="icon"><i class="fa fa-cog"></i>
                                </span>Settings</a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="javascript:void(0);">
                                <span class="icon"><i class="fa fa-sign-out"></i>
                                </span>Logout</a>
                </li>
            </ul>
        </li>
        <li class="toggle-navigation toggle-right">
            <button class="sidebar-toggle" id="toggle-right">
                <i class="fa fa-indent"></i>
            </button>
        </li>
    </ul>
</header>
<!--sidebar left start-->
<aside class="sidebar sidebar-left">
<div class="sidebar-profile">
    <div class="avatar">
        <img class="img-circle profile-image" src="./NeuBoard_blank_files/profile.jpg" alt="profile">
        <i class="on border-dark animated bounceIn"></i>
    </div>
    <div class="profile-body dropdown">
        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><h4>Mike
            Adams <span class="caret"></span></h4></a>
        <small class="title">Front-end Developer</small>
        <ul class="dropdown-menu animated fadeInRight" role="menu">
            <li class="profile-progress">
                <h5>
                    <span>80%</span>
                    <small>Profile complete</small>
                </h5>
                <div class="progress progress-xs">
                    <div class="progress-bar progress-bar-primary" style="width: 80%">
                    </div>
                </div>
            </li>
            <li class="divider"></li>
            <li>
                <a href="javascript:void(0);">
                                <span class="icon"><i class="fa fa-user"></i>
                                </span>My Account</a>
            </li>
            <li>
                <a href="javascript:void(0);">
                                <span class="icon"><i class="fa fa-envelope"></i>
                                </span>Messages</a>
            </li>
            <li>
                <a href="javascript:void(0);">
                                <span class="icon"><i class="fa fa-cog"></i>
                                </span>Settings</a>
            </li>
            <li class="divider"></li>
            <li>
                <a href="javascript:void(0);">
                                <span class="icon"><i class="fa fa-sign-out"></i>
                                </span>Logout</a>
            </li>
        </ul>
    </div>
</div>
<nav>
<h5 class="sidebar-header">Navigation</h5>
<ul class="nav nav-pills nav-stacked">
<li>
    <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/index.html"
       title="Dashboard">
        <i class="fa  fa-fw fa-tachometer"></i> Dashboard
    </a>
</li>
<li class="nav-dropdown">
    <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/pages-blank-page.html#"
       title="UI Elements"><span></span>
        <i class="fa  fa-fw fa-cogs"></i> UI Elements
    </a>
    <ul class="nav-sub" data-index="0" style="display: none;">
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/ui-buttons.html"
               title="Buttons">
                Buttons
            </a>
        </li>
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/ui-sliders-progress.html"
               title="Sliders &amp; Progress">
                Sliders &amp; Progress
            </a>
        </li>
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/ui-modals-popus.html"
               title="Modals &amp; Popups">
                Modals &amp; Popups
            </a>
        </li>
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/ui-tabs-accordions.html"
               title="Tabs &amp; Accordions">
                Tabs &amp; Accordions
            </a>
        </li>

        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/ui-alerts-notifications.html"
               title="Alerts &amp; Notifications">
                Alerts &amp; Notifications
            </a>
        </li>
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/ui-nestable-lists.html"
               title=" Nestable Lists">
                Nestable Lists
            </a>
        </li>
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/ui-panels.html"
               title="Panels">
                Panels
            </a>
        </li>
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/ui-icons.html"
               title="Icons">
                Icons
            </a>
        </li>
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/ui-typography.html"
               title="Typography">
                Typography
            </a>
        </li>
    </ul>
</li>
<li class="nav-dropdown">
    <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/pages-blank-page.html#"
       title="Forms"><span></span>
        <i class="fa  fa-fw fa-edit"></i> Forms
    </a>
    <ul class="nav-sub" data-index="1" style="display: none;">
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/forms-components.html"
               title="Components">Components</a>
        </li>
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/forms-validation.html"
               title="Validation">Validation</a>
        </li>
        <li><a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/forms-mask.html"
               title="Mask">Mask</a>
        </li>
        <li><a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/forms-wizard.html"
               title="Wizard">Wizard</a>
        </li>
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/forms-multiple-file.html"
               title="Multiple File Upload">Multiple File Upload</a>
        </li>
        <li><a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/forms-wysiwyg.html"
               title="WYSIWYG Editor">WYSIWYG Editor</a>
        </li>
    </ul>
</li>
<li class="nav-dropdown">
    <a href="#" title="Tables"><span></span>
        <i class="fa  fa-fw fa-th-list"></i> Tables
    </a>
    <ul class="nav-sub" data-index="2" style="display: none;">
        <li>
            <a href="" title="Basic Tables">
                Basic Tables
            </a>
        </li>
        <li>
            <a href="" title="Data Tables">
                Data Tables
            </a>
        </li>
    </ul>
</li>
<li class="nav-dropdown">
    <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/pages-blank-page.html#"
       title="Charts"><span></span>
        <i class="fa  fa-fw fa-bar-chart-o"></i> Charts
    </a>
    <ul class="nav-sub" data-index="3" style="display: none;">
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/charts-chartjs.html"
               title="Chartjs">
                Chartjs
            </a>
        </li>
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/charts-c3.html"
               title="C3 Charts">
                C3 Charts
            </a>
        </li>
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/charts-morris.html"
               title="Morris.js Charts">
                Morris.js Charts
            </a>
        </li>
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/charts-sparkline.html"
               title="Sparkline Charts">
                Sparkline Charts
            </a>
        </li>
    </ul>
</li>
<li class="nav-dropdown">
    <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/pages-blank-page.html#"
       title="Mail"><span></span>
        <i class="fa fa-fw fa-envelope-o"></i> Mail
        <span class="label label-primary label-circle pull-right">8</span>
    </a>
    <ul class="nav-sub" data-index="4" style="display: none;">
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/mail-inbox.html"
               title="Mail Inbox">
                Inbox
            </a>
        </li>
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/mail-compose.html"
               title="Mail Compose">
                Compose Mail
            </a>
        </li>
    </ul>
</li>
<li class="nav-dropdown">
    <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/pages-blank-page.html#"
       title="Maps"><span></span>
        <i class="fa  fa-fw fa-map-marker"></i> Maps
    </a>
    <ul class="nav-sub" data-index="5" style="display: none;">
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/maps-google.html"
               title="Google Maps">
                Google Maps
            </a>
        </li>
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/maps-vector.html"
               title="Vector Maps">
                Vector Maps
            </a>
        </li>
    </ul>
</li>
<li>
    <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/Frontend/" title="Frontend">
        <i class="fa  fa-fw fa-desktop"></i> Front-end Theme
        <span class="pull-right badge badge-danger">new</span>
    </a>
</li>
<li class="nav-dropdown  open active">
    <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/pages-blank-page.html#"
       title="Pages"><span></span>
        <i class="fa  fa-fw fa-file-text"></i> Pages
    </a>
    <ul class="nav-sub" data-index="6" style="display: block;">
        <li class="active">
            <a href="./NeuBoard_blank_files/NeuBoard_blank.html" title="Blank Page">
                Blank Page
            </a>
        </li>

        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/pages-profile.html"
               title="Profile">
                Profile
            </a>
        </li>
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/pages-sign-in.html"
               title="Sign In">
                Sign In
            </a>
        </li>
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/pages-sign-up.html"
               title="Sign Up">
                Sign Up
            </a>
        </li>
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/pages-locked-screen.html"
               title="Locked Screen">
                Locked Screen
            </a>
        </li>
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/pages-404.html"
               title="404 Page">
                404 Page
            </a>
        </li>
        <li>
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/pages-500.html"
               title="500 Page">
                500 Page
            </a>
        </li>
    </ul>
</li>
<li class="nav-dropdown">
    <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/pages-blank-page.html#"
       title="Menu Levels"><span></span>
        <i class="fa  fa-fw fa-folder-open"></i> Menu Levels
    </a>
    <ul class="nav-sub" data-index="7" style="display: none;">
        <li>
            <a href="javascript:;" title="Level 2.1">
                <i class="fa fa-fw fa-file"></i>
                Level 1.1
            </a>
        </li>
        <li>
            <a href="javascript:;" title="Level 2.2">
                <i class="fa fa-fw fa-file"></i>
                Level 1.2
            </a>
        </li>
        <li class="nav-dropdown">
            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/pages-blank-page.html#"
               title="Level 2.3"><span></span>
                <i class="fa fa-fw fa-folder-open"></i>
                Level 1.3
            </a>
            <ul class="nav-sub" data-index="8" style="display: none;">
                <li>
                    <a href="javascript:;" title="Level 3.1">
                        <i class="fa fa-fw fa-file"></i>
                        Level 2.1
                    </a>
                </li>
                <li class="nav-dropdown">
                    <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/pages-blank-page.html#"
                       title="Level 3.2"><span></span>
                        <i class="fa fa-fw fa-folder-open"></i>
                        Level 2.2
                    </a>
                    <ul class="nav-sub" data-index="9" style="display: none;">
                        <li>
                            <a href="javascript:;" title="Level 4.1">
                                <i class="fa fa-fw fa-file"></i>
                                Level 3.1
                            </a>
                        </li>
                        <li class="nav-dropdown">
                            <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/pages-blank-page.html#"
                               title="Level 4.2"><span></span>
                                <i class="fa fa-fw fa-folder-open"></i>
                                Level 3.2
                            </a>
                            <ul class="nav-sub" data-index="10" style="display: none;">
                                <li class="nav-dropdown">
                                    <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/pages-blank-page.html#"
                                       title="Level 5.1"><span></span>
                                        <i class="fa fa-fw fa-folder-open"></i>
                                        Level 4.1
                                    </a>
                                    <ul class="nav-sub" data-index="11" style="display: none;">
                                        <li>
                                            <a href="javascript:;" title="Level 6.1">
                                                <i class="fa fa-fw fa-file"></i>
                                                Level 5.1
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:;" title="Level 6.2">
                                                <i class="fa fa-fw fa-file"></i>
                                                Level 5.2
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="javascript:;" title="Level 5.2">
                                        <i class="fa fa-fw fa-file"></i>
                                        Level 4.2
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;" title="Level 5.3">
                                        <i class="fa fa-fw fa-file"></i>
                                        Level 4.3
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>

            </ul>
        </li>
    </ul>
</li>
<li>
    <a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/animations.html"
       title="CSS Animations">
        <i class="fa  fa-fw fa-magic"></i> CSS Animations
    </a>
</li>
</ul>
</nav>
<h5 class="sidebar-header">Account Settings</h5>

<div class="setting-list">
    <div class="row">
        <div class="col-xs-8">
            <label for="check1" class="control-label">Share your status</label>
        </div>
        <div class="col-xs-4">
            <input type="checkbox" class="js-switch" checked="" id="check1" data-switchery="true"
                   style="display: none;"><span class="switchery switchery-small"
                                                style="border-color: rgb(39, 182, 175); box-shadow: rgb(39, 182, 175) 0px 0px 0px 10px inset; transition: border 0.4s, box-shadow 0.4s, background-color 1.2s; -webkit-transition: border 0.4s, box-shadow 0.4s, background-color 1.2s; background-color: rgb(39, 182, 175);"><small
                style="left: 13px; transition: left 0.2s; -webkit-transition: left 0.2s; background-color: rgb(255, 255, 255);"></small></span>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-8">
            <label for="check2" class="control-label">Push Notifications</label>
        </div>
        <div class="col-xs-4">
            <input type="checkbox" class="js-switch" id="check2" data-switchery="true" style="display: none;"><span
                class="switchery switchery-small"
                style="box-shadow: rgb(179, 184, 195) 0px 0px 0px 0px inset; border-color: rgb(179, 184, 195); transition: border 0.4s, box-shadow 0.4s; -webkit-transition: border 0.4s, box-shadow 0.4s; background-color: rgb(179, 184, 195);"><small
                style="left: 0px; transition: left 0.2s; -webkit-transition: left 0.2s; background-color: rgb(255, 255, 255);"></small></span>
        </div>
    </div>
</div>
</aside>
<!--sidebar left end-->
<!--main content start-->
<section class="main-content-wrapper">
    <div class="pageheader">
        <h1>Blank Page</h1>

        <div class="breadcrumb-wrapper hidden-xs">
            <span class="label">You are here:</span>
            <ol class="breadcrumb">
                <li><a href="http://authenticgoods.co/wrapbootstrap/themes/neuboard-v1.4/HTML_full_version/index.html">Dashboard</a>
                </li>
                <li>Pages</li>
                <li class="active">Blank Page</li>
            </ol>
        </div>
    </div>
    <section id="main-content" class="animated fadeInUp">

    </section>
</section>
<!--main content end-->
</section>
<!--sidebar right start-->
<aside id="sidebar-right">
    <h4 class="sidebar-title">contact List</h4>

    <div id="contact-list-wrapper">
        <div class="heading">
            <ul>
                <li class="new-contact"><a href="javascript:void(0)"><i class="fa fa-plus"></i></a>
                </li>
                <li>
                    <input type="text" class="search" placeholder="Search">
                    <button type="submit" class="btn btn-sm btn-search"><i class="fa fa-search"></i>
                    </button>
                </li>
            </ul>
        </div>
        <div id="contact-list">
            <ul>
                <li>
                    <div class="row">
                        <div class="col-md-3">
                                <span class="avatar">
                        <img src="./NeuBoard_blank_files/avatar3.png" class="img-circle" alt="">
                          <i class="on animated bounceIn"></i>
                        </span>
                        </div>
                        <div class="col-md-9">
                            <div class="name">Ashley Bell</div>
                            <small class="location text-muted"><i class="icon-pointer"></i> Sarasota, FL</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="row">
                        <div class="col-md-3">
                                <span class="avatar">
                        <img src="./NeuBoard_blank_files/avatar1.png" class="img-circle" alt="">
                          <i class="on animated bounceIn"></i>
                        </span>
                        </div>
                        <div class="col-md-9">
                            <div class="name">Brian Johnson</div>
                            <small class="location text-muted"><i class="icon-pointer"></i> San Francisco, CA</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="row">
                        <div class="col-md-3">
                                <span class="avatar">
                        <img src="./NeuBoard_blank_files/avatar2.png" class="img-circle" alt="">
                          <i class="on animated bounceIn"></i>
                        </span>
                        </div>
                        <div class="col-md-9">
                            <div class="name">Chris Jones</div>
                            <small class="location text-muted"><i class="icon-pointer"></i> Brooklyn, NY</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="row">
                        <div class="col-md-3">
                                <span class="avatar">
                        <img src="./NeuBoard_blank_files/avatar4.jpg" class="img-circle" alt="">
                          <i class="on animated bounceIn"></i>
                        </span>
                        </div>
                        <div class="col-md-9">
                            <div class="name">Erica Hill</div>
                            <small class="location text-muted"><i class="icon-pointer"></i> Palo Alto, Ca</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="row">
                        <div class="col-md-3">
                                <span class="avatar">
                        <img src="./NeuBoard_blank_files/avatar5.png" class="img-circle" alt="">
                          <i class="away animated bounceIn"></i>
                        </span>
                        </div>
                        <div class="col-md-9">
                            <div class="name">Greg Smith</div>
                            <small class="location text-muted"><i class="icon-pointer"></i> London, UK</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="row">
                        <div class="col-md-3">
                                <span class="avatar">
                        <img src="./NeuBoard_blank_files/avatar6.png" class="img-circle" alt="">
                          <i class="on animated bounceIn"></i>
                        </span>
                        </div>
                        <div class="col-md-9">
                            <div class="name">Jason Kendall</div>
                            <small class="location text-muted"><i class="icon-pointer"></i> New York, NY</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="row">
                        <div class="col-md-3">
                                <span class="avatar">
                        <img src="./NeuBoard_blank_files/avatar7.png" class="img-circle" alt="">
                          <i class="on animated bounceIn"></i>
                        </span>
                        </div>
                        <div class="col-md-9">
                            <div class="name">Kristen Davis</div>
                            <small class="location text-muted"><i class="icon-pointer"></i> Greenville, SC</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="row">
                        <div class="col-md-3">
                                <span class="avatar">
                        <img src="./NeuBoard_blank_files/avatar8.png" class="img-circle off" alt="">
                          <i class="off animated bounceIn"></i>
                        </span>
                        </div>
                        <div class="col-md-9">
                            <div class="name">Michael Shepard</div>
                            <small class="location text-muted"><i class="icon-pointer"></i> Vancouver, BC</small>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="row">
                        <div class="col-md-3">
                                <span class="avatar">
                        <img src="./NeuBoard_blank_files/avatar9.png" class="img-circle off" alt="">
                          <i class="off animated bounceIn"></i>
                        </span>
                        </div>
                        <div class="col-md-9">
                            <div class="name">Paul Allen</div>
                            <small class="location text-muted"><i class="icon-pointer"></i> Savannah, GA</small>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div id="contact-user">
            <div class="chat-user active"><span><i class="icon-bubble"></i></span></div>
            <div class="email-user"><span><i class="icon-envelope-open"></i></span></div>
            <div class="call-user"><span><i class="icon-call-out"></i></span></div>
        </div>
    </div>
</aside>
<!--sidebar right end-->
<!--Config demo-->
<div id="config" class="config hidden-xs">
    <h4>Settings<a href="javascript:void(0)" class="config-link closed"><i class="icon-settings"></i></a></h4>

    <div class="config-swatch-wrap">
        <div class="row">
            <div class="col-xs-6">
                <ul class="options">
                    <li>
                        <div class="theme-style-wrapper" data-theme="theme-default">
                            <span class="header bg-white"></span>
                            <span class="header bg-white"></span>
                            <span class="nav bg-dark"></span>
                        </div>
                    </li>
                    <li>
                        <div class="theme-style-wrapper" data-theme="theme-dark">
                            <span class="header bg-dark"></span>
                            <span class="header bg-white"></span>
                            <span class="nav bg-dark"></span>
                        </div>
                    </li>
                    <li>
                        <div class="theme-style-wrapper" data-theme="theme-blue">
                            <span class="header bg-info"></span>
                            <span class="header bg-white"></span>
                            <span class="nav bg-dark"></span>
                        </div>
                    </li>
                    <li>
                        <div class="theme-style-wrapper" data-theme="theme-blue-full">
                            <span class="header bg-info"></span>
                            <span class="header bg-info"></span>
                            <span class="nav bg-dark"></span>
                        </div>
                    </li>
                    <li>
                        <div class="theme-style-wrapper" data-theme="theme-grey">
                            <span class="header bg-grey"></span>
                            <span class="header bg-white"></span>
                            <span class="nav bg-dark"></span>
                        </div>
                    </li>
                    <li>
                        <div class="theme-style-wrapper" data-theme="theme-grey-full">
                            <span class="header bg-grey"></span>
                            <span class="header bg-grey"></span>
                            <span class="nav bg-dark"></span>
                        </div>
                    </li>

                </ul>
            </div>
            <div class="col-xs-6">
                <ul class="options">
                    <li>
                        <div class="theme-style-wrapper" data-theme="theme-dark-full">
                            <span class="header bg-dark"></span>
                            <span class="header bg-dark"></span>
                            <span class="nav bg-dark"></span>
                        </div>
                    </li>
                    <li>
                        <div class="theme-style-wrapper" data-theme="theme-green">
                            <span class="header bg-green"></span>
                            <span class="header bg-white"></span>
                            <span class="nav bg-dark"></span>
                        </div>
                    </li>
                    <li>
                        <div class="theme-style-wrapper" data-theme="theme-green-full">
                            <span class="header bg-green"></span>
                            <span class="header bg-green"></span>
                            <span class="nav bg-dark"></span>
                        </div>
                    </li>
                    <li>
                        <div class="theme-style-wrapper" data-theme="theme-red">
                            <span class="header bg-red"></span>
                            <span class="header bg-white"></span>
                            <span class="nav bg-dark"></span>
                        </div>
                    </li>
                    <li>
                        <div class="theme-style-wrapper" data-theme="theme-red-full">
                            <span class="header bg-red"></span>
                            <span class="header bg-red"></span>
                            <span class="nav bg-dark"></span>
                        </div>
                    </li>
                    <li>
                        <div class="theme-style-wrapper" data-theme="theme-dark-blue-full">
                            <span class="header bg-dark-blue"></span>
                            <span class="header bg-dark-blue"></span>
                            <span class="nav bg-dark"></span>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!--/Config demo-->
<!--Global JS-->
<script src="${appBaseUrl}/js/neuboard/jquery-1.11.1.min.js"></script>
<script src="${appBaseUrl}/js/neuboard/bootstrap.min.js"></script>
<script src="${appBaseUrl}/js/neuboardjquery.navgoco.min.js"></script>
<script src="${appBaseUrl}/js/neuboard/switchery.min.js"></script>
<script src="${appBaseUrl}/js/neuboard/pace.min.js"></script>
<script src="${appBaseUrl}/js/neuboard/app.js"></script>

<script>
    $(document).on('click', '.nav-dropdown', function () {
        $('.nav-sub').hide();
        $(this).children('.nav-sub').toggle(500);
        return false;
    });
</script>

</body>
</html>
