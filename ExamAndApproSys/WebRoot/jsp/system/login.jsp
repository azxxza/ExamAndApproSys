<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>系统登录</title>
<%@ include file="/jsp/common/meta.jsp"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/easyui_1.4.3/themes/default/easyui.css">
<link href="${ctx}/css/login.css" rel="stylesheet" type="text/css" />
<%@ include file="/jsp/common/easyui.jsp"%>
<script language="javascript">

// $(function() {
// 	$('.loginbox').css({
// 		'position' : 'absolute',
// 		'left' : ($(window).width() - 692) / 2
// 	});
// 	$(window).resize(function() {
// 		$('.loginbox').css({
// 			'position' : 'absolute',
// 			'left' : ($(window).width() - 692) / 2
// 		});
// 	});
// });

	

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

	<div style="width: 50%;height: 30%;">
	
	</div>
	
	

	<div style="text-align: center;">
	
	<form action="${ctx}/loginController/doLoginTest">

		<select style="width: 100px;" name="username">
			<option value="申请人1" style="width: 100px;">申请人1</option>
			<option value="申请人2" style="width: 100px;">申请人2</option>
			<option value="所在单位1" style="width: 100px;">所在单位1</option>
			<option value="所在单位2" style="width: 100px;">所在单位2</option>
			<option value="国际处工作人员1" style="width: 100px;">国际处工作人员1</option>
			<option value="国际处工作人员2" style="width: 100px;">国际处工作人员2</option>
			<option value="国际处长1" style="width: 100px;">国际处长1</option>
			<option value="国际处长2" style="width: 100px;">国际处长2</option>
			<option value="财务处1" style="width: 100px;">财务处1</option>
			<option value="财务处2" style="width: 100px;">财务处2</option>
			<option value="经费来源部门1" style="width: 100px;">经费来源部门1</option>
			<option value="经费来源部门2" style="width: 100px;">经费来源部门2</option>
			<option value="纪监审部门1" style="width: 100px;">纪监审部门1</option>
			<option value="纪监审部门2" style="width: 100px;">纪监审部门2</option>
			<option value="业务分管校领导1" style="width: 100px;">业务分管校领导1</option>
			<option value="业务分管校领导2" style="width: 100px;">业务分管校领导2</option>
			<option value="外事分管校领导1" style="width: 100px;">外事分管校领导1</option>
			<option value="外事分管校领导2" style="width: 100px;">外事分管校领导2</option>
			<option value="校党委书记1" style="width: 100px;">校党委书记1</option>
			<option value="校党委书记2" style="width: 100px;">校党委书记2</option>
			
			
			
		</select><br><br>
		
		<input type="submit" value="登录">
		
	</form>
	
	</div>

<!-- 	<div id="mainBody"> -->
<!-- 		<div id="cloud1" class="cloud"></div> -->
<!-- 		<div id="cloud2" class="cloud"></div> -->
<!-- 	</div> -->

<!-- 	<div class="loginbody"> -->

<!-- 		<span class="systemlogo"></span> -->

<!-- 		<div class="loginbox"> -->
<!-- 			<form id="login"> -->
<!-- 				<ul> -->

<!-- 					<li><input class="easyui-textbox" id="username" name="username" style="width:70%;height:40px;padding:12px" data-options="prompt:'请输入用户名',iconCls:'icon-man',iconWidth:38"></li> -->

<!-- 					<li><input  class="easyui-textbox" id="password" name="password"  style="width:70%;height:40px;padding:12px;  "  data-options="prompt:'请输入密码',iconCls:'icon-lock',iconWidth:38, type:'password'"></li> -->

<!-- 					<li> -->
<!-- 						<label style="font-size: 13px; padding-left: 0px;">教师</label>  -->
<!-- 						<input type="radio" name="role" value="1" style="vertical-align: middle;" checked="checked"> -->
						
<!-- 						<label style="font-size: 13px;">所在单位</label>  -->
<!-- 						<input type="radio" name="role" value="2" style="vertical-align: middle;"> -->
						
<!-- 						<label style="font-size: 13px;">纪检部门</label>  -->
<!-- 						<input type="radio" name="role" value="3" style="vertical-align: middle;"> -->
						
<!-- 						<label style="font-size: 13px;">财务处</label> -->
<!-- 						<input type="radio"  name="role" value="4" style="vertical-align: middle;"> -->
<!-- 					</li> -->

<!-- 					<li><input id="doLogin" type="button" class="loginbtn" -->
<!-- 						value="登录" onclick="submitData()"/>&nbsp;&nbsp;&nbsp;<input -->
<!-- 						id="login" type="button" class="loginbtn" value="重置" onclick="reset()" /><label -->
<!-- 						id="error" style="color: red;"></label></li> -->
<!-- 				</ul> -->
<!-- 			</form> -->
<!-- 		</div> -->

<!-- 	</div> -->

</body>
</html>
