<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${title}</title>
    <link href="/themes/adminLTE/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/themes/adminLTE/adminLTE/2.4.0/css/AdminLTE.css" rel="stylesheet">
    <link href="/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet">


    <link href="/assets/jquery.uniform/themes/default/css/uniform.default.css" rel="stylesheet">
    <link href="/assets/app/application.css" rel="stylesheet">
    <style type="text/css">
        .login-page{background-image: url(/assets/app/images/welcome.jpg);}
        .login-box{background: url(/assets/app/images/login/bg-white-lock.png) repeat;}
        .login-logo{margin-bottom: 0px;}
        .login-box-body{padding-top: 0px;}
    </style>
    <!--[if lt IE 9]><script src="/assets/html5shiv/html5shiv.js"></script><![endif]-->
    <script src="/assets/jquery/dist/jquery.min.js"></script>
    <script src="/assets/jquery-migrate/jquery-migrate.min.js"></script>
    <script src="/assets/jquery.validation/dist/jquery.validate.js"></script>
    <script src="/assets/jquery.validation/src/localization/messages_zh.js"></script>
    <script src="/assets/jquery.uniform/jquery.uniform.js"></script>

    <script type="text/javascript">
        $(function() {
            $("input:checkbox, input:radio, input:file").not(
                    '[data-no-uniform="true"],#uniform-is-ajax').uniform();
            $("form.login-form").validate({
                errorElement : "span",
                success : function($label) {
                    $label.addClass("valid").text(" ");
                },
                onfocusout : function(element) {
                    $(element).valid();
                }
            });
        });
    </script>
</head>
<body class="login-page">

<div class="login-box">
    <div class="login-logo">
        <b style="color: white">后台管理系统</b>
    </div><!-- /.login-logo -->
    <div class="login-box-body">
        <div class="box-header">
            <%--<h3 class="box-title">登录</h3>--%>
        </div><!-- /.box-header -->
        <div class="box-body">
            <div class="form-group">
                <c:if test="${message != null}">
                    <div class="alert-danger">${message}</div>
                </c:if>
            </div>
            <form:form class="login-form" action="/sessions/new" method="post" modelAttribute="loginForm">
                <div class="control-group has-feedback">
                    <div class="controls">
                        <form:input type="text" path="name" class="required form-control" placeholder="登录名" />
                        <span class="glyphicon glyphicon-user form-control-feedback"></span>
                    </div>
                </div>
                <div class="control-group has-feedback">
                    <div class="controls">
                        <form:password path="password" class="required form-control" placeholder="密码" />
                        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-4">
                        <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
                    </div><!-- /.col -->
                </div>
            </form:form>
        </div>
    </div><!-- /.login-box-body -->
</div><!-- /.login-box -->

</body>
</html>
