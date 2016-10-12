<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<h3>修改密码</h3>
<form:form action="/users/change_password" method="POST" validate="true" modelAttribute="changePasswordForm"
           cssClass="basic-form form-horizontal">
  <input type="hidden" name="_method" value="PUT"/>

  <div class="control-group">
    <label class="control-label" for="oldPassword">原密码</label>

    <div class="controls">
      <form:password path="oldPassword" placeholder="原密码" required="true"/>
      <form:errors path="oldPassword" cssClass="validation-error error"/>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="password">新密码</label>

    <div class="controls">
      <form:password path="password" placeholder="新密码" required="true"/>
      <form:errors path="password" cssClass="validation-error"/>
    </div>
  </div>
  <div class="control-group">
    <label class="control-label" for="confirmPassword">确认新密码</label>

    <div class="controls">
      <form:password path="confirmPassword" placeholder="确认原密码" required="true" confirm="true"
                     data-confirm-for="password"/>
      <form:errors path="confirmPassword" cssClass="validation-error"/>
    </div>
  </div>
  <div class="control-group">
    <div class="controls">
      <button type="submit" class="btn">提交</button>
    </div>
  </div>
</form:form>
<jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>
