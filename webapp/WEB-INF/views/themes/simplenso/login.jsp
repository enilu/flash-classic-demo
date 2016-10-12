<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${title}</title>
    <link href="/themes/simplenso/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/assets/jquery.uniform/themes/default/css/uniform.default.css" rel="stylesheet">
    <link href="/themes/simplenso/css/themes/default.css" rel="stylesheet">
    <link href="/themes/simplenso/css/simplenso.css" rel="stylesheet">
    <link href="/assets/app/application.css" rel="stylesheet">
    
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
<body>
<!-- Main Content Area | Side Nav | Content -->
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span3">&nbsp;</div>
        <div class="span6">
            <div class="page-header">
                <h1>DEMO</h1>
            </div>
            <div class="box" style="margin-bottom:500px;">
                <h4 class="box-header round-top">登录</h4>
                <div class="box-container-toggle">
                    <div class="box-content">
                        <c:if test="${message != null}">
                            <div class="validation-error">${message}</div>
                        </c:if>
                        <form:form class="well login-form basic-form form-horizontal" action="/sessions/new" method="post" modelAttribute="loginForm">
                            <div class="control-group">
                                <label class="control-label" for="name">用户名</label>
                                <div class="controls">
                                    <form:input path="name" class="required" placeholder="用户名" />
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="name">密码</label>
                                <div class="controls">
                                    <form:password path="password" class="required" placeholder="密码" />
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls">
                                    <button type="submit" class="btn">登录</button>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
            <!--/span-->
            <div class="span3">&nbsp;</div>
        </div>
        <!--/span-->
    </div>
    <!--/row-->

    <footer>
        <p class="pull-right">&copy; DEMO </p>
    </footer>
</div>
<!--/.fluid-container-->
</body>
</html>
