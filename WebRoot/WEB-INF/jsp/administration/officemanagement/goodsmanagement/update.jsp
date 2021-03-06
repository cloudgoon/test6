<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include  file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
行政办公--办公用品管理--物品管理--修物品管理页面--%>
<div style="width: 700px;margin: 0 auto;">
<form method="post" action="goodsmanagerment/update.do"   onsubmit="return validateSubmitForm(this)">
   		<table class="table table-bordered">
   			<tr>
				<th  style="width:80px">
					物品名称:
				</th>
				<td>
	              <input type="text"  class="easyui-validatebox" required='true' validType="minlength[1]"  name="usingname" value="<c:out value="${bi.usingname}"></c:out>" maxlength="50"    />
				</td>
			</tr>
			 <tr>      
				<th>
             类别:
				</th>
				<td>              
   	     			   <select  name="typeId" sValue="${bi.typeId}" >
				          <my:outOptions type="16"/>
			           </select>
				</td>
			</tr>
			 <tr>
				<th>
					规格型号:
				</th>            
				<td>
			    <input type="text"  value="<c:out value="${bi.specificationstype}"></c:out>"   name="specificationstype" maxlength="50"   />
				</td>
			</tr>
			<tr>
				<th>库存量:</th>
				<td>
					<input type="text" name="currentinventory"  class="easyui-numberbox"  required="true" value="<c:out value="${bi.currentinventory}"/>"/>
				</td>
			</tr>
			 <tr>
				<th> 
					单位:
				</th>
				<td>
				<input type="text" name="danwei" value="<c:out value="${bi.danwei}"></c:out>"  maxlength="50"  />
				</td>
			</tr>
			 <tr>
				<th>
					备注:
				</th>
				<td>
					<textarea name="remark" rows="2"  style="width: 95%">${bi.remark}</textarea>
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<div  style="margin-top: 10px;margin-bottom: 10px; ">
						  <button type="submit" class="btn btn-primary" >修改</button>&nbsp;&nbsp;&nbsp;&nbsp;
						  <button type="button" class="btn clear" >清空</button>
					</div>
				</td>
			</tr>
			<input type="hidden" name="currentinventory" value="${bi.currentinventory }"/>
			<input type="hidden" name="id" value="${bi.id }"/>
			<input type="hidden" name="datagridId" value="${param.rel }_datagrid" />	
  			<input type="hidden" name="currentCallback" value="close" />
	</table>		
  </form>
</div>