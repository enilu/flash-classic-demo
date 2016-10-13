<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib prefix="z" uri="http://taglib.enilu.cn"%>

<z:breadcrumb breadcrumb="${breadcrumb}"/>
<div class="row-fluid clearfix">
    <div class="pull-right">
        <a class="btn btn-primary" href="<c:url value="/permissions/new"/>">创建权限</a>
    </div>
</div>
<div class="row-fluid">
    <form:form action="/permissions" method="GET"
               modelAttribute="qf" cssClass="basic-form form-horizontal">
        <div class="row">
            <div class="col-md-6">
                <div class="control-group">
                    <label class="control-label" for="name">权限标识名</label>

                    <div class="controls">
                        <input type="text" name="name" value="${ qf.get("name") }" class="required"
                               placeholder="权限标识名"/>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="control-group">
                    <div class="controls">
                        <button type="submit" class="btn btn-primary">查询</button>
                    </div>
                </div>
            </div>
        </div>
    </form:form>
</div>
<display:table name="permissions.data" id="permission_" class="table table-striped table-bordered">

    <display:column property="id" title="id"/>
    <display:column title="权限标识名">
        <a href="/permissions/${permission_.id}">${permission_.name}</a>
    </display:column>
    <display:column property="description" title="备注"/>
    <display:column property="createdAt" title="创建时间"/>
</display:table>
<z:pagination name="permissions"/>

<jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>
