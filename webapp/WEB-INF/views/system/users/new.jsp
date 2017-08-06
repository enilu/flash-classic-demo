<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="z" uri="http://taglib.enilu.cn"%>

<z:breadcrumb breadcrumb="${breadcrumb}"/>
<form:form action="/system/users" method="POST" validate="true"
	modelAttribute="user" cssClass="basic-form form-horizontal">
	<div class="control-group">
		<label class="control-label" for="name">用户名</label>
		<div class="controls">
			<form:input path="name" class="required" placeholder="用户名" />
			<form:errors path="name" cssClass="validation-error" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="email">Email</label>
		<div class="controls">
			<form:input path="email" class="required" placeholder="邮箱" />
			<form:errors path="email" cssClass="validation-error" />
		</div>
	</div>
	<div class="control-group">
		<label class="control-label" for="password">密码</label>
		<div class="controls">
			<form:password path="password" class="required" placeholder="密码" />
			<form:errors path="password" cssClass="validation-error" />
		</div>
	</div>
	<div class="control-group">
		<div class="controls">
			<button type="submit" class="btn  btn-primary">提交</button>
		</div>
	</div>
</form:form>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
