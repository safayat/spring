<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="sidebar-nav">
    <ul>
        <li><a href="${appBaseUrl}/private/dashboard.web" class="nav-header"><i class="fa fa-dashboard"></i> Dashboard</a></li>
        <c:forEach items="${menuTree}" var="menu">
            <c:if test="${menu.parentId == -1}">
                <li><a href="#" data-target=".menu_${menu.menuId}" class="nav-header" data-toggle="collapse"><i class="${menuIconMap[menu.menuId]}"></i> ${menu.menuName}<i class="fa fa-collapse"></i></a></li>

                <li>
                    <ul class="menu_${menu.menuId} nav nav-list collapse">
                        <c:if test="${menu.menuId == 13}">
                            <c:forEach items="${currentClazzMap}" var="item">
                                <li>
                                    <a href="${appBaseUrl}/private/classDetail.web?classId=${item.key}" title="${item.value}">
                                        <span class="fa fa-caret-right"></span>${item.value}
                                    </a>
                                </li>
                            </c:forEach>
                        </c:if>
                        <c:forEach items="${menu.childMenuList}" var="child">
                            <li>
                                <a href="${appBaseUrl}/${child.menuPath}" title="${child.menuName}">
                                    <span class="fa fa-caret-right"></span>${child.menuName}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </li>
            </c:if>
        </c:forEach>
        <li>
            <a class="nav-header" href="${appBaseUrl}/private/history.web">
                <i class="fa fa-picture-o"></i> History
            </a>
        </li>
        <li>
            <a class="nav-header" href="${appBaseUrl}/private/gallery.web">
                <i class="fa fa-picture-o"></i> Galery
            </a>
        </li>
        <li>
            <a class="nav-header" href="${appBaseUrl}/downloads.web">
                <i class="fa fa-download"></i> Downloads
            </a>
        </li>

        <li><a href="#" data-target=".menu_admission" class="nav-header" data-toggle="collapse"><i class="fa fa-plus"></i>Admission<i class="fa fa-collapse"></i></a></li>
        <li>
            <ul class="menu_admission nav nav-list collapse">
                <li>
                    <a href="${appBaseUrl}/admission.web" >
                        <span class="fa fa-caret-right"></span> Admission Notice
                    </a>
                </li>
                <li>
                    <a href="${appBaseUrl}/addmissionForm.web" >
                        <span class="fa fa-caret-right"></span> Apply Online
                    </a>
                </li>
                <li>
                    <a href="${appBaseUrl}/viewAddmissionApplications.web" >
                        <span class="fa fa-caret-right"></span>  View Applications
                    </a>
                </li>

            </ul>
        </li>
        <li>
            <a class="nav-header" href="${appBaseUrl}/private/noticeBoard.web">
                <i class="fa fa-newspaper-o"></i> Notices
            </a>
        </li>


    </ul>
</div>

