<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="sidebar-nav">
    <ul>
        <li><a href="${appBaseUrl}/private/dashboard.web" class="nav-header"><i class="fa fa-dashboard"></i>
            Dashboard</a></li>
        <c:forEach items="${menuTree}" var="menu">

            <c:if test="${menu.parentId == -1 && not empty loginInfo.permissionMap[menu.menuId]}">
                <c:if test="${empty menu.menuPath}">
                    <li><a href="#" data-target=".menu_${menu.menuId}" class="nav-header" data-toggle="collapse"><i
                            class="${menuIconMap[menu.menuId]}"></i> ${menu.menuName}<i class="fa fa-collapse"></i></a>
                    </li>
                </c:if>
                <c:if test="${ not empty menu.menuPath}">
                    <li><a class="nav-header" href="${appBaseUrl}/${menu.menuPath}"><i
                            class="${menuIconMap[menu.menuId]}"></i>${menu.menuName}</a></li>
                </c:if>
                <li>
                    <ul class="menu_${menu.menuId} nav nav-list collapse">
                        <c:if test="${menu.menuId == 13}">
                            <c:forEach items="${currentClazzMap}" var="item">
                                <li>
                                    <a href="${appBaseUrl}/private/classDetail.web?classId=${item.key}"
                                       title="${item.value}">
                                        <span class="fa fa-caret-right"></span>${item.value}
                                    </a>
                                </li>
                            </c:forEach>
                        </c:if>
                        <c:forEach items="${menu.childMenuList}" var="child">
                            <c:if test="${not empty loginInfo.permissionMap[child.menuId]}">
                                <li>
                                    <a href="${appBaseUrl}/${child.menuPath}" title="${child.menuName}">
                                        <span class="fa fa-caret-right"></span>${child.menuName}
                                    </a>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </li>
            </c:if>
        </c:forEach>
    </ul>
</div>

