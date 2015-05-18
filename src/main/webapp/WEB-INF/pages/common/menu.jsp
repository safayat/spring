<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<aside class="sidebar sidebar-left">
    <nav>
        <h5 class="sidebar-header">Navigation</h5>
        <ul class="nav nav-pills nav-stacked">
            <li>
                <a href="${appBaseUrl}/private/dashboard.web" title="Dashboard">
                    <i class="fa fa-fw fa-tachometer"></i> Dashboard
                </a>
            </li>

            <%--<c:set var="menuTree" value="${}" scope="page" />--%>
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
            <a href="${appBaseUrl}/private/gallery.web" title="dashboard">
                <i class="fa fa-picture-o"></i> Galery
            </a>
        </li>
        <li>
            <a href="${appBaseUrl}/private/admission.web" title="dashboard">
                <i class="fa fa-plus"></i> Admission
            </a>
        </li>
        <li>
            <a href="${appBaseUrl}/private/noticeBoard.web" title="dashboard">
                <i class="fa fa-newspaper-o"></i> Notices
            </a>
        </li>
    </ul>
</aside>
