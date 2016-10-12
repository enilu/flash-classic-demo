<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>${title}</title>

<link id="bootstrap-style"
	href="<c:url value="/stylesheets/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/stylesheets/bootstrap-responsive.min.css"/>"
	rel="stylesheet">
<link id="base-style" href="<c:url value="/stylesheets/style.css"/>"
	rel="stylesheet">
<link id="base-style-responsive"
	href="<c:url value="/stylesheets/style-responsive.css"/>"
	rel="stylesheet">
<link href="<c:url value="/stylesheets/application.css"/>"
	rel="stylesheet">
<style type="text/css">
body {
	background: url(/images/bg-login.jpg) !important;
}
</style>

<script src="<c:url value="/javascripts/jquery-1.9.1.js"/>"></script>
<script src="<c:url value="/javascripts/jquery-migrate-1.0.0.min.js"/>"></script>
<script src="<c:url value="/javascripts/jquery.validate.js"/>"></script>
<script src="<c:url value="/javascripts/jquery.validate.zh.js"/>"></script>
<script src="<c:url value="/javascripts/jquery.uniform.min.js"/>"></script>
<script type="text/javascript">
	$(function() {
		$("input:checkbox, input:radio, input:file").not(
				'[data-no-uniform="true"],#uniform-is-ajax').uniform();
		$("form.login-form").validate({
			errorElement : "span",
			highlight : function(element) {
				$(element).addClass("highlight");
			},
			success : function($label) {
				$label.siblings("input").removeClass("highlight");
			},
			onfocusout : function(element) {
				$(element).valid();
			}
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="row-fluid">
					<div class="login-box">
						<div class="icons">
							<a href="/"><i class="halflings-icon home"></i></a> <a href="#"><i
								class="halflings-icon cog"></i></a>
						</div>
						<h2>登录</h2>
						<c:if test="${message != null}">
							<div class="validation-error">${message}</div>
						</c:if>
						<form:form class="form-horizontal login-form"
							action="/users/login" method="post" validate="true"
							modelAttribute="loginForm">
							<fieldset>
								<div class="input-prepend" title="用户名">
									<span class="add-on"><i class="halflings-icon user"></i></span>
									<input class="input-large span10 required" name="name"
										id="name" type="text" placeholder="用户名" />
								</div>
								<div class="clearfix"></div>

								<div class="input-prepend" title="Password">
									<span class="add-on"><i class="halflings-icon lock"></i></span>
									<input class="input-large span10 required" name="password"
										id="password" type="password" placeholder="密码" />
								</div>
								<div class="clearfix"></div>
								<label class="remember" for="rememberToken"> <input
									type="checkbox" id="rememberToken" name="rememberToken" value="1" />记住我
								</label>

								<div class="button-login">
									<button type="submit" class="btn btn-primary">登录</button>
								</div>
								<div class="clearfix"></div>
							</fieldset>
						</form:form>
						<hr>
						<h3>忘记密码?</h3>
						<p>
							点击<a href="#">这里</a>找回密码.
						</p>
					</div>
					<!--/span-->
				</div>
				<!--/row-->
			</div>
			<!--/fluid-row-->
		</div>
		<!--/.fluid-container-->
	</div>
</body>
</html>