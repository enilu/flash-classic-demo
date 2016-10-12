<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="z" uri="http://taglib.enilu.cn"%>

<z:breadcrumb breadcrumb="${breadcrumb}"/>
<table class="table table-striped table-bordered">
	<tr><td>ID</td><td>${permission.id}</td></tr>
	<tr><td>权限标识名</td><td>${permission.name}</td></tr>
	<tr><td>权限描述</td><td>${permission.description}</td></tr>
</table>

<a href="<c:url value="/permissions/${permission.id}/edit"/>" class="btn btn-default">编辑</a>
<a href="<c:url value="/permissions/${permission.id}"/>" class="btn btn-danger" data-method="DELETE" data-remote="true" data-redirect="<c:url value="/permissions"/>">删除</a>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>
