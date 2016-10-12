<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="span2">
    <div class="sidebar-nav">
        <div class="well" style="padding: 8px 0;">
            <ul class="nav nav-list">
                <li><i class="icon-home"></i>管理系统</li>

                <c:forEach items="${menus.getFilteredMenus(userContext.getPermissions())}" var="menu">
                    <li class="nav-header">${menu.name}</li>
                    <c:forEach items="${menu.getFilteredItems(userContext.getPermissions())}" var="item">
                        <li><a href="${item.link}"><i class="${item.icon}"></i><span class="hidden-tablet"> ${item.name}</span></a></li>
                    </c:forEach>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>