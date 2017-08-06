<jsp:include page="/WEB-INF/views/system/layouts/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<h3>编辑系统通知</h3>
<form:form action="/system/sys_notifications/${sysNotification.id}" method="POST" validate="true"
	modelAttribute="sysNotification" cssClass="basic-form form-horizontal">
	<input type="hidden" name="_method" value="PUT" />
	<div class="control-group">
		<label class="control-label" for="title">标题</label>
		<div class="controls">
			<form:input path="title" class="" placeholder="标题" />
			<form:errors path="title" cssClass="validation-error" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="content">内容</label>
		<div class="controls">
			<form:input path="content" class="" placeholder="内容" />
			<form:errors path="content" cssClass="validation-error" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="createTime">通知时间</label>
		<div class="controls">
			<form:input path="createTime" class="" placeholder="通知时间" />
			<form:errors path="createTime" cssClass="validation-error" />
		</div>
	</div>
	<div class="control-group">
		<div class="controls">
			<button type="submit" class="btn">提交</button>
		</div>
	</div>
</form:form>
<jsp:include page="/WEB-INF/views/system/layouts/footer.jsp" />
