<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="z" uri="http://taglib.enilu.cn"%>

<z:breadcrumb breadcrumb="${breadcrumb}"/>
<table class="table table-striped table-bordered">
	<tr><td>ID</td><td>${logs.id}</td></tr>
	<tr><td>操作人</td><td>${logs.operator}</td></tr>
	<tr><td>操作类型</td><td>${logs.action}</td></tr>
	<tr><td>操作时间</td><td>${logs.operateTime}</td></tr>
</table>

<a href="<c:url value="/logss/${logs.id}/edit"/>" class="btn">编辑</a>
<a href="<c:url value="/logss/${logs.id}"/>" class="btn btn-danger" data-method="DELETE" data-remote="true" data-redirect="<c:url value="/logss"/>">删除</a>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>
