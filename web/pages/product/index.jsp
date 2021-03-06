<%@page import="com.company.project.model.*" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=Product.TABLE_ALIAS%> 维护</title>
	
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
					<td class="tdLabel"><%=Product.ALIAS_CAT_ID%></td>		
					<td>
						<input value="${query.catId}" id="catId" name="catId" maxlength="19"  class="validate-integer "/>
					</td>
					<td class="tdLabel"><%=Product.ALIAS_PRODUCT_NAME%></td>		
					<td>
						<input value="${query.productName}" id="productName" name="productName" maxlength="64"  class=""/>
					</td>
					<td class="tdLabel"><%=Product.ALIAS_PRODUCT_CODE%></td>		
					<td>
						<input value="${query.productCode}" id="productCode" name="productCode" maxlength="64"  class=""/>
					</td>
					<td class="tdLabel"><%=Product.ALIAS_CEIL_LIMIT%></td>		
					<td>
						<input value="${query.ceilLimit}" id="ceilLimit" name="ceilLimit" maxlength="10"  class="validate-integer max-value-2147483647"/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=Product.ALIAS_LOW_LIMIT%></td>		
					<td>
						<input value="${query.lowLimit}" id="lowLimit" name="lowLimit" maxlength="10"  class="validate-integer max-value-2147483647"/>
					</td>
					<td class="tdLabel"><%=Product.ALIAS_PINY_CODE%></td>		
					<td>
						<input value="${query.pinyCode}" id="pinyCode" name="pinyCode" maxlength="64"  class=""/>
					</td>
					<td class="tdLabel"><%=Product.ALIAS_PRODUCT_SPEC%></td>		
					<td>
						<input value="${query.productSpec}" id="productSpec" name="productSpec" maxlength="64"  class=""/>
					</td>
					<td class="tdLabel"><%=Product.ALIAS_SALE_PRICE%></td>		
					<td>
						<input value="${query.salePrice}" id="salePrice" name="salePrice" maxlength="10"  class="validate-integer "/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=Product.ALIAS_PURCHASE_PRICE%></td>		
					<td>
						<input value="${query.purchasePrice}" id="purchasePrice" name="purchasePrice" maxlength="10"  class="validate-integer "/>
					</td>
					<td class="tdLabel"><%=Product.ALIAS_IS_AVAILABLE%></td>		
					<td>
						<input value="${query.isAvailable}" id="isAvailable" name="isAvailable" maxlength="1"  class=""/>
					</td>
					<td class="tdLabel"><%=Product.ALIAS_IS_SELLABLE%></td>		
					<td>
						<input value="${query.isSellable}" id="isSellable" name="isSellable" maxlength="1"  class=""/>
					</td>
					<td class="tdLabel"><%=Product.ALIAS_IS_NEGATIVE%></td>		
					<td>
						<input value="${query.isNegative}" id="isNegative" name="isNegative" maxlength="1"  class=""/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=Product.ALIAS_IS_PURCHASABLE%></td>		
					<td>
						<input value="${query.isPurchasable}" id="isPurchasable" name="isPurchasable" maxlength="1"  class=""/>
					</td>
					<td class="tdLabel"><%=Product.ALIAS_PRODUCT_IMAGE%></td>		
					<td>
						<input value="${query.productImage}" id="productImage" name="productImage" maxlength="256"  class=""/>
					</td>
					<td class="tdLabel"><%=Product.ALIAS_MANUFACTURER%></td>		
					<td>
						<input value="${query.manufacturer}" id="manufacturer" name="manufacturer" maxlength="256"  class=""/>
					</td>
					<td class="tdLabel"><%=Product.ALIAS_ORGINAL_PLACE%></td>		
					<td>
						<input value="${query.orginalPlace}" id="orginalPlace" name="orginalPlace" maxlength="256"  class=""/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=Product.ALIAS_CTIME%></td>		
					<td>
						<input value="<fmt:formatDate value='${query.ctimeBegin}' pattern='<%=Product.FORMAT_CTIME%>'/>" onclick="WdatePicker({dateFmt:'<%=Product.FORMAT_CTIME%>'})" id="ctimeBegin" name="ctimeBegin"   />
						<input value="<fmt:formatDate value='${query.ctimeEnd}' pattern='<%=Product.FORMAT_CTIME%>'/>" onclick="WdatePicker({dateFmt:'<%=Product.FORMAT_CTIME%>'})" id="ctimeEnd" name="ctimeEnd"   />
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/product'"/>
			<input type="button" class="stdButton" style="width:80px" value="新增" onclick="window.location = '${ctx}/product/new'"/>
			<input type="button" class="stdButton" style="width:80px" value="删除" onclick="doRestBatchDelete('${ctx}/product','items',document.forms.queryForm)"/>
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
				<th sortColumn="cat_id" ><%=Product.ALIAS_CAT_ID%></th>
				<th sortColumn="product_name" ><%=Product.ALIAS_PRODUCT_NAME%></th>
				<th sortColumn="product_code" ><%=Product.ALIAS_PRODUCT_CODE%></th>
				<th sortColumn="ceil_limit" ><%=Product.ALIAS_CEIL_LIMIT%></th>
				<th sortColumn="low_limit" ><%=Product.ALIAS_LOW_LIMIT%></th>
				<th sortColumn="piny_code" ><%=Product.ALIAS_PINY_CODE%></th>
				<th sortColumn="product_spec" ><%=Product.ALIAS_PRODUCT_SPEC%></th>
				<th sortColumn="sale_price" ><%=Product.ALIAS_SALE_PRICE%></th>
				<th sortColumn="purchase_price" ><%=Product.ALIAS_PURCHASE_PRICE%></th>
				<th sortColumn="is_available" ><%=Product.ALIAS_IS_AVAILABLE%></th>
				<th sortColumn="is_sellable" ><%=Product.ALIAS_IS_SELLABLE%></th>
				<th sortColumn="is_negative" ><%=Product.ALIAS_IS_NEGATIVE%></th>
				<th sortColumn="is_purchasable" ><%=Product.ALIAS_IS_PURCHASABLE%></th>
				<th sortColumn="product_image" ><%=Product.ALIAS_PRODUCT_IMAGE%></th>
				<th sortColumn="manufacturer" ><%=Product.ALIAS_MANUFACTURER%></th>
				<th sortColumn="orginal_place" ><%=Product.ALIAS_ORGINAL_PLACE%></th>
				<th sortColumn="cTime" ><%=Product.ALIAS_CTIME%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  
			  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><input type="checkbox" name="items" value="${item.productId}"></td>
				
				<td><c:out value='${item.catId}'/>&nbsp;</td>
				<td><c:out value='${item.productName}'/>&nbsp;</td>
				<td><c:out value='${item.productCode}'/>&nbsp;</td>
				<td><c:out value='${item.ceilLimit}'/>&nbsp;</td>
				<td><c:out value='${item.lowLimit}'/>&nbsp;</td>
				<td><c:out value='${item.pinyCode}'/>&nbsp;</td>
				<td><c:out value='${item.productSpec}'/>&nbsp;</td>
				<td><c:out value='${item.salePrice}'/>&nbsp;</td>
				<td><c:out value='${item.purchasePrice}'/>&nbsp;</td>
				<td><c:out value='${item.isAvailable}'/>&nbsp;</td>
				<td><c:out value='${item.isSellable}'/>&nbsp;</td>
				<td><c:out value='${item.isNegative}'/>&nbsp;</td>
				<td><c:out value='${item.isPurchasable}'/>&nbsp;</td>
				<td><c:out value='${item.productImage}'/>&nbsp;</td>
				<td><c:out value='${item.manufacturer}'/>&nbsp;</td>
				<td><c:out value='${item.orginalPlace}'/>&nbsp;</td>
				<td><c:out value='${item.ctimeString}'/>&nbsp;</td>
				<td>
					<a href="${ctx}/product/${item.productId}">查看</a>&nbsp;&nbsp;
					<a href="${ctx}/product/${item.productId}/edit">修改</a>&nbsp;&nbsp;
					<a href="${ctx}/product/${item.productId}" onclick="doRestDelete(this,'你确认删除?');return false;">删除</a>
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
