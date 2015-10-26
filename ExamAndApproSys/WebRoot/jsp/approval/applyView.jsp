<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/privilege" prefix="privilege"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>系统登录</title>
<%@ include file="/jsp/common/meta.jsp"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/easyui_1.4.3/themes/metro/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/easyui_1.4.3/demo/demo.css">
<%@ include file="/jsp/common/easyui.jsp"%>
<style type="text/css">
	.textbox {
	width:125px;
	height: 20px;
	margin: 0;
	padding: 0 2px;
	box-sizing: content-box;
}
</style>
<script type="text/javascript">

	$(function() {
		var isOpen = '${isOpen}'
		
			if(isOpen == true){
			
		} else {
			$('input').attr("readonly","readonly")//将input元素设置为readonly
		}
	})
	
	function enterApproval(){
		
		$('#win').window('open').window('resize',{top: 100,left:170});
		
	}
	
	function doApproval(result){
	
		if(result == 1){
			document.getElementById("result").value = 1;
		}
		
		if(result == 0){
			document.getElementById("result").value = 0;
		}
		
		if(result == 2){
			document.getElementById("result").value = 2;
		}
		
		if(result == 1){
			
			var isOpen = ${isOpen};
			if(isOpen == true){
				$.messager.confirm('确认对话框', '同意将同时修改表单内容？', function(yes) {
					if (yes) {
						subData();
						
					}
				});
		
			}else {
				subData();
			}
		}
		
		
		
	
	}
	
	function subData(){
		var formData = jQuery("#approval").serializeArray();
		
		var saveURL = "${ctx}/approvalController/processApply?date=" + new Date() + "";
	
		jQuery.post(saveURL,formData, function(jsonData) {
			var flag = jsonData.flag;
			if (flag == true) {
				$.messager.alert('提示信息', '审批成功', 'info', function() {
					
					var url = '${ctx}/approvalController/approve_toBe';
					parent.closeTab('已批申请');
					parent.closeTab('待批申请');
					parent.addTabs("待批申请", url);
					parent.closeTab('详情');
				});

			} else {
				var message = jsonData.message;
				$.messager.alert('提示信息', '操作失败,原因为：' + message, 'error');

			}
		}, "json");
	}
	
	function sumbmitApproval(){
		
	}
	
</script>


</head>


<body>
<body class="easyui-layout">
<div region="center" border="true">
<div style="margin:20px 0;"></div>
<form id="basic">
	<div style="margin:20px 0;"></div>
	<div class="easyui-panel" title="（1）个人基本信息"
		style="width:750px;padding:10px 10px 10px 10px"
		data-options="collapsible:true">
		<table>
			<tr>
				<td>姓名:</td>
				<td><input class="easyui-validatebox textbox" name="formTeacherBasic.t_b_name" value="${formTeacherBasic.t_b_name}"
					data-options=" required:true,validType:'length[3,10]'"></td>
				<td></td>
				<td>性别:</td>

				<td><input class="easyui-validatebox textbox" name="formTeacherBasic.t_b_sex" value="${formTeacherBasic.t_b_sex}"
					data-options=" required:true"></td>

				<td>出生地：</td>
				<td><input class="easyui-validatebox textbox" name="formTeacherBasic.t_b_birth_palce" value="${formTeacherBasic.t_b_birth_palce}"
					data-options=" required:true,validType:'length[3,10]'"></td>
				<td></td> 
				<td>户口所在地：</td>

				<td><input class="easyui-validatebox textbox" name="formTeacherBasic.t_b_household_place" value="${formTeacherBasic.t_b_household_place}"
					data-options=" required:true,validType:'length[3,10]'"></td>
			</tr>
			<tr>
				<td>政治面貌:</td>
				<td><input class="easyui-validatebox textbox" name="formTeacherBasic.t_b_political_status" value="${formTeacherBasic.t_b_political_status}"
					data-options=" required:true"></td>

				<td></td>
				<td>文化程度:</td>
				<td><input class="easyui-validatebox textbox" name="formTeacherBasic.t_b_education_degree" value="${formTeacherBasic.t_b_education_degree}"
					data-options=" required:true,validType:'length[3,10]'"></td>

				<td>民族:</td>
				<td><input class="easyui-validatebox textbox" name="formTeacherBasic.t_b_nation" value="${formTeacherBasic.t_b_nation}"
					data-options=" required:true"></td>

				<td></td>
				<td>所在单位:</td>
				<td><input class="easyui-validatebox textbox" name="formTeacherBasic.t_b_unit" value="${formTeacherBasic.t_b_unit}"
					data-options=" required:true,validType:'length[3,10]'"></td>
			</tr>

			<tr>
				<td>职称:</td>
				<td><input class="easyui-validatebox textbox" name="formTeacherBasic.t_b_professional_title" value="${formTeacherBasic.t_b_professional_title}"
					data-options=" required:true"></td>
				<td></td>
				<td>身份证号:</td>
				<td><input class="easyui-validatebox textbox" name="formTeacherBasic.t_b_identification" value="${formTeacherBasic.t_b_identification}"
					data-options=" required:true,validType:'length[16,18]'"></td>

				<td>联系电话:</td>
				<td><input class="easyui-validatebox textbox" name="formTeacherBasic.t_b_tel" value="${formTeacherBasic.t_b_tel}"
					data-options=" required:true,validType:'length[3,10]'"></td>
				<td></td>
				<td>电子邮箱:</td>
				<td><input class="easyui-validatebox textbox" name="formTeacherBasic.t_b_email" value="${formTeacherBasic.t_b_email}"
					data-options="prompt:'Enter a valid email.',required:true,validType:'email'"></td>
			</tr>
			<tr>
				<td>职务 :</td>
				<td><input class="easyui-validatebox textbox" name="formTeacherBasic.t_b_job" value="${formTeacherBasic.t_b_job}"
					data-options=" required:true,validType:'length[3,10]'"></td>
				<td></td>
				<td>级别:</td>
				<td><input class="easyui-combobox" name="formTeacherBasic.t_b_level" value="${formTeacherBasic.t_b_level}" id="t_b_level"
					style="width:120px;"
					data-options="url : '${ctx}/levelController/getLevelList',valueField : 'l_no',textField : 'l_name'">
				


				</input></td>

				<td>是否为涉密人员:</td>
				<td><select class="easyui-combobox" name="state" id="state"
					style="width:120px;">
						<option value="AL">是</option>
						<option value="AK">否</option>

				</select></td>
			</tr>
			<table>
				<tr>
					<td colspan="2">最近一次因公出国（境）时间:</td>
					<td><input class="easyui-datebox" type="text"></td>
				</tr>
				<tr>
					<td colspan="2">最近一次因公出国（境）所赴国家（地区）及任务:</td>
					<td><input class="easyui-validatebox textbox"></td>
				</tr>
			</table>


		</table>
	</div>
	<div class="easyui-panel"
		title="（2）家庭主要成员情况 （第1次申请出境的用户必须填写，多次申请出境的用户请核对原始信息）"
		style="width:750px;padding:10px 60px 20px 10px"
		data-options="collapsible:true">

			<table id="family" class="easyui-datagrid"
				style="width:700px;height:150px"
				data-options="singleSelect:true,url:'${ctx}/applyController/getTeacherFamilyJsonList?t_work_id=${formTeacherBasic.t_work_id}',method:'get'">
	

				<thead>
					<tr>
						<th data-options="field:'id',hidden:false"></th>
						<th data-options="field:'t_f_call',width:60,editor:'text'">称谓</th>
						<th data-options="field:'t_f_name',width:60,editor:'text'  ">姓名</th>
						<th data-options="field:'t_f_age',width:60,editor:'datebox'">年龄</th>
						<th data-options="field:'t_f_political_status',width:60,editor:'text'">政治面貌</th>
						<th data-options="field:'t_f_unit',width:60,editor:'text'">工作单位</th>
						<th data-options="field:'t_f_job',width:60,editor:'text'">职务</th>
						<th data-options="field:'t_f_residence_place',width:60,editor:'text'">居住地</th>
						<th
							data-options="field:'t_f_foreign_residence',width:250,editor:{type:'checkbox',options:{on:'是',off:'否'}}">是否取得外国国籍、境外长期或永乐居留权</th>
					</tr>

				</thead>
				</table>

	</div>
	<div class="easyui-panel" title="（3）出访任务"
		style="width:750px;padding:10px 10px 10px 10px">
		<table>
			<tr>
				<td colspan="8">需注明邀请函是否真实有效.是否通过中介？如有，应，，，，，，，</td>
			</tr>

			<tr>
				<td>事由:</td>
				<td colspan="8"><input class="easyui-validatebox textbox"
					data-options="prompt:'这里是模板.',required:true, multiline:true"
					value="" style="width:600px;height:30px"></td>
			</tr>
			<tr>
				<td>出访目标和必要性:</td>
				<td colspan="8"><input class="easyui-validatebox textbox"
					data-options="prompt:'这里有模板.',required:true, multiline:true"
					value="" style="width:600px;height:30px"></td>
			</tr>
			<tr>
				<td>出访类型:</td>
				<td><select class="easyui-combobox" name="state"
					style="width:120px;">
						<option value="AL">学术交流</option>
						<option value="AK">访问学者</option>
						<option value="AZ">其它</option>


				</select></td>

				<td>出境时间:</td>
				<td><input class="easyui-datebox" data-options="required:true"></td>

				<td>回国时间:</td>
				<td><input class="easyui-datebox" data-options="required:true"></td>
			</tr>

		</table>

		<div style="height:150px;padding: 10px 60px 10px 10px">
			
				<table id="schedule" class="easyui-datagrid" title="行程表"
					style="width:615px;height:150px;"
					data-options="singleSelect:true,collapsible:true,url:'schedule.json',method:'get'">
			

					<thead>
						<tr>
							<th data-options="field:'出访国',width:80,editor:'text'">国家（地区）</th>
							<th data-options="field:'城市',width:80 ,editor:'text' ">城市</th>
							<th data-options="field:'到达时间',width:100,editor:'datebox'">到达时间</th>
							<th data-options="field:'离开时间',width:100,editor:'datebox'">离开时间</th>
							<th
								data-options="field:'如转机请注明转机时间与城市',width:250,editor:'text'">如转机请注明转机时间与城市</th>
						</tr>
	
					</thead>
				</table>

		</div>
		</div>
		<div class="easyui-panel" title="（4）邀请人信息"
			style="width:750px;padding:10px 10px 10px 10px">
			<table>
				<tr>
					<td style="width: 32px;">姓名:</td>
					<td><input class="easyui-validatebox textbox"
						data-options=" required:true"></td>
					<td>英文姓名:</td>
					<td><input class="easyui-validatebox textbox"
						data-options=" required:true"></td>

					<td>单位:</td>
					<td><input class="easyui-validatebox textbox"
						data-options=" required:true,validType:'length[3,10]'"></td>
					<td>单位英文名:</td>
					<td><input class="easyui-validatebox textbox"
						data-options=" required:true,validType:'length[3,10]'"></td>
				</tr>
				<tr>
					<td>地址:</td>
					<td><input class="easyui-validatebox textbox"
						data-options=" required:true,validType:'length[3,10]'"></td>

					<td>电话:</td>
					<td><input class="easyui-validatebox textbox"
						data-options=" required:true,validType:'length[3,10]'"></td>

					<td>传真:</td>
					<td><input class="easyui-validatebox textbox"
						data-options=" required:true,validType:'length[3,10]'"></td>

					<td>Email:</td>
					<td><input class="easyui-validatebox textbox"
						data-options=" required:true,validType:'length[3,10]'"></td>
				</tr>
			</table>

		</div>

		<div class="easyui-panel" title="（5）财务预算"
			style="width:750px;padding:10px 10px 10px 10px">
			<table>
				<tr>
					<td>经费管理部门:</td>
					<td><select class="easyui-combobox" name="state"
						style="width:100px;">
							<option value="AL">申请人所在单位</option>
							<option value="AK">科技发展研究院</option>
							<option value="AZ">发展规划处</option>
							<option value="AZ">新农村研究院</option>
							<option value="AZ">其它</option>
					</select></td>

					<td>经费来源部门:</td>
					<td><input class="easyui-validatebox textbox"
						data-options=" required:true"></td>

					<td>国际旅费:</td>
					<td><input class="easyui-validatebox textbox"
						data-options=" required:true,validType:'length[3,10]'"></td>

					<td>住宿费:</td>
					<td><input class="easyui-validatebox textbox"
						data-options=" required:true,validType:'length[3,10]'"></td>
				</tr>
				<tr>
					<td>伙食费:</td>
					<td><input class="easyui-validatebox textbox"
						data-options=" required:true,validType:'length[3,10]'"></td>

					<td>公杂费:</td>
					<td><input class="easyui-validatebox textbox"
						data-options=" required:true,validType:'length[3,10]'"></td>

					<td>境外城市间交通费:</td>
					<td><input class="easyui-validatebox textbox"
						data-options=" required:true,validType:'length[3,10]'"></td>

					<td>其它费用:</td>
					<td><input class="easyui-validatebox textbox"
						data-options=" required:true,validType:'length[3,10]'"></td>
				</tr>
				<tr>
					<td>合计:</td>
					<td><input class="easyui-validatebox textbox"
						data-options=" required:true,validType:'length[3,10]'"></td>
				</tr>
			</table>
		</div>


		<div class="easyui-panel" title="（6）附件上传"
			style="width:750px;padding:10px 10px 20px 10px">
			<table>

				<tr>
					<td style="width: 150px;">邀请函:</td>
					<td style="width: 180px;">
					<a href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'"
						onclick="search()">预览</a>
					</td>
					
					<td style="width: 150px;">邀请函翻译件:</td>
					<td style="width: 180px;">
					<a href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'"
						onclick="search()">预览</a>
					</td>
				</tr>
				<tr>
					<td>详细行程安排:</td>
					<td style="width: 180px;">
					<a href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'"
						onclick="search()">预览</a>
					</td>
					<td>详细行程安排翻译件:</td>
					<td style="width: 180px;">
					<a href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'"
						onclick="search()">预览</a>
					</td>
					
				</tr>

				<tr>
					<td>身份证扫描件:</td>
					<td style="width: 180px;">
					<a href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'"
						onclick="search()">预览</a>
					</td>
				</tr>
				
				
				<tr>
					<td>论文录用通知:</td>
					
					<td style="width: 180px;">
					<a href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'"
						onclick="search()">预览</a>
					</td>
					<td>论文录用通知翻译件:</td>
					
					<td style="width: 180px;">
					<a href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'"
						onclick="search()">预览</a>
					</td>
					
				</tr>
				<tr>
					<td>论文摘要:</td>
					
					<td style="width: 180px;">
					<a href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'"
						onclick="search()">预览</a>
					</td>
					<td>论文摘要翻译件:</td>
					<td style="width: 180px;">
					<a href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'"
						onclick="search()">预览</a>
					</td>
					
				</tr>
			</table>
		</div>
		<div class="easyui-panel" title=" （7） 提交申请"
			style="width:750px;padding:10px 60px 20px 60px">
			<table>
				<tr>
					<td>其它需要额外说明的情况:</td>
					<td><input class="easyui-validatebox textbox"
						data-options=" required:true, multiline:true" value=""
						style="width:500px;height:100px"></td>

				</tr>
				<tr>
				
				<privilege:show powerName="menu_approval">
						<td><a href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-edit'" style="width:80px"
						onclick="enterApproval()">进入审批</a></td>
				</privilege:show>
				
				<privilege:show powerName="menu_apply">
				<td>
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" style="width:80px"
						onclick="saveApproval()">保存</a></td>
				<td><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" style="width:80px"
						onclick="sumbmitApproval()">提交申请</a></td>
				</privilege:show>
					
				
				</tr>
				
			</table>
		</div>

</form>

</div>

<div id="win" class="easyui-dialog" title="审批"
		style="width:500px;height:350px;"
		data-options="modal:true,closed:true">

		<form id="approval" name="approval" method="post">
			<input type="hidden" name="approval.orderId" value="${orderId}" id="orderId">
			<input type="hidden" name="approval.result" value="${result}" id="result">
			<table style="margin-left: 30px; font-size: 9px; margin-top: 20px;" >
				<tr>
					<td>审批意见:</td>
					<td style="padding-left: 15px;"><textarea name="approval.description" class="easyui-textbox" data-options="multiline:true" id="advice" style="width: 300px; height: 200px;" ></textarea></td>
					
				</tr>
			</table>
			
			<div style="height: 15px;"></div>
			
			<div style="text-align: center;">
				<a href="#" class="easyui-linkbutton"
							data-options="iconCls:'icon-ok'" style="width:80px"
							onclick="doApproval(1)">同意</a>&nbsp;&nbsp;
						<a href="#" class="easyui-linkbutton"
							data-options="iconCls:'icon-cancel'" style="width:80px"
							onclick="doApproval(0)">不同意</a>&nbsp;&nbsp;
							<privilege:show powerName="menu_chief">
								<a href="#" class="easyui-linkbutton"
									data-options="iconCls:'icon-undo'" style="width:80px"
									onclick="doApproval(2)">驳回修改</a>
							</privilege:show>
			</div>
			
			
		</form>
	</div>

<div region="east" style="width: 270px;" border="false">
	<div class="easyui-accordion" data-options="multiple:true" border="false">
		<div title="审批意见" data-options="iconCls:'icon-edit',collapsed:false,collapsible:false" style="overflow:auto;padding:10px;" border="false">
			
			<c:if test="${empty approvalList}">
				<div style="text-align: center;"><span style="color: red;">暂无审批信息</span></div>
			</c:if >
			
			<c:if test="${not empty approvalList}">
			
			<c:forEach items="${approvalList}" var="approval">
				
			
			<table cellspacing="7px;">
				<tr>
					<td>审批人:</td>
					<td>${approval.operator}</td>
				</tr>
				<tr>
					<td>审批角色:</td>
					<td>${approval.operator_role}</td>
				</tr>
				<tr>
					<td>审批结果:</td>
					<td>
					<c:if test="${approval.result==1 }">
					<a href="javascript:void(0)" class="easyui-linkbutton"
						data-options="iconCls:'icon-ok',plain:true" style="width:80px; color: red;">通过</a></td>
					</c:if>
					<c:if test="${approval.result==0 || approval.result == 2}">
					<a href="javascript:void(0)" class="easyui-linkbutton"
						data-options="iconCls:'icon-cancel',plain:true" style="width:80px; color: red;">不通过</a></td>
					</c:if>
				</tr>
				<tr>
					<td colspan="2">审批意见:</td>
					
				</tr>
				<tr>
					<td colspan="2"><input name="approval.description" class="easyui-textbox" data-options="multiline:true" style="width: 200px; height: 90px;" value="${approval.description}" readonly="readonly"></td>
					
				</tr>
				<tr>
					<td>审批时间:</td>
					<td>${approval.operateTime}</td>
				</tr>
			</table>
			
			<hr>
			
			</c:forEach>
			</c:if>
		</div>
		
</div>

</body>
</body>
</html>