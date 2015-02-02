<%--
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Spring</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Dashboard</a></li>
                <li><a href="#">Settings</a></li>
                <li><a href="${pageContext.request.contextPath}/private/profile.web">Profile</a></li>
                <li><a href="#">Help</a></li>
                <li><a href="${pageContext.request.contextPath}/j_spring_security_logout">Logout</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <input class="form-control" placeholder="Search..." type="text">
            </form>
        </div>
    </div>
</div>--%>


<div class="navbar">
<div class="navbar-inner">
<div class="container-fluid">
<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
</a>
<a class="brand" href="index.html"><span>Metro</span></a>

<!-- start: Header Menu -->
<div class="nav-no-collapse header-nav">
<ul class="nav pull-right">
<li class="dropdown hidden-phone">
    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="halflings-icon white warning-sign"></i>
    </a>
    <ul class="dropdown-menu notifications">
        <li class="dropdown-menu-title">
            <span>You have 11 notifications</span>
            <a href="#refresh"><i class="icon-repeat"></i></a>
        </li>
        <li>
            <a href="#">
                <span class="icon blue"><i class="icon-user"></i></span>
                <span class="message">New user registration</span>
                <span class="time">1 min</span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="icon green"><i class="icon-comment-alt"></i></span>
                <span class="message">New comment</span>
                <span class="time">7 min</span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="icon green"><i class="icon-comment-alt"></i></span>
                <span class="message">New comment</span>
                <span class="time">8 min</span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="icon green"><i class="icon-comment-alt"></i></span>
                <span class="message">New comment</span>
                <span class="time">16 min</span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="icon blue"><i class="icon-user"></i></span>
                <span class="message">New user registration</span>
                <span class="time">36 min</span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="icon yellow"><i class="icon-shopping-cart"></i></span>
                <span class="message">2 items sold</span>
                <span class="time">1 hour</span>
            </a>
        </li>
        <li class="warning">
            <a href="#">
                <span class="icon red"><i class="icon-user"></i></span>
                <span class="message">User deleted account</span>
                <span class="time">2 hour</span>
            </a>
        </li>
        <li class="warning">
            <a href="#">
                <span class="icon red"><i class="icon-shopping-cart"></i></span>
                <span class="message">New comment</span>
                <span class="time">6 hour</span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="icon green"><i class="icon-comment-alt"></i></span>
                <span class="message">New comment</span>
                <span class="time">yesterday</span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="icon blue"><i class="icon-user"></i></span>
                <span class="message">New user registration</span>
                <span class="time">yesterday</span>
            </a>
        </li>
        <li class="dropdown-menu-sub-footer">
            <a>View all notifications</a>
        </li>
    </ul>
</li>
<!-- start: Notifications Dropdown -->
<li class="dropdown hidden-phone">
    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="halflings-icon white tasks"></i>
    </a>
    <ul class="dropdown-menu tasks">
        <li class="dropdown-menu-title">
            <span>You have 17 tasks in progress</span>
            <a href="#refresh"><i class="icon-repeat"></i></a>
        </li>
        <li>
            <a href="#">
										<span class="header">
											<span class="title">iOS Development</span>
											<span class="percent">80%</span>
										</span>

                <div class="taskProgress progressSlim red ui-progressbar ui-widget ui-widget-content ui-corner-all"
                     role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="80">80
                    <div class="ui-progressbar-value ui-widget-header ui-corner-left" style="width: 80%;"></div>
                </div>
            </a>
        </li>
        <li>
            <a href="#">
										<span class="header">
											<span class="title">Android Development</span>
											<span class="percent">47%</span>
										</span>

                <div class="taskProgress progressSlim green ui-progressbar ui-widget ui-widget-content ui-corner-all"
                     role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="47">47
                    <div class="ui-progressbar-value ui-widget-header ui-corner-left" style="width: 47%;"></div>
                </div>
            </a>
        </li>
        <li>
            <a href="#">
										<span class="header">
											<span class="title">ARM Development</span>
											<span class="percent">32%</span>
										</span>

                <div class="taskProgress progressSlim yellow ui-progressbar ui-widget ui-widget-content ui-corner-all"
                     role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="32">32
                    <div class="ui-progressbar-value ui-widget-header ui-corner-left" style="width: 32%;"></div>
                </div>
            </a>
        </li>
        <li>
            <a href="#">
										<span class="header">
											<span class="title">ARM Development</span>
											<span class="percent">63%</span>
										</span>

                <div class="taskProgress progressSlim greenLight ui-progressbar ui-widget ui-widget-content ui-corner-all"
                     role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="63">63
                    <div class="ui-progressbar-value ui-widget-header ui-corner-left" style="width: 63%;"></div>
                </div>
            </a>
        </li>
        <li>
            <a href="#">
										<span class="header">
											<span class="title">ARM Development</span>
											<span class="percent">80%</span>
										</span>

                <div class="taskProgress progressSlim orange ui-progressbar ui-widget ui-widget-content ui-corner-all"
                     role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="80">80
                    <div class="ui-progressbar-value ui-widget-header ui-corner-left" style="width: 80%;"></div>
                </div>
            </a>
        </li>
        <li>
            <a class="dropdown-menu-sub-footer">View all tasks</a>
        </li>
    </ul>
</li>
<!-- end: Notifications Dropdown -->
<!-- start: Message Dropdown -->
<li class="dropdown hidden-phone">
    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="halflings-icon white envelope"></i>
    </a>
    <ul class="dropdown-menu messages">
        <li class="dropdown-menu-title">
            <span>You have 9 messages</span>
            <a href="#refresh"><i class="icon-repeat"></i></a>
        </li>
        <li>
            <a href="#">
                <span class="avatar"><img src="img/avatar.jpg" alt="Avatar"></span>
										<span class="header">
											<span class="from">
										    	Dennis Ji
										     </span>
											<span class="time">
										    	6 min
										    </span>
										</span>
                                        <span class="message">
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                        </span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="avatar"><img src="img/avatar.jpg" alt="Avatar"></span>
										<span class="header">
											<span class="from">
										    	Dennis Ji
										     </span>
											<span class="time">
										    	56 min
										    </span>
										</span>
                                        <span class="message">
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                        </span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="avatar"><img src="img/avatar.jpg" alt="Avatar"></span>
										<span class="header">
											<span class="from">
										    	Dennis Ji
										     </span>
											<span class="time">
										    	3 hours
										    </span>
										</span>
                                        <span class="message">
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                        </span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="avatar"><img src="img/avatar.jpg" alt="Avatar"></span>
										<span class="header">
											<span class="from">
										    	Dennis Ji
										     </span>
											<span class="time">
										    	yesterday
										    </span>
										</span>
                                        <span class="message">
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                        </span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="avatar"><img src="img/avatar.jpg" alt="Avatar"></span>
										<span class="header">
											<span class="from">
										    	Dennis Ji
										     </span>
											<span class="time">
										    	Jul 25, 2012
										    </span>
										</span>
                                        <span class="message">
                                            Lorem ipsum dolor sit amet consectetur adipiscing elit, et al commore
                                        </span>
            </a>
        </li>
        <li>
            <a class="dropdown-menu-sub-footer">View all messages</a>
        </li>
    </ul>
</li>
<!-- end: Message Dropdown -->
<li>
    <a class="btn" href="#">
        <i class="halflings-icon white wrench"></i>
    </a>
</li>
<!-- start: User Dropdown -->
<li class="dropdown">
    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="halflings-icon white user"></i> Dennis Ji
        <span class="caret"></span>
    </a>
    <ul class="dropdown-menu">
        <li class="dropdown-menu-title">
            <span>Account Settings</span>
        </li>
        <li><a href="#"><i class="halflings-icon user"></i> Profile</a></li>
        <li><a href="login.html"><i class="halflings-icon off"></i> Logout</a></li>
    </ul>
</li>
<!-- end: User Dropdown -->
</ul>
</div>
<!-- end: Header Menu -->

</div>
</div>
</div>
