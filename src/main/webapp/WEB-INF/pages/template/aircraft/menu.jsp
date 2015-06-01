<%--
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<aside class="sidebar sidebar-left">
    <nav>
        <h5 class="sidebar-header">Navigation</h5>
        <ul class="nav nav-pills nav-stacked">
            <li>
                <a href="${appBaseUrl}/private/dashboard.web" title="dashboard">
                    <i class="fa fa-fw fa-tachometer"></i> Dashboard
                </a>
            </li>

            &lt;%&ndash;<c:set var="menuTree" value="${}" scope="page" />&ndash;%&gt;
            <c:forEach items="${menuTree}" var="menu">
                <c:if test="${menu.parentId == -1}">
                    <li class="nav-dropdown">
                        <a href="#" title="UI Elements"><span></span>
                            <i class="${menuIconMap[menu.menuId]}"></i> ${menu.menuName}
                        </a>
                        <ul class="nav-sub" data-index="0" style="display: none;">
                            <c:if test="${menu.menuId == 13}">
                                <c:forEach items="${currentClazzMap}" var="item">
                                    <li>
                                        <a href="${appBaseUrl}/private/classDetail.web?classId=${item.key}" title="${item.value}">
                                                ${item.value}
                                        </a>
                                    </li>
                                </c:forEach>
                            </c:if>
                            <c:forEach items="${menu.childMenuList}" var="child">
                                <li>
                                    <a href="${appBaseUrl}/${child.menuPath}" title="${child.menuName}">
                                            ${child.menuName}
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                </c:if>
            </c:forEach>

        </ul>
    </nav>
    <h5 class="sidebar-header">Information</h5>
    <ul class="nav nav-pills nav-stacked">
        <li>
            <a href="${appBaseUrl}/private/history.web">
                <i class="fa fa-picture-o"></i> History
            </a>
        </li>
        <li>
            <a href="${appBaseUrl}/private/gallery.web">
                <i class="fa fa-picture-o"></i> Galery
            </a>
        </li>
        <li>
            <a href="${appBaseUrl}/private/admission.web">
                <i class="fa fa-plus"></i> Admission
            </a>
        </li>
        <li>
            <a href="${appBaseUrl}/private/noticeBoard.web">
                <i class="fa fa-newspaper-o"></i> Notices
            </a>
        </li>
        </ul>
</aside>
--%>

<div class="sidebar-nav">
    <ul>
        <li><a href="#" data-target=".dashboard-menu" class="nav-header" data-toggle="collapse"><i class="fa fa-fw fa-dashboard"></i> Dashboard<i class="fa fa-collapse"></i></a></li>
        <li><ul class="dashboard-menu nav nav-list collapse">
            <li><a href="index.html"><span class="fa fa-caret-right"></span> Main</a></li>
            <li ><a href="users.html"><span class="fa fa-caret-right"></span> User List</a></li>
            <li ><a href="user.html"><span class="fa fa-caret-right"></span> User Profile</a></li>
            <li ><a href="media.html"><span class="fa fa-caret-right"></span> Media</a></li>
            <li ><a href="calendar.html"><span class="fa fa-caret-right"></span> Calendar</a></li>
        </ul></li>


        <li><a href="#" data-target=".accounts-menu" class="nav-header collapsed" data-toggle="collapse"><i class="fa fa-fw fa-briefcase"></i> Account <span class="label label-info">+3</span></a></li>
        <li><ul class="accounts-menu nav nav-list collapse">
            <li ><a href="sign-in.html"><span class="fa fa-caret-right"></span> Sign In</a></li>
            <li ><a href="sign-up.html"><span class="fa fa-caret-right"></span> Sign Up</a></li>
            <li ><a href="reset-password.html"><span class="fa fa-caret-right"></span> Reset Password</a></li>
        </ul></li>

        <li><a href="#" data-target=".legal-menu" class="nav-header collapsed" data-toggle="collapse"><i class="fa fa-fw fa-legal"></i> Legal<i class="fa fa-collapse"></i></a></li>
        <li><ul class="legal-menu nav nav-list collapse in">
            <li ><a href="privacy-policy.html"><span class="fa fa-caret-right"></span> Privacy Policy</a></li>
            <li class="active"><a href="terms-and-conditions.html"><span class="fa fa-caret-right"></span> Terms and Conditions</a></li>
        </ul></li>

        <li><a href="help.html" class="nav-header"><i class="fa fa-fw fa-question-circle"></i> Help</a></li>
        <li><a href="faq.html" class="nav-header"><i class="fa fa-fw fa-comment"></i> Faq</a></li>
        <li><a href="http://portnine.com/bootstrap-themes/aircraft" class="nav-header" target="blank"><i class="fa fa-fw fa-heart"></i> Get Premium</a></li>
    </ul>
</div>

