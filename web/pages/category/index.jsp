<%@page import="com.company.project.model.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Category.TABLE_ALIAS%> 维护</title>
	
	<script src="${ctx}/scripts/rest.js" ></script>
	<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
	
	<script type="text/javascript" >
		$(document).ready(function() {
			// 分页需要依赖的初始化动作
			window.simpleTable = new SimpleTable('queryForm',${page.thisPageNumber},${page.pageSize},'${pageRequest.sortColumns}');
		});
	</script>
</rapid:override>

<rapid:override name="content">
	<form id="queryForm" name="queryForm" method="get" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td class="tdLabel"><%=Category.ALIAS_PARENT_ID%></td>		
					<td>
						<input value="${query.parentId}" id="parentId" name="parentId" maxlength="19"  class="validate-integer "/>
					</td>
					<td class="tdLabel"><%=Category.ALIAS_CATE_NAME%></td>		
					<td>
						<input value="${query.cateName}" id="cateName" name="cateName" maxlength="128"  class=""/>
					</td>
					<td class="tdLabel"><%=Category.ALIAS_IS_AVAILABLE%></td>		
					<td>
						<input value="${query.isAvailable}" id="isAvailable" name="isAvailable" maxlength="1"  class=""/>
					</td>
					<td class="tdLabel"><%=Category.ALIAS_CTIME%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.ctimeBegin}' pattern='<%=Category.FORMAT_CTIME%>'/>" onclick="WdatePicker({dateFmt:'<%=Category.FORMAT_CTIME%>'})" id="ctimeBegin" name="ctimeBegin"   />
						<input value="<fmt:formatDate value='${query.ctimeEnd}' pattern='<%=Category.FORMAT_CTIME%>'/>" onclick="WdatePicker({dateFmt:'<%=Category.FORMAT_CTIME%>'})" id="ctimeEnd" name="ctimeEnd"   />
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=Category.ALIAS_ADMIN%></td>		
					<td>
						<input value="${query.admin}" id="admin" name="admin" maxlength="19"  class="validate-integer "/>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/category'"/>
			<input type="button" class="stdButton" style="width:80px" value="新增" onclick="window.location = '${ctx}/category/new'"/>
			<input type="button" class="stdButton" style="width:80px" value="删除" onclick="doRestBatchDelete('${ctx}/category','items',document.forms.queryForm)"/>
		<div>
	
	</div>
	
	<div class="gridTable">
	
		<simpletable:pageToolbar page="${page}">
		显示在这里是为了提示你如何自定义表头,可修改模板删除此行
		</simpletable:pageToolbar>
	
		<table width="100%"  border="0" cellspacing="0" class="gridBody">
		  <thead>
			  
			  <tr>
				<th style="width:1px;"> </th>
				<th style="width:1px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="parent_id" ><%=Category.ALIAS_PARENT_ID%></th>
				<th sortColumn="cate_name" ><%=Category.ALIAS_CATE_NAME%></th>
				<th sortColumn="is_available" ><%=Category.ALIAS_IS_AVAILABLE%></th>
				<th sortColumn="cTime" ><%=Category.ALIAS_CTIME%></th>
				<th sortColumn="admin" ><%=Category.ALIAS_ADMIN%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  
			  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><input type="checkbox" name="items" value="${item.cateId}"></td>
				
				<td><c:out value='${item.parentId}'/>&nbsp;</td>
				<td><c:out value='${item.cateName}'/>&nbsp;</td>
				<td><c:out value='${item.isAvailable}'/>&nbsp;</td>
				<td><c:out value='${item.ctimeString}'/>&nbsp;</td>
				<td><c:out value='${item.admin}'/>&nbsp;</td>
				<td>
					<a href="${ctx}/category/${item.cateId}">查看</a>&nbsp;&nbsp;
					<a href="${ctx}/category/${item.cateId}/edit">修改</a>&nbsp;&nbsp;
					<a href="${ctx}/category/${item.cateId}" onclick="doRestDelete(this,'你确认删除?');return false;">删除</a>
				</td>
			  </tr>
			  
		  	  </c:forEach>
		  </tbody>
		</table>
	
		<simpletable:pageToolbar page="${page}">
		显示在这里是为了提示你如何自定义表头,可修改模板删除此行
		</simpletable:pageToolbar>
		
	</div>
	</form>
</rapid:override>

<%-- jsp模板继承,具体使用请查看: http://code.google.com/p/rapid-framework/wiki/rapid_jsp_extends --%>
<%@ include file="base.jsp" %>
