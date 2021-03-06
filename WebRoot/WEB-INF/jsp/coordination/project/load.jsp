<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/commons/include.inc.jsp" %>
<%--
	模块：项目管理
--%>

<div id="${param.rel}_toolbar" class="search-div">
	<form  onsubmit="return datagridSearch(this,'${param.rel }_datagrid');"  formatFilterData="true">
		<div  class="search-content " >
			<span >
				<label>项目类型：</label>
				<select   name="type"  style="width: 100px;" submitForm="change">
					<option value="">全部类型</option>
					<my:outOptions type="331"/>
				</select>
			</span>
			<span >
				<label>状态：</label>
				<select   name="status"  style="width: 100px;" submitForm="change" fieldType="short">
					<option value="">全部类型</option>
					<option value="0">未开始</option>
					<option value="1">进行中</option>
					<option value="2">暂停</option>
					<option value="3">结束</option>
				</select>
			</span>
			<span>
				<label>名称：</label>
				<input	type="text" name="name" class="span2"  op="like"/>
				&nbsp;<i class="boot_icon-question-sign" selectLike="tooltip"></i>
			</span>
			<span>
				<label>创建时间：</label>
				
					<input type="text"  readonly="readonly" onFocus="WdatePicker()"  name="createTime" class="span2" fieldType="date" op="greaterorequal"/>
					--
					<input type="text"  readonly="readonly" onFocus="WdatePicker()" name="createTime" class="span2" fieldType="date"  op="lessorequal"/>
				
			</span>
			
		</div>
	
		<div class="search-toolbar"  >
			<span style="float:left;">
				<a class="easyui-linkbutton clearDgChecked"  icon="icon-redo"	plain="true"  title="清空所有勾选项" >清空勾选</a>
				
				<shiro:hasPermission name="project:add">
					<a class="easyui-linkbutton"  icon="icon-add"	plain="true"
						href="project/addPage.do?rel=${param.rel }" target="dialog" width="1000" height="450"  rel="${param.rel }_add"  title="添加项目">添加</a>
				</shiro:hasPermission>
				<shiro:hasPermission name="project:update">
					<a class="easyui-linkbutton"  icon="icon-edit"	plain="true" 
						 href="project/updatePage.do?id={id}&rel=${param.rel}" target="dialog"  width="1000" height="450"  rel="${param.rel}_update" warn="请先选择一个项目" title="修改项目">修改</a>
					
				</shiro:hasPermission>
				<shiro:hasPermission name="project:delete">
					<a  class="easyui-linkbutton"  icon="icon-remove"	plain="true"
						href="project/del.do" target="selectedTodo"  title="确定要删除吗?" warn="至少勾选一个项目">批量删除</a>
				</shiro:hasPermission>
				
			</span>
			
			
			<span style="float:right">
				<button class="btn btn-primary btn-small" type="submit">查询</button>&nbsp;
				<button class="btn btn-small clear" type="button" >清空</button>&nbsp;
			</span>
		
		</div>
	</form>
	
</div>

<table id="${param.rel }_datagrid"   toolbar="#${param.rel}_toolbar" ></table>


<script type="text/javascript" >
<!--	
	
	$(function() {
		
		$('#<%=request.getParameter("rel")%>_datagrid').datagrid({
			url : "project/query.do",
			columns : [ [ 
			    {
			    	field:"ck",
			    	title : "勾选",
			    	checkbox:true
			    },
				{
					field : "type",
					title : "项目类型",
					width : 100,
					align:"center"

				},
				{
					field : "importance",
					title : "重要程度",
					width : 100,
					align:"center"

				},
				{
					field : "name",
					title : "名称",
					width : 250,
					align:"center",
					sortable : true,
					formatter: function(value,row,index){
						
						return '<a href="project/show.do?id='+row.id+'&rel=<%=request.getParameter("rel")%>_show" target="navTab"  title="项目详情" rel="<%=request.getParameter("rel")%>_show">'+value+'</a>';
					}

				},
			 	 {
					field : "startTime",
					title : "开始时间",
					width : 150,
					align:"center",
					sortable : true,
					formatter: function(value,row,index){
						
						return new Date(value).format("yyyy-MM-dd HH:mm");
					}
				} 
				,
			 	 {
					field : "endTime",
					title : "结束时间",
					width : 150,
					align:"center",
					sortable : true,
					formatter: function(value,row,index){
						
						return new Date(value).format("yyyy-MM-dd HH:mm");
					}
				},
				
			 	 {
					field : "createTime",
					title : "创建时间",
					width : 150,
					align:"center",
					sortable : true,
					formatter: function(value,row,index){
						
						return new Date(value).format("yyyy-MM-dd HH:mm:ss");
					}
				},
			 	 {
					field : "status",
					title : "状态",
					width : 70,
					align:"center",
					formatter: function(value,row,index){
						if(0==value){
							return '<span class="label">未开始</span>';
						}else if(1==value){
							return '<span class="label label-success">运行中</span>';
						}else if(2==value){
							return '<span class="label label-warning">暂停</span>';
						}else if(3==value){
							return '<span class="label label-important">已结束</span>';
						}
						return "";
					}
				}
			
			] ],
			onDblClickRow:function(rowIndex, rowData){
				MUI.openDialog('修改项目','project/updatePage.do?id='+rowData.id+'&rel=<%=request.getParameter("rel")%>','<%=request.getParameter("rel")%>_update',{width:1000,height:450});
			}
		});
		
	});

//-->		
</script>
