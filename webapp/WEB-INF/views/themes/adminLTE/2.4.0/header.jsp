<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>${title}	</title>

	<link href="/themes/adminLTE/adminLTE/2.4.0/css/AdminLTE.css" rel="stylesheet">
	<link href="/themes/adminLTE/adminLTE/2.4.0/css/skins/_all-skins.min.css" rel="stylesheet">
	<link href="/themes/adminLTE/bootstrap/css/bootstrap.css" rel="stylesheet">

	<link href="/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet">

	<link href="/assets/select2/select2.css" rel="stylesheet">
	<link href="/assets/jquery.uniform/themes/default/css/uniform.default.css" rel="stylesheet">
	<link href="/assets/app/application.css" rel="stylesheet">
	<link href="/assets/jquery-ui-bootstrap/css/custom-theme/jquery-ui-1.10.0.custom.css" rel="stylesheet">


	<!--[if lt IE 9]><script src="/assets/html5shiv/dist/html5shiv.js"></script><![endif]-->

	<script src="/assets/jquery/dist/jquery.min.js"></script>
</head>
<body class="skin-blue">
<div class="wrapper">

	<!-- Main Header -->
	<header class="main-header">
		<!-- Logo -->
		<a href="/" class="logo"><b>后台管理系统${title}</b></a>
		<!-- Header Navbar -->
		<nav class="navbar navbar-static-top">
			<!-- Sidebar toggle button-->
			<!-- 显示隐藏左侧菜单-->
			<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
				<span class="sr-only">Toggle navigation</span>
			</a>



			<ul class="nav navbar-nav">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">设置 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/profile">个人信息</a></li>
						<li class="divider"></li>
						<li><a href="#">偏好设置</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">主题 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/theme/simplenso">Simplenso</a></li>
						<li><a href="/theme/adminLTE">AdminLTE</a></li>
					</ul>
				</li>
				<li><a href="/profile">个人信息</a></li>
				<li><a target="_blank" href="https://github.com/enilu/flash-demo/blob/master/README.md">帮助</a></li>
			</ul>


			<form class="navbar-form navbar-left" role="search">
				<div class="input-group">
					<input type="text" id="searchInput" placeholder="Search" id="navbar-search-input" class="form-control">
					<span class="input-group-btn">
					  <button type="button" class="btn btn-info btn-flat" onclick="searchClick();">搜索</button>
					</span>
					<script>
						function searchClick(){
							var searchInput = $("#searchInput").val();
							alert(searchInput);
						}
					</script>
				</div>
			</form>

			<!-- Navbar Right Menu -->
			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">

					<!-- Notifications Menu -->
					<!-- 头部通知显示 -->
					<li class="dropdown notifications-menu">
						<!-- Menu toggle button -->
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-bell-o"></i>
							<span class="label label-warning">3</span>
						</a>
						<ul class="dropdown-menu">
							<li class="header">你有3条通知</li>
							<li>
								<!-- Inner Menu: contains the notifications -->
								<ul class="menu">
									<!-- start notification -->
									<li>
										<a href="#">
											<i class="fa fa-bullhorn text-aqua"></i> 通知1
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa fa-bullhorn text-aqua"></i> 通知2
										</a>
									</li>
									<li>
										<a href="#">
											<i class="fa fa-bullhorn text-aqua"></i> 通知3
										</a>
									</li>
									<!-- end notification -->
								</ul>
							</li>
							<li class="footer"><a href="#">显示全部</a></li>
						</ul>
					</li>

					<!-- Tasks Menu -->
					<!-- 头部任务显示 -->
					<li class="dropdown tasks-menu">
						<!-- Menu Toggle Button -->
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-flag-o"></i>
							<span class="label label-danger">2</span>
						</a>
						<ul class="dropdown-menu">
							<li class="header">你有2条任务进行中</li>
							<li>
								<!-- Inner menu: contains the tasks -->
								<ul class="menu">
									<!-- Task item -->
									<li>
										<a href="#">
											<!-- Task title and progress text -->
											<h3>
												正在查询任务1
												<small class="pull-right">70%</small>
											</h3>
											<!-- The progress bar -->
											<div class="progress xs active">
												<!-- Change the css width attribute to simulate progress -->
												<div class="progress-bar progress-bar-aqua progress-bar-striped" style="width: 70%" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">
													<span class="sr-only">70% Complete</span>
												</div>
											</div>
										</a>
									</li>
									<li>
										<a href="#">
											<!-- Task title and progress text -->
											<h3>
												正在查询任务2
												<small class="pull-right">10%</small>
											</h3>
											<!-- The progress bar -->
											<div class="progress xs active">
												<!-- Change the css width attribute to simulate progress -->
												<div class="progress-bar progress-bar-aqua progress-bar-striped" style="width: 10%" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">
													<span class="sr-only">10% Complete</span>
												</div>
											</div>
										</a>
									</li>
									<!-- end task item -->
								</ul>
							</li>
							<li class="footer">
								<a href="#">显示全部任务</a>
							</li>
						</ul>
					</li>

					<!-- User Account Menu -->
					<!-- 头部用户信息显示 -->
					<li class="dropdown user user-menu">
						<!-- Menu Toggle Button -->
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<!-- The user image in the navbar-->
							<!-- 用户头像 -->
							<%--<img src="" class="user-image" alt="User Image"/>--%>
							<!-- hidden-xs hides the username on small devices so only the image appears. -->
							<i class="glyphicon glyphicon-user"></i>
							<!-- 用户名称 -->
							<span class="hidden-xs">${userContext.user.name}</span>
						</a>
						<ul class="dropdown-menu">
							<!-- The user image in the menu -->
							<li class="user-header" style="height: auto;">
								<!-- 用户头像 -->
								<%--<img src="" class="img-circle" alt="User Image" />--%>
								<a href="/profile"><i class="glyphicon glyphicon-user"></i></a>
								<p>
									<!-- 用户角色信息 -->
									${userContext.user.name}
									<small>2015年3月注册</small>
								</p>
							</li>
							<!-- Menu Body -->
							<li class="user-body">
								<div class="col-xs-4 text-center">
									<a target="_blank" href="https://github.com/enilu/flash-demo/blob/master/README.md">帮助</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="#">快捷操作2</a>
								</div>
								<div class="col-xs-4 text-center">
									<a href="#">快捷操作3</a>
								</div>
							</li>
							<!-- Menu Footer-->
							<li class="user-footer">
								<div class="pull-left">
									<a href="/users/change_password" class="btn btn-default btn-flat">修改密码</a>
								</div>
								<div class="pull-right">
									<a href="/sessions/logout" class="btn btn-default btn-flat">退出</a>
								</div>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>
	</header>

	<jsp:include page="/WEB-INF/views/themes/adminLTE/sidebar.jsp"/>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Main content -->
		<div class="content">
			<%--<div class="box">--%>
				<%--<div class="box-body">--%>
		<c:if test="${message != null}">
		<div class="alert alert-success">
			<button type="button" class="close" data-dismiss="alert">×</button>
				${message}
		</div>
		</c:if>
