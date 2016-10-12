<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="z" uri="http://taglib.enilu.cn"%>

<z:breadcrumb breadcrumb="${breadcrumb}"/>
<form:form action="/permissions" method="POST" validate="true"
	modelAttribute="permission" cssClass="basic-form form-horizontal">
	<div class="control-group">
		<label class="control-label" for="name">权限标识名</label>
		<div class="controls">
			<form:input path="name" class="required" placeholder="权限标识名" />
			<form:errors path="name" cssClass="validation-error" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="description">权限描述</label>
		<div class="controls">
			<form:input path="description" class="" placeholder="权限描述" />
			<form:errors path="description" cssClass="validation-error" />
		</div>
	</div>
	<div class="control-group">
		<div class="controls">
			<button type="submit" class="btn">提交</button>
		</div>
	</div>
</form:form>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
