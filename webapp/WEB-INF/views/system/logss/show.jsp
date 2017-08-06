<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="z" uri="http://taglib.enilu.cn"%>

<z:breadcrumb breadcrumb="${breadcrumb}"/>
<table class="table table-striped table-bordered">
	<tr><td>ID</td><td>${logs.id}</td></tr>
	<tr><td>操作人</td><td>${logs.operator}</td></tr>
	<tr><td>操作内容</td><td>${logs.action}</td></tr>
	<tr><td>操作时间</td><td>${logs.operateTime}</td></tr>
</table>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>
