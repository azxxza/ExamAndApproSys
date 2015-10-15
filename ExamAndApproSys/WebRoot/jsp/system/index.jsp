<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/privilege" prefix="privilege"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>教师出国审批系统前台首页</title>
<%@ include file="/jsp/common/meta.jsp"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/easyui_1.4.3/themes/metro-blue/easyui.css">
<%@ include file="/jsp/common/easyui.jsp"%>

<script type="text/javascript">
	$(function() {
		for (var i = 1; i <= 4; i++) {
			$('#ttt_' + i).tree({
				onClick : function(node) {
					var title = node.text;
					var url = node.url;
					if (title == '修改密码') {
						$('#loginDialog').dialog('open');
					} else {
						addTabs(title, url);
					}
				}
			});
		}
	});
	
	/*
	 * 添加选项卡
	 */
	function addTabs(info, url) {
	
		if ($('#main').tabs('exists', info)) {
			$('#main').tabs('select', info);
			
		} else {
			var content1 = "<iframe name='rightFrame' id='rightFrame' frameborder='0' style='width:100%;height:100%;'  src='"
					+ url + "'></iframe>";
			$('#main').tabs('add', {
				title : info,
				content : content1,
				closable : true
			});

			//获取最后一个tabs 在新加的选项卡后面添加"关闭全部"
			var li = $(".tabs-wrap ul li:last-child");
			$("#close").remove();
			li.after("<li id='close'><a class='tabs-inner' href='javascript:void()' onClick='javascript:closeAll()'>关闭全部</a></li>");
		}

	}
	
	/*
	 * 关闭所有选项卡
	 */
	function closeAll() {
		$.messager.confirm('确认对话框', '您确认要关闭所有选项卡？', function(yes) {
			if (yes) {

				$(".tabs li").each(function(index, obj) {
					//获取所有可关闭的选项卡
					var tab = $(".tabs-closable", this).text();
					$(".easyui-tabs").tabs('close', tab);
				});
				$("#close").remove();//同时把此按钮关闭
			}
		});

	}
	
  	function logout(){
		window.location.href = "${ctx}/loginController/logout";
		
       }
        
      function closeTab(title){
		$('#main').tabs('close',title);
	}
        
</script>
<style type="text/css">
	.tree-node{
		padding:5px;
		height: 20px;
		
	}
	
	.panel-header{
		height: 15px;
		padding: 10px;
	}
	
	.panel-title{
		font-size: 15px;
	}

</style>
</head>

<body class="easyui-layout">

<div region="north" style="height:70px; background-image: url('${ctx}/images/light.png');" class="easyui-layout" >
    <div region="west" id="logo" style="width: 600px; padding-left: 30px;background-color: #6ac5f4" border="false"><img src="${ctx}/images/loginlogo.png" style="height: 60px;"></div>
    <div region="center" class="easyui-layout" border="false" style="background-color: #6ac5f4"></div>
    <div region="east" style="width: 180px;background-color: #6ac5f4" border="false">
    	<div style="height: 20px;"></div>
		<a href="javascript:void(0)" class="easyui-linkbutton" plain="true" icon="icon-home" onClick="goHome();" style="margin-right: 20px;color: white;">首页</a>
    	<a href="javascript:void(0)" class="easyui-linkbutton" plain="true" icon="icon-user-go" onclick="logout()" style="margin-right: 20px; color: white;">退出登录</a>
    </div>
</div>

<div region="west" data-options="iconCls:'icon-user',split:false" title="教师出境申报系统菜单" style="width:235px;" >
  <div class="easyui-accordion">
  
  <privilege:show powerName="menu_apply">
  
    <div title="我的申请" style="font-size: 100px;" data-options="iconCls:'icon-add',split:false">
      <ul id="ttt_1">
        <li data-options="iconCls:'icon-add',url:'${ctx}/applyController/newApply'"><span>个人出境申请</span></li>
        <li data-options="iconCls:'icon-edit',url:'${ctx}/applyController/toBeApprove'"><span>待批申请</span></li>
		<li data-options="iconCls:'icon-ok',url:'${ctx}/applyController/approved'"><span>已批申请</span></li>
      </ul>
    </div>
   </privilege:show>
   
   <privilege:show powerName="menu_approval">
   		<div title="审批处理" style="overflow:auto;"  data-options="iconCls:'icon-ok',split:false">
			<ul id="ttt_2">

				<li data-options="iconCls:'icon-edit',url:'${ctx}/approvalController/approve_toBe'"><span>待批申请</span></li>
				<li data-options="iconCls:'icon-ok',url:'${ctx}/approvalController/approve_ed'"><span>已批申请</span></li>

			</ul>
		</div>
		<div title="数据统计汇总" style="overflow:auto;"  data-options="iconCls:'icon-statistics',split:false">
			<ul id="ttt_3">

				<li data-options="iconCls:'icon-search',url:'${ctx}/searchController/search'"><span>数据查询</span></li>
				<li data-options="iconCls:'icon-statistics',url:'${ctx}/reportController/report'"><span>相关报表 </span></li>


			</ul>
		</div>
   </privilege:show>
   
    <div title="帮助及维护"  data-options="iconCls:'icon-help',split:false">
      <ul id="ttt_4">
        <li data-options="iconCls:'icon-key'"><span>修改密码</span></li>
        <li data-options="iconCls:'icon-help',url:'${ctx}/maintenanceController/useHelp'"><span>使用帮助</span></li>
      </ul>
    </div>
  </div>
</div>


<div id="opt_info" border="false" region="center" title="..." >

  <div id="main" class="easyui-tabs"  fit="true" border="false" plain="true">
    <div title="后台首页" style="padding:10px;">
      <iframe  frameborder="0" style="width:100%;height:100%;" src="${ctx}/welcome"></iframe>
    </div>
  </div>
</div>

<div  region="south" style="text-align:center; background-color: #6ac5f4; height: 25px; font-size: 13px;">
<div style="height: 4px;"></div>福建农林大学 国际处 </div>
<div class="easyui-dialog" id="loginDialog" style="width:400px;height:300px;" data-options="title:'修改密码',modal:true,iconCls:'icon-key',closed:true">
	<table style="padding-left: 50px; padding-top: 50px; font-size: 13px;" cellpadding="5px;">
		<tr>
			<td>原始密码:</td>
			<td><input class="easyui-textbox"></td>
		</tr>
		
		<tr>
			<td>新密码:</td>
			<td><input class="easyui-textbox"></td>
		</tr>
		
		<tr>
			<td>确认密码:</td>
			<td><input class="easyui-textbox"></td>
		</tr>
		
	</table>
	
	<table style="text-align: center; padding-left: 80px;" cellpadding="15px;">
		<tr>
			<td><a href="javascript:void(0)" onclick="closeWin()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">保存修改</a></td>
			<td><a href="javascript:void(0)" onclick="closeWin()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">关闭窗口</a></td>
		</tr>
	</table>
</div>
</body>
</html>
