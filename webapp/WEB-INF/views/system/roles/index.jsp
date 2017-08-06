<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="z" uri="http://taglib.enilu.cn"%>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<z:breadcrumb breadcrumb="${breadcrumb}"/>
<div class="row-fluid clearfix">
  <div class="pull-right">
    <a class="btn btn-primary" href="<c:url value="/system/roles/new"/>">创建角色</a>
  </div>
</div>
<div class="row-fluid">
<form:form action="/system/roles" method="GET"
	modelAttribute="qf" cssClass="basic-form form-horizontal">
	<div class="control-group">
		<label class="control-label" for="name">角色名</label>
		<div class="controls">
			<input type="text" name="name" value="${ qf.get("name") }" class="required" placeholder="角色名" />
		</div>
	</div>
	<div class="control-group">
		<div class="controls">
			<button type="submit" class="btn btn-primary">查询</button>
		</div>
	</div>
</form:form>
</div>
<display:table name="roles.data" id="role_" class="table table-striped table-bordered">
	<display:column title="ID">
		${role_.id}
	</display:column>
	<display:column title="角色名">
		<a href="/system/roles/${role_.id}">${role_.name}</a>
	</display:column>
	<display:column property="description" title="描述" />
	<display:column title="创建时间">
		<joda:format value="${role_.createdAt}" pattern="yyyy-MM-dd hh:mm:ss"/>
	</display:column>
</display:table>
<z:pagination name="roles" />

<jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>
