<div class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="" href="${appBaseUrl}/private/home.web"><span class="navbar-brand"><span class="fa fa-graduation-cap"></span> School Management</span></a>
    </div>

    <div class="navbar-collapse collapse" style="height: 1px;">
        <ul id="main-menu" class="nav navbar-nav navbar-right">
            <li class="dropdown hidden-xs">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <span class="glyphicon glyphicon-user padding-right-small"
                          style="position:relative;top: 3px;"></span> ${loginInfo.username}
                    <i class="fa fa-caret-down"></i>
                </a>

                <ul class="dropdown-menu">
                    <li><a href="${appBaseUrl}/private/profile.web">Profile</a></li>
                    <li class="divider"></li>
                    <li><a tabindex="-1" href="${appBaseUrl}/j_spring_security_logout">Logout</a></li>
                </ul>
            </li>
        </ul>

    </div>
</div>