<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/jsp/common/meta.jsp"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui_1.4.3/themes/metro-blue/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui_1.4.3/demo/demo.css">
<%@ include file="/jsp/common/easyui.jsp"%>
<script type="text/javascript">
	/*
	 * 表格初始化
	 */
	function initBasicGrid() {
		jQuery('#basicGrid_div').datagrid({
			view : myview,
			singleSelect : true,
			loadMsg : '正在加载数据',
			emptyMsg : '没有相关记录',
			striped : true,
			title : '个人申请',
			width : 1010,
			height:500,
			url : "${ctx}/applyController/getTeacherApprovedList?Date="
					+ new Date() + "",
			columns : [ [
			
					{
						field : 'orderId',
						title:'实例id',
						hidden:true
						
					},
					
					{
						field : 'visitNo',
						title : '出访编号',
						align : 'center',
						width : '100',
						formatter:function(value, row, index){
							var approve = "<a href='javascript:void(0)' style='color:2883bd; ' onclick='enterDetail("
									+ index + ")'>"+value+"</a>";
	
							return approve;
						}
						
					},
					
					{
						field : 'visitSummary',
						title : '摘要',
						align : 'center',
						width : '100'
					},
					
					{
						field : 'unitResult',
						title : '所在单位',
						align : 'center',
						formatter : formatResult,
						styler : cellStyler,
						width : '100'
					},
					
				
					{
						field : 'internalStaffResult',
						title : '国际处工作人员',
						align : 'center',
						formatter : formatResult,
						styler : cellStyler,
						width : '100'
					},
					{
						field : 'internalChiefResult',
						title : '国际处长',
						align : 'center',
						formatter : formatResult,
						styler : cellStyler,
						width : '100'
					},
					{
						field : 'financeResult',
						title : '财务部门',
						align : 'center',
						formatter : formatResult,
						styler : cellStyler,
						width : '100'
					},
					{
						field : 'fundsSourceResult',
						title : '经费来源部门',
						width : 100,
						align : 'center',
						formatter : formatResult,
						styler : cellStyler,
						width : '100'
					},
					{
						field : 'disciplineResult',
						title : '纪监审部门',
						align : 'center',
						formatter : formatResult,
						styler : cellStyler,
						width : '100'
						
					},
					{
						field : 'internalLeaderResult',
						title : '分管外事校领导',
						align : 'center',
						formatter : formatResult,
						styler : cellStyler,
						width : '100'
					},
					{
						field : 'result',
						title : '审批结果',
						align : 'center',
						width : '100',
						formatter : function(value, row, index) {
							var approve  = ''; 
							if(value == 1){
								approve = "<a href='javascript:void(0)'  style='color:green; text-decoration:none;'>通过</a>";
							}else if (value == 0){
								approve = "<a href='javascript:void(0)'  style='color:red; text-decoration:none;'>不通过</a>";
							}
	
							return approve;
	
						}
					},
	
			] ],
	
			onLoadError : function() {
				$.messager.alert('提示信息', '数据加载失败', 'error');
			}
	
		});
						

	}

	/**
	 * 页面加载初始化
	 */
	jQuery(function() {

		initBasicGrid();

	});

	function cellStyler(value, row, index) {
	
		if (value == undefined){
			return '';
		}
	
		if (value == 1) {

			return 'background-color:green;color:white;';

		} else if(value == 0){
		
			return 'background-color:red; color:white';
			
		} else if(value == 2){
		
			return '';
		
		}

		
	}
	

	
	function formatResult(value, row, index){
		
		if(value == undefined){
		
			return "未审核";
		}
		
		if(value == 1){
		
			return "通过";
			
		} else if (value == 0){
		
			return "未通过";
			
		} else {
			return '';
		}
	}
	
	function enterDetail(index){
	
		$('#basicGrid_div').datagrid('selectRow', index);// 关键在这里
		var row = $('#basicGrid_div').datagrid('getSelected');
		var orderId = row.id;
		var editURL = "${ctx}/applyController/editApply?orderId="
			+ orderId + "&date=" + new Date() + "";
		parent.addTabs("详情",editURL);
	
	}
	
	
	
	
</script>
</head>
<body style="overflow: hidden;">

	<div style="margin:20px 0;"></div>

	<div id="basicGrid_div"></div>

	<%@include file="../common/shade.jsp"%>

</body>
</html>
