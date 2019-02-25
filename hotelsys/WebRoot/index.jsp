<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright"
	ontent="All Rights Reserved, Copyright (C) 2013, Wuyeguo, Ltd." />
<title>尚学堂汽车出租系统</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/zTree/css/zTreeStyle/zTreeStyle.css"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/wu.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/icon.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/umeditor/third-party/jquery.min.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-1.8.0.min.js"></script> --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/zTree/js/jquery.ztree.core.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/umeditor/themes/default/css/umeditor.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/umeditor/third-party/template.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/umeditor/umeditor.config.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/umeditor/umeditor.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/umeditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
	<div class="easyui-layout" fit=true style="width:100%;">
		<div data-options="region:'north' ,collapsiable:true"
			style="height:20%;width:100%;">
			<div class="easyui-layout" fit=true title="查询条件">
				<div data-options="region:'north' ,collapsiable:true" title=""
					style="height:50%;width:100%;text-align:center">
					<h1>欢迎使用尚学堂酒店管理系统</h1>
				</div>
				<div data-options="region:'center' ,collapsiable:true"
					style="height:50%;width:100%;">
					<form action="javascript:void(0)" id="searchForm"
						style="padding-top:17px;text-align:right">
						<input class="easyui-textbox" label="酒店名称:" labelalign="right" name="name" style="width:20%;height:30px;margin-right:10px">
						<a class="easyui-linkbutton" onclick="dosearch()" href="javascript:void(0)" iconCls="icon-search"
							style="height:30px;margin-left:20px">查询</a>
						<a class="easyui-linkbutton" iconCls="icon-undo" style="height:30px;margin-left:20px"
							href="javascript:$('#searchForm').form('clear')">重置</a>
					</form>
				</div>
			</div>
		</div>
		<div data-options="region:'center',collapsiable:false"
			style="height:80%;width:100%;">
			<table id="noticeDg"></table>
		</div>
	</div>

	<div id="toolbar">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" onclick="addRoom()">添加客房</a>  
		 <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" onclick="deleteRoom()">删除客房</a>
	</div>

	<div id="dia" class="easyui-dialog" closed=true
		style="width:100%:padding:30px">
		<form id="roomform" style="width:450px;padding:20px;">
			<div style="margin-bottom:20px">
				<label class="textbox-label" align="right">房型：</label> 
				<input type="radio" name="type" value="1">标准间
				 <input type="radio" name="type" value="2">豪华间
				 <input type="radio" name="type" value="3">总统套房 
			</div>
			<div style="margin-bottom:20px">
				<label class="textbox-label" align="right">价格：</label>
				 <input tyep="text" name="price" id="price" style=width:200px;height:26px"" onblur="checkPrice()" placeholder="请输入房间价格"/>
				 <span id="msg1"></span>
			</div>
			<div style="margin-bottom:20px">
				<label class="textbox-label" align="right">所属酒店：</label> <select
					id="hotelid" name="hotelid">  
					</select>
			</div>
			<div style="margin-bottom:20px">
				<div class="easyui-textbox" label="描述:" labelalign="right"
					multiline=true style="width:100%;height:50px" name="info"></div>
			</div>
			<div style="text-align:center;padding:5px 0">
				<a class="easyui-linkbutton" iconCls="icon-ok" style=" height:32px"
					href="javascript:void(0)" onclick="saveRoom()"> 提交</a> <a
					class="easyui-linkbutton" iconCls="icon-undo" style=" height:32px"
					href="javascript:$('#dia').dialog('close')"> 取消</a>
			</div>
		</form>
	</div>
	<script type="text/javascript">  
		function checkPrice(){
			var price=$('#price').val();
			if(parseFloat(price)!=price){
				$('#msg1').html('<font color=red>请输入数字</font>');
				return false;
			}else if(price.length>6){
				$('#msg1').html('<font color=red>数值长度不能超过六位</font>');
				return false;
			}else{
				$('#msg1').html('<font color=green>√</font>');
				return true;
			} 
		}
	
		//保存房间
		function saveRoom(){
			if(checkPrice){
				var params=$('#roomform').serialize();  
				$.post('${pageContext.request.contextPath}/room/addRoom.action?'+params,function(json){
					$.messager.show({
						title:'消息',
						msg:json.msg
					});
					$('#roomform').form('clear');  
					$('#dia').dialog('close');
					$('#noticeDg').datagrid('load');
				},'json');
			}
		}
	
		//添加客房 
		function addRoom(){
			$('#msg1').html("");
 			$('#roomform').form('clear');   
			$.post('${pageContext.request.contextPath}/hotel/queryAll.action',function(json){
			 
				var html="";
				for(var i=0;i<json.length;i++){
					html+="<option value="+json[i].id+">"+json[i].name+"</option>";
					
				}
				$('#hotelid').html(html);
				
			},'json');
			$('#dia').dialog({  
			    title: '添加客房',   
			    closed: false,    
			    cache: false,     
			    modal: true
			});
		}
		
		 
		//删除客房
		function deleteRoom(){
			var row=$('#noticeDg').datagrid('getSelected'); 
			if(row){
				$.messager.confirm('警告','确认要删除【'+row.name+'】这个客房吗?',function(r){
					if(r){
						$.post('${pageContext.request.contextPath}/room/deleteRoom.action',{id:row.id},function(result){
 							$.messager.show({
								title:'消息',
								msg:result.msg
							});
 							$('#noticeDg').datagrid('load');
						},'json');
					}
				});
			}else{
				$.messager.show({
					title:'消息',
					msg:'请选中要操作的数据行'
				});
			}
		}
   
		function dosearch(){
			var params=$('#searchForm').serialize(); 
			$('#noticeDg').datagrid({
				url:'${pageContext.request.contextPath}/room/queryAll.action?'+params
			});
		}
		
    	//加载表格数据
    	$(function(){
    		$('#noticeDg').datagrid({
        		url:'${pageContext.request.contextPath}/room/queryAll.action',
        		toolbar:'#toolbar',
        		fitColumns:true,
        		fit:true,
        		pagination:true,
        		singleSelect:true,
        		rownumbers:true,
        		columns:[[    
        		          {field:'id',title:'ID',width:100},    
        		          {field:'name',title:'酒店名称',width:100,align:'center'},    
        		          {field:'type',title:'房型',width:100,align:'center',
        		        	  formatter:function(value,row,index){
        		        	  return value==1?'标准间':value==2?'豪华间':'总统套房';
        		          	}
        		          },   
        		          {field:'price',title:'地址',width:100,align:'center'},    
        		          {field:'mobile',title:'电话',width:100,align:'center'}   
        		      ]]
        	}); 
    		 
    	});
    </script>


</body>
</html>
