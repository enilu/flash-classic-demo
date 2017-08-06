<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h3>系统通知信息</h3>
<table class="table table-striped table-bordered">
	<tr><td>ID</td><td>${sysNotification.id}</td></tr>
	<tr><td>标题</td><td>${sysNotification.title}</td></tr>
	<tr><td>内容</td><td>${sysNotification.content}</td></tr>
	<tr><td>通知时间</td><td>${sysNotification.createTime}</td></tr>
</table>

<a href="<c:url value="/system/sys_notifications/${sysNotification.id}/edit"/>" class="btn">编辑</a>
<a href="<c:url value="/system/sys_notifications/${sysNotification.id}"/>" class="btn btn-danger" data-method="DELETE" data-remote="true" data-redirect="<c:url value="/system/sys_notifications"/>">删除</a>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>
