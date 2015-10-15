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
			height:500,
			url : "${ctx}/applyController/getTeacherApplyList?Date="
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
						width:'100',
						formatter:function(value, row, index){
							var approve = "<a href='javascript:void(0)' style='color:2883bd; ' onclick='editApply("
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
						width : '65'
					},
					
				
					{
						field : 'internalStaffResult',
						title : '国际处工作人员',
						align : 'center',
						formatter : formatResult,
						styler : cellStyler,
						width : '95'
					},
					{
						field : 'internalChiefResult',
						title : '国际处长',
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
						title : '撤销',
						align : 'center',
						width : '70',
						formatter : function(value, row, index) {
	
							var approve = "<a href='javascript:void(0)' style='color:2883bd; text-decoration:none;' onclick='undo("
									+ index + ")'>撤销申请</a>";
	
							return approve;
	
						}
					},
	
			] ],
	
			onLoadError : function() {
				$.messager.alert('提示信息', '数据加载失败', 'error');
			},
			
			onLoadSuccess : function(data){
				
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

		} else if (value == 0){
		
			return 'background-color:red;color:white;';
			
		} else {
			return '';
		}

		
	}
	

	
	function formatResult(value, row, index){
	
		if(value == undefined){
			return "未审核";
		}
		if(value == 1){
		
			return "通过";
			
		} else if(value  == 0){
		
			return "未通过";
		} else {
		
			return "未审核";
			
		}
	}
	
	function undo(index){
		$.messager.confirm('确认对话框', '您确定要撤销申请吗？', function(yes) {
			if (yes) {
			
				$('#basicGrid_div').datagrid('selectRow', index);// 关键在这里
				var row = $('#basicGrid_div').datagrid('getSelected');
				var orderId = row.orderId;
	
				deleteApply(orderId);
			}
		});
		
		
	}
	
	function deleteApply(orderId){
		var delURL = "${ctx}/applyController/deleteApply?orderId="
			+ orderId + "&date=" + new Date() + "";
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
	
	function editApply(index){
		$('#basicGrid_div').datagrid('selectRow', index);// 关键在这里
		
		var row = $('#basicGrid_div').datagrid('getSelected');
		
		var orderId = row.orderId;
		
		var detailURL = "${ctx}/applyController/editApply?orderId=" + orderId;
		
		parent.addTabs("详情",detailURL);

	}
	
</script>
</head>
<body style="overflow: hidden;">

	<div style="margin:20px 0;"></div>

	<div id="basicGrid_div" ></div>

	<%@include file="../common/shade.jsp"%>
	
	<div id="win" class="easyui-dialog" title="审批意见"
		style="width:400px;height:250px;"
		data-options="modal:true,closed:true">
		
			<input type="hidden" id="orderId">
			
			<input type="hidden" id="staffValue">
			
			<table style="margin-left: 30px; font-size: 9px; margin-top: 20px;" >
				<tr>
					<td>审批意见:</td>
					<td style="padding-left: 15px;"><input  name="description" id="description" class="easyui-textbox" data-options="multiline:true"  style="width: 220px; height: 100px;" readonly="readonly"></td>
					
				</tr>
				
				<tr height="15px;"></tr>
				
				
			</table>
			
			<div style="text-align: center;">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" style="width:80px"
						onclick="enterEdit()">进入修改</a></td>
			</div>
			
			
	</div>

</body>
</html>
