<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@taglib prefix="z" uri="http://taglib.enilu.cn" %>
<z:breadcrumb breadcrumb="${breadcrumb}"/>
<div class="row-fluid">
    <div class="col-md-12">
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#userInfo" role="tab" data-toggle="tab">用户信息</a></li>
            <li role="presentation"><a href="#roleList" role="tab" data-toggle="tab">所属角色</a></li>
        </ul>
    </div>
</div>
<br>

<div class="tab-content">
    <div class="row-fluid tab-pane active" role="tabpanel" id="userInfo">
        <div class="col-md-12">
            <table class="table table-striped table-bordered ">
                <tr>
                    <td>ID</td>
                    <td><z:h value="${user.id}"/></td>
                </tr>
                <tr>
                    <td>名字</td>
                    <td><z:h value="${user.name}"/></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><z:h value="${user.email}"/></td>
                </tr>
            </table>

        </div>
    </div>
    <div class="row-fluid tab-pane" role="tabpanel" id="roleList">
        <div class="col-md-12">

            <display:table name="user.roles" id="role" class="table table-striped table-bordered  ">
                <display:column title="角色">
                   ${role.name}
                </display:column>
                <display:column title="描述" property="description"/>
            </display:table>

        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>
