<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib prefix="z" uri="http://taglib.enilu.cn"%>
<z:breadcrumb breadcrumb="${breadcrumb}"/>

<div class="row-fluid">
    <form action="/users/${user.id}/save_roles" method="POST" class="form-horizontal">
        <display:table name="allRoles" id="role" class="table table-striped table-bordered">
            <display:column title="">
                <input type="checkbox" name="roleIds" value="${role.id}"
                       <c:if test="${userRoleIds.contains(role.id)}">checked</c:if>/>
            </display:column>
            <display:column property="name" title="权限名"/>
            <display:column property="description" title="描述"/>
        </display:table>
        <button type="submit" class="btn  btn-primary">保存</button>
    </form>
</div>

<jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>
