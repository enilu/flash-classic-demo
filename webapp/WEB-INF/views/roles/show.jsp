<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="z" uri="http://taglib.enilu.cn"%>
<z:breadcrumb breadcrumb="${breadcrumb}"/>
<table class="table table-striped table-bordered">
	<tr><td>ID</td><td>${role.id}</td></tr>
	<tr><td>角色名</td><td>${role.name}</td></tr>
	<tr><td>角色描述</td><td>${role.description}</td></tr>
</table>

<div class="row-fluid clearfix">
	<h3 class="pull-left">权限</h3>
	<a class="btn btn-primary pull-right" href="/roles/${role.id}/edit_permissions">修改权限</a>
</div>
<display:table name="role.permissions" id="permission" class="table table-striped table-bordered">
	<display:column property="name" title="权限"/>
	<display:column property="description" title="描述"/>
</display:table>

<a href="<c:url value="/roles/${role.id}/edit"/>" class="btn btn-info">编辑</a>
<a href="<c:url value="/roles/${role.id}"/>" class="btn btn-danger" data-method="DELETE" data-remote="true" data-redirect="<c:url value="/roles"/>">删除</a>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>
