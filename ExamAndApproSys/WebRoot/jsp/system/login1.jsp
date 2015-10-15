<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>系统登录</title>
<%@ include file="/jsp/common/meta.jsp"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/easyui_1.4.3/themes/metro-blue/easyui.css">
<link href="${ctx}/css/login.css" rel="stylesheet" type="text/css" />
<%@ include file="/jsp/common/easyui.jsp"%>
<script language="javascript">

$(function() {
	$('.loginbox').css({
		'position' : 'absolute',
		'left' : ($(window).width() - 692) / 2
	});
	$(window).resize(function() {
		$('.loginbox').css({
			'position' : 'absolute',
			'left' : ($(window).width() - 692) / 2
		});
	});
});

	

// function submitData() {
		
// 	var username = document.getElementById("username").value;

// 	var password = document.getElementById("password").value;

// 	if (username == "" || username == "账号") {
// 		document.getElementById("error").innerText = "账号不为空";
// 		return;
// 	}

// 	if (password == "") {
// 		document.getElementById("error").innerText = "密码不为空";
// 		return;
// 	}
	
// 	var formData = jQuery("#login").serializeArray();
	
// 	var saveURL = "${ctx}/loginController/doLogin?date="+new Date()+"";
	
// 	jQuery.post(saveURL, formData, function(jsonData){
		
// 		var flag = jsonData.flag;
// 		var message = jsonData.message;
// 		if (flag == true){
// 			var mainURL = "${pageContext.request.contextPath}/index";
// 			window.location.href = mainURL;
// 		} else {
// 			document.getElementById("error").innerText = message;
// 		}
// 	}, "json");
		
// }
</script>
</head>
<body>


	<div class="loginbody">

		<span class="systemlogo"></span>

		<div class="loginbox">
			<form id="login">
				<ul>

					<li><input class="easyui-textbox" id="username" name="username" style="width:70%;height:40px;padding:12px" data-options="prompt:'请输入用户名',iconCls:'icon-man',iconWidth:38"></li>

					<li><input  class="easyui-textbox" id="password" name="password"  style="width:70%;height:40px;padding:12px;  "  data-options="prompt:'请输入密码',iconCls:'icon-lock',iconWidth:38, type:'password'"></li>


					<li><input id="doLogin" type="button" class="loginbtn"
						value="登录" onclick="submitData()"/>&nbsp;&nbsp;&nbsp;<input
						id="login" type="button" class="loginbtn" value="重置" onclick="reset()" /><label
						id="error" style="color: red;"></label></li>
				</ul>
			</form>
		</div>

	</div>

</body>
</html>
