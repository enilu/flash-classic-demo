<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<h3>${sysNotification.title}</h3>
<p>
${sysNotification.content}
</p>
<small>${sysNotification.createTime}</small>
<%--<a href="<c:url value="/system/sys_notifications/${sysNotification.id}/edit"/>" class="btn">编辑</a>--%>
<%--<a href="<c:url value="/system/sys_notifications/${sysNotification.id}"/>" class="btn btn-danger" data-method="DELETE" data-remote="true" data-redirect="<c:url value="/system/sys_notifications"/>">删除</a>--%>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>
