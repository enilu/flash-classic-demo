<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>${title}</title>

	<link href="/themes/simplenso/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="/assets/select2/select2.css" rel="stylesheet">
	<link href="/assets/jquery.uniform/themes/default/css/uniform.default.css" rel="stylesheet">
	<link href="/themes/simplenso/css/themes/default.css" rel="stylesheet">
	<link href="/themes/simplenso/css/simplenso.css" rel="stylesheet">
	<link href="/assets/app/application.css" rel="stylesheet">

	<link href="/assets/jquery-ui-bootstrap/css/custom-theme/jquery-ui-1.10.0.custom.css" rel="stylesheet">

	<!--[if lt IE 9]><script src="/assets/html5shiv/dist/html5shiv.js"></script><![endif]-->
</head>
<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="/">DEMO</a>
				<div class="btn-group pull-right">
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-user"></i> ${currentUser.name}
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="/users/change_password">修改密码</a></li>
						<li><a href="/sessions/logout">退出</a></li>
					</ul>
				</div>
				<div class="nav-collapse">
					<ul class="nav">
						<li class="dropdown">
							<a href="#"
							   class="dropdown-toggle"
							   data-toggle="dropdown">
								设置
								<b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#">个人信息</a></li>
								<li><a href="#">偏好设置</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#"
							   class="dropdown-toggle"
							   data-toggle="dropdown">
								主题
								<b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li><a href="/theme/simplenso">Simplenso</a></li>
								<li><a href="/theme/acme">Acme</a></li>
								<li><a href="/theme/adminLTE">AdminLTE</a></li>

							</ul>
						</li>
						
						<li><a href="#">帮助</a></li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<jsp:include page="/WEB-INF/views/themes/simplenso/sidebar.jsp"/>
			<div id="content" class="span10" style="padding-top: 9px;">
			<c:if test="${message != null}">
			<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert">×</button>
			${message}
			</div>
			</c:if>
