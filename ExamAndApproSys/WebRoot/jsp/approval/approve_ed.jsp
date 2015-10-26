<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ include file="/jsp/common/meta.jsp"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/easyui_1.4.3/themes/metro-blue/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/easyui_1.4.3/demo/demo.css">
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
			fit:true,
			url : "${ctx}/approvalController/getTeacherApprovedList?Date="
					+ new Date() + "",
			columns : [ [
					{
						field : 'orderId',
						hidden:true,
					},
					{
						field : 'visitNo',
						title : '出访编号',
						align : 'center',
					},
					{
						field : 'visitSummary',
						title : '摘要',
						align : 'center',
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
						title : '经费来源',
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
	
		if (value == 1) {

			return 'background-color:green;color:white;';

		} else 

			return 'background-color:white;';

		
	}
	

	
	function formatResult(value, row, index){
		if(value == 1){
			return "通过";
		} else if(value == 2){
			var edit = "<a href='#' style='color:2883bd;text-decoration:none;' onclick='edit("
							+ index + ")'>需要修改</a>";
			return edit;
		} else {
			return "未审核";
		}
	}
	
	function undo(index){
		$.messager.confirm('确认对话框', '您确定要撤销申请吗？', function(yes) {
			if (yes) {
			
				$('#basicGrid_div').datagrid('selectRow', index);// 关键在这里
				var row = $('#basicGrid_div').datagrid('getSelected');
				var id = row.id;
	
				deleteApply(id);
			}
		});
		
		
	}
	
	function deleteApply(id){
		var delURL = "${ctx}/applyController/deleteApply?id="
			+ id + "&date=" + new Date() + "";
		jQuery.get(delURL, function(jsonData) {
	
			var flag = jsonData.flag;
			
			if (flag == true) {
				$.messager.alert('我的消息','撤销申请成功','info',function(){
					jQuery('#basicGrid_div').datagrid("reload");
				});
				
	
			} else {
				var message = jsonData.message;
				$.messager.alert('我的消息',message,'error');
	
			}
		}, "json");
		
	}
</script>
</head>
<body style="overflow: hidden;">

	<div style="margin:20px 0;"></div>

	<div id="basicGrid_div"></div>

	<%@include file="../common/shade.jsp"%>

</body>
</html>
