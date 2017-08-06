<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="z" uri="http://taglib.enilu.cn"%>
<div class="row-fluid clearfix">
  <div class="pull-left">
    <h3>系统通知查询</h3>
  </div>
  <div class="pull-right">
    <a class="btn btn-primary" href="<c:url value="/system/sys_notifications/new"/>">创建系统通知</a>
  </div>
</div>
<div class="row-fluid">
<form:form action="/system/sys_notifications" method="GET"
	modelAttribute="qf" cssClass="basic-form form-horizontal">
	<div class="control-group">
		<label class="control-label" for="title">标题</label>
		<div class="controls">
			<input type="text" name="title" value="${ qf.get("title") }" class="" placeholder="标题" />
		</div>
	</div>
	<div class="control-group">
		<div class="controls">
			<button type="submit" class="btn">查询</button>
		</div>
	</div>
</form:form>
</div>
<display:table name="sysNotifications.data" id="sysNotification_" class="table table-striped table-bordered">
	<display:column title="ID">
		<a href="/system/sys_notifications/${sysNotification_.id}">${sysNotification_.id}</a>
	</display:column>
	<display:column property="title" title="标题" />
	<display:column property="createTime" title="通知日期" />
	<display:column property="isRead" title="是否已读" />
</display:table>
<z:pagination name="sysNotifications" />

<jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>
