<jsp:include page="/WEB-INF/views/layouts/header.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib prefix="z" uri="http://taglib.enilu.cn"%>
<%@taglib  uri="http://www.joda.org/joda/time/tags" prefix="joda"%>

<z:breadcrumb breadcrumb="${breadcrumb}"/>
<div class="row-fluid">
<form:form action="/logss" method="GET"
	modelAttribute="qf" cssClass="basic-form form-horizontal">
	<div class="row">
		<div class="col-md-6">
	<div class="control-group">
		<label class="control-label" for="operator">操作人</label>
		<div class="controls">
			<input type="text" name="operator_name" value="${ qf.get("operator_name") }" class="" placeholder="操作人" />
		</div>
	</div>
			</div>
		<div class="col-md-6">
	<div class="control-group">
		<label class="control-label" for="action">操作内容</label>
		<div class="controls">
			<input type="text" name="action" value="${ qf.get("action") }" class="" placeholder="操作内容" />
		</div>
	</div>
			</div>
		</div>
	<div class="control-group">
		<div class="controls">
			<button type="submit" class="btn btn-primary">查询</button>
		</div>
	</div>
</form:form>
</div>
<display:table name="logss.data" id="logs_" class="table table-striped table-bordered">
	<display:column property="id" title="ID" />
	<display:column title="操作内容">
		<a href="/logss/${logs_.id}">${logs_.action}</a>
	</display:column>
	<display:column property="ip" title="IP" />
	<display:column property="operatorName" title="操作人" />
	<display:column  title="操作日期">
		<joda:format value="${logs_.operateTime}" pattern="yyyy-MM-dd hh:mm:ss"/>
	</display:column>
</display:table>
<z:pagination name="logss" />

<jsp:include page="/WEB-INF/views/layouts/footer.jsp"/>
