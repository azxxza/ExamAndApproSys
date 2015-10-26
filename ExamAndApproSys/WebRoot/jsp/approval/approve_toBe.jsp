<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/jsp/common/meta.jsp"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/easyui_1.4.3/themes/metro-blue/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/easyui_1.4.3/demo/demo.css">
<%@ include file="/jsp/common/easyui.jsp"%>
<script language="javascript">
	/*
	 * 表格初始化
	 */
	function initBasicGrid() {
		jQuery('#basicGrid_div').datagrid({
			view : myview,
			fit:true,
			singleSelect : false,
			loadMsg : '正在加载数据',
			emptyMsg : '没有相关记录',
			striped : true,
			title : '个人申请',
			width : 1000,
			rownumbers:true,
			url : "${ctx}/approvalController/getApprove_toBeJsonList?Date="
					+ new Date() + "",
			columns : [ [
					{
						field : 'orderId',
						hidden:true,
					},
					{
						field : 'workId',
						hidden:false,
					},
				
					{
						field : 'visitNo',
						title : '出访编号',
						align : 'center',
						width:'100'
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
						width : '65'
					},
					
				
					{
						field : 'internalStaffResult',
						title : '预审',
						align : 'center',
						formatter : formatResult,
						styler : cellStyler,
						width : '95'
					},
					{
						field : 'internalChiefResult',
						title : '外事部门',
						align : 'center',
						formatter : formatResult,
						styler : cellStyler,
						width : '65'
					},
					{
						field : 'financeResult',
						title : '财务部门',
						align : 'center',
						formatter : formatResult,
						styler : cellStyler,
						width : '65'
					},
					{
						field : 'fundsSourceResult',
						title : '经费来源部门',
						align : 'center',
						formatter : formatResult,
						styler : cellStyler,
						width : '85'
					},
					{
						field : 'disciplineResult',
						title : '纪监审部门',
						align : 'center',
						formatter : formatResult,
						styler : cellStyler,
						width : '80'
						
					},
					{
						field : 'businessLeaderResult',
						title : '分管业务校领导',
						align : 'center',
						formatter : formatResult,
						styler : cellStyler,
						width : '95'
						
					},
					{
						field : 'internalLeaderResult',
						title : '分管外事校领导',
						align : 'center',
						formatter : formatResult,
						styler : cellStyler,
						width : '95'
					},
					{
						field : 'partySecretaryResult',
						title : '校党委书记',
						align : 'center',
						formatter : formatResult,
						styler : cellStyler,
						width : '80'
					
					},
					{
						field : '_operate',
						title : '本部门意见',
						align : 'center',
						width : '95',
						formatter : function(value, row, index) {

							var approve = "<a href='javascript:void(0)' style='color:2883bd; text-decoration:none;' onclick='approve("
									+ index + ")'>查看详情并审批</a>";

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
	
	function approve(index) {
	
		$('#basicGrid_div').datagrid('selectRow', index);// 关键在这里
		var row = $('#basicGrid_div').datagrid('getSelected');
		var orderId = row.orderId;
		var t_work_id = row.workId;
		alert(t_work_id);
		var detailURL = "${ctx}/approvalController/processDetail?orderId=" + orderId+"&t_work_id="+t_work_id;
		parent.addTabs("详情",detailURL);

	}
	
	function cellStyler(value, row, index) {
	
		if (value == undefined){
			return '';
		}
	
		if (value == 1) {

			return 'background-color:green;color:white;';

		} 
		
		if (value == 0 || value == 2){
			return 'background-color:red;color:white;';
		}
		else {
			return '';
		}

		
	}

	function formatResult(value, row, index){
	
		if(value == undefined){
			return "未审核";
		} 
		
		if(value == 1){
			
			return "通过";
		}
		
		if(value == 0  || value == 2){
			return "不通过";
		}else {
			return "";
		}
	}
	
	function editApproval(taskKey,index){
		$('#basicGrid_div').datagrid('selectRow', index);// 关键在这里
		var row = $('#basicGrid_div').datagrid('getSelected');
		var orderId = row.orderId; 
		var detailURL = "${ctx}/approvalController/editApprove?orderId=" + orderId + "&taskKey=" + taskKey;
		parent.addTabs("审批详情",detailURL);
		

	}
	
	
</script>
</head>
<body style="overflow: hidden;">

	<div style="margin: 20px 0px;"></div>

	<div id="basicGrid_div" style="margin-left: 40px;"></div>

	<%@include file="../common/shade.jsp"%>
	
</body>
</html>
