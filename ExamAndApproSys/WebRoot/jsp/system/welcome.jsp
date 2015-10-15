<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>后台管理系统</title>
<%@ include file="/jsp/common/meta.jsp"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/css/welcome.css">
<link rel="stylesheet" type="text/css" href="${ctx}/easyui_1.4.3/themes/metro-blue/easyui.css">
<%@ include file="/jsp/common/easyui.jsp"%>
<script type="text/javascript" src="${ctx}/js/date.js"></script>
<script type="text/javascript">
//调用
var D = new Date();
var yy = D.getFullYear();
var mm = D.getMonth() + 1;
var dd = D.getDate();
var ww = D.getDay();

if (ww == 1) {
	ww = "一";
} else if (ww == 2) {
	ww = "二";
} else if (ww == 3) {
	ww = "三";
} else if (ww == 4) {
	ww = "四";
} else if (ww == 5) {
	ww = "五";
} else if (ww == 6) {
	ww = "六";
} else if (ww == 0) {
	ww = "日";
}

var ss = parseInt(D.getTime() / 1000);
if (yy < 100)
	yy = "19" + yy;

function getDate() {
	return yy + "年" + mm + "月" + dd + "日    " + "星期" + ww;
}
function getCNDate() {
	return GetLunarDay(yy, mm, dd);
}

/**
	 * 页面加载初始化
	 */
	jQuery(function() {
	
		var sys_date = "公元:" + getDate() + "&nbsp;&nbsp;&nbsp;农历:" + getCNDate();
		document.getElementById("sys_date").innerHTML = sys_date;
	
	});
</script>

</head>

<body class="easyui-layout">   
    
    <div data-options="region:'east',split:true" style="width:300px;">
    	 <div class="easyui-layout" data-options="fit:true">   
            <div data-options="region:'north',iconCls:'icon-tip',title:'数据统计'" style="height:160px">
            	<div style="height: 7%;"></div>
    			 
	            	 <ul>
					    <li style="height: 30px;color: #d39c1f;">登录次数：${loginCount}</li>
	    			</ul> 
    			
    			    
            </div>   
            <div data-options="region:'center',iconCls:'icon-tip',title:'校内链接'">
            	 <ul>
				    <li style="height: 25px;"><a href="//www.fafu.edu.cn" style="text-decoration: none;font-size: 13px;" target="_blank">农大官网</a></li>
				    <li style="height: 25px;"><a href="//xsgl.fafu.edu.cn" style="text-decoration: none;font-size: 13px;" target="_blank">金桥网</a></li>
    				<li style="height: 25px;"><a href="//jwgl.fafu.edu.cn" style="text-decoration: none;font-size: 13px;" target="_blank">教务管理系统</a></li>
    				<li style="height: 25px;"><a href="//xxxy.fafu.edu.cn" style="text-decoration: none;font-size: 13px;" target="_blank">计算机与信息学院</a></li>
    			</ul> 
            </div>   
        </div> 
    	
    </div>   
    <div data-options="region:'center',iconCls:'icon-tip',title:'站内信息'">
    	<table style="padding-left: 100px;">
		
		<tr style="height: 300px;">
			<td></td>
			
			<td>
				<table height="100px;" cellSpacing=0 cellPadding=0 width="100%" border=0>
				
					<tr height="40px;"><img alt="" src="${ctx}/images/loginlogo.png"></tr>

					<tr>
						<td><span style="font-size: 20px; color: #d39c1f;">温馨提示:现在系统时间是:</span></td>
					</tr>
					
					<tr>
						<td><span style="font-size: 20px; color: #d39c1f;" id="sys_date"></span></td>
					</tr>
				</table>
			</td>
			
	
		</tr>
		<tr>
			<td colSpan=3 height=10></td>
		</tr>
	</table>
    </div>   
</body> 
</html>
