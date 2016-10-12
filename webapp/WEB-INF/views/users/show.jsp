<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="z" uri="http://taglib.enilu.cn"%>
<z:breadcrumb breadcrumb="${breadcrumb}"/>
<table class="table table-striped table-bordered">
	<tr><td>ID</td><td><z:h value="${user.id}"/></td></tr>
	<tr><td>名字</td><td><z:h value="${user.name}"/></td></tr>
	<tr><td>Email</td><td><z:h value="${user.email}"/></td></tr>
</table>

<div class="row-fluid clearfix">
	<h3 class="pull-left">角色</h3>
	<a class="btn btn-primary pull-right" href="/users/${user.id}/edit_roles">修改角色</a>
</div>
<display:table name="user.roles" id="role" class="table table-striped table-bordered">
	<display:column title="角色">
		<a href="/roles/${role.id}">${role.name}</a>
	</display:column>
	<display:column title="描述" property="description" />
</display:table>

<a href="<c:url value="/users/${user.id}/edit"/>" class="btn">编辑</a>
<a href="<c:url value="/users/${user.id}/reset_password"/>" class="btn btn-primary">重置密码</a>
<a href="<c:url value="/users/${user.id}"/>" class="btn btn-danger" data-method="DELETE" data-remote="true" data-redirect="<c:url value="/users/"/>">删除</a>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>
