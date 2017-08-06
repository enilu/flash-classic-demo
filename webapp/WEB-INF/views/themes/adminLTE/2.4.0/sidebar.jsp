<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Left side column. contains the logo and sidebar -->
<div class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <div class="sidebar">
        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <%--<li class="header"><h5><i class="fa fa-home"></i> <b>后台管理</b></h5></li>--%>
            <c:forEach items="${menus.getFilteredMenus(userContext.getPermissions())}" var="menu">

                <li class="treeview">
                    <a href="#">
                        <%--<i class="glyphicon glyphicon-list-alt"></i>--%>
                        <span>${menu.name}</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <c:forEach items="${menu.getFilteredItems(userContext.getPermissions())}" var="item">
                            <li>
                                <a href="${item.link}">
                                    <i class="${item.icon}"></i>
                                    <span> ${item.name}</span>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </li>
            </c:forEach>
        </ul>
        <!-- /.sidebar-menu -->
    </div>
</div>

<!-- 设置菜单选中样式 -->
<script>
    $(function() {
        var path = window.location.pathname;
        var $matchedHref = null;

        $(".sidebar .sidebar-menu .treeview-menu > li a").each(function() {
            var $a = $(this);
            var href = $a.attr("href");
            if (path.indexOf(href) == 0) {
                if ($matchedHref && $matchedHref.attr("href").length >= href.length) {
                    return;
                }
                $matchedHref = $a;
            }
        });
        if(!$matchedHref){
            $(".sidebar .sidebar-menu > li a").each(function() {
                var $a = $(this);
                var href = $a.attr("href");
                if (path.indexOf(href) == 0) {
                    if ($matchedHref && $matchedHref.attr("href").length >= href.length) {
                        return;
                    }
                    $matchedHref = $a;
                }
            });
        }

        if ($matchedHref) {
            $(".sidebar .sidebar-menu .treeview").removeClass("active");
            $(".sidebar .sidebar-menu .treeview-menu > li").removeClass("active");
            $(".sidebar .sidebar-menu > li").removeClass("active");
            $matchedHref.closest("li").addClass("active");
            var treeviewLi = $matchedHref.closest(".treeview");
            if(treeviewLi){
                treeviewLi.addClass("active");
            }
        }
    });
</script>
