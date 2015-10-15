<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>系统登录</title>
<%@ include file="/jsp/common/meta.jsp"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<link rel="stylesheet" type="text/css" href="${ctx}/easyui_1.4.3/themes/metro-blue/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/easyui_1.4.3/demo/demo.css">
<%@ include file="/jsp/common/easyui.jsp"%>
<style type="text/css">
	.textbox {
		height: 20px;
		margin: 0;
		padding: 0 2px;
		box-sizing: content-box;
	}
</style>
<script type="text/javascript">
	$.extend($.fn.datagrid.methods, {
		editCell : function(jq, param) {
			return jq.each(function() {
				var opts = $(this).datagrid('options');
				var fields = $(this).datagrid('getColumnFields', true).concat(
						$(this).datagrid('getColumnFields'));
				for (var i = 0; i < fields.length; i++) {
					var col = $(this).datagrid('getColumnOption', fields[i]);
					col.editor1 = col.editor;
					if (fields[i] != param.field) {
						col.editor = null;
					}
				}
				$(this).datagrid('beginEdit', param.index);
				var ed = $(this).datagrid('getEditor', param);
				if (ed) {
					if ($(ed.target).hasClass('textbox-f')) {
						$(ed.target).textbox('textbox').focus();
					} else {
						$(ed.target).focus();
					}
				}
				for (var i = 0; i < fields.length; i++) {
					var col = $(this).datagrid('getColumnOption', fields[i]);
					col.editor = col.editor1;
				}
			});
		},
		enableCellEditing : function(jq) {
			return jq.each(function() {
				var dg = $(this);
				var opts = dg.datagrid('options');
				opts.oldOnClickCell = opts.onClickCell;
				opts.onClickCell = function(index, field) {
					if (opts.editIndex != undefined) {
						if (dg.datagrid('validateRow', opts.editIndex)) {
							dg.datagrid('endEdit', opts.editIndex);
							opts.editIndex = undefined;
						} else {
							return;
						}
					}
					dg.datagrid('selectRow', index).datagrid('editCell', {
						index : index,
						field : field
					});
					opts.editIndex = index;
					opts.oldOnClickCell.call(this, index, field);
				}
			});
		}
	});

	$.extend($.fn.textbox.methods, {
		remove : function(jq, newposition) {
			return jq.each(function() {
				$(this).removeClass("validatebox-text validatebox-invalid")
						.unbind('focus').unbind('blur');
			});
		},
		reduce : function(jq, newposition) {
			return jq.each(function() {
				var opt = $(this).data().validatebox.options;
				$(this).addClass("validatebox-text").validatebox(opt);
			});
		}
	});
	
	

	$(function() {
		$('#family').datagrid().datagrid('enableCellEditing');
		$('#schedule').datagrid().datagrid('enableCellEditing');
		

	})

	/*
	 * 提交
	 */
	function submitData() {
	
		var formData = jQuery("#basic").serializeArray();
		
		var orderId = document.getElementById("orderId").value;
		
		var saveURL = '';
		
		if(orderId != ''){
			saveURL = "${ctx}/applyController/updateApply?date="
				+ new Date() + "";
		}else {
			saveURL = "${ctx}/applyController/saveApply?date="
				+ new Date() + "";
		}
		
	
		// 		if($("#basic").form('validate')){
		jQuery.post(saveURL, formData, function(jsonData) {
			var flag = jsonData.flag;
			if (flag == true) {

				$.messager.alert('提示信息', '操作成功', 'info', function() {
					var URL = '${ctx}/applyController/toBeApprove';
					parent.closeTab('待批申请');
					parent.closeTab('已批申请');
					parent.addTabs('待批申请',URL);
					parent.closeTab('个人出境申请');
				});

			} else {
				$.messager.alert('提示信息', '操作失败');

			}
		}, "json");

	}
	
	function saveData() {
		alert("保存数据到服务器");
	}
	
</script>
<script type="text/javascript">
	var toolbar = [ {
		text : '增加记录',
		iconCls : 'icon-add',
		handler : function() {
			alert('add')
		}
	}, '-', {
		text : '删除一条记录',
		iconCls : 'icon-clear',
		handler : function() {
			alert('cut');
		}
	} ];
</script>

</head>


<body>
<h2>请按顺序填写以下表单</h2>
<p>(1) 个人基本信息&nbsp;&nbsp;(2) 家庭主要成员情况&nbsp;&nbsp;(3) 出访任务&nbsp;&nbsp;(4) 邀请人信息&nbsp;&nbsp;(5) 财务预算&nbsp;&nbsp;(6) 附件上传</p>
<div style="margin:20px 0;"></div>
<form id="basic">
	<div style="margin:20px 0;"></div>
	<input type="hidden" name="orderId" value="${orderId}" id="orderId">
	<div class="easyui-panel" title="（1）个人基本信息"
		style="width:900px;padding:10px 10px 10px 10px"
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
				<script type="text/javascript">
					$('#t_b_level').combobox({
						onLoadSuccess:function(){
							if($(this).combobox('getValue') == ''){
								$(this).combobox('setValue',5);
							}
						}
					});
				</script>


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
		style="width:900px;padding:10px 60px 20px 60px"
		data-options="collapsible:true">

			<table id="family" class="easyui-datagrid"
				style="width:700px;height:150px"
				data-options="singleSelect:true,toolbar:toolbar,url:'${ctx}/applyController/getTeacherFamilyJsonList?t_work_id=${formTeacherBasic.t_work_id}',method:'get'">
		
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
		style="width:900px;padding:10px 10px 10px 10px">
		<table>
			<tr>
				<td colspan="2">需注明邀请函是否真实有效.是否通过中介？如有，应，，，，，，，</td>
			</tr>

			<tr>
				<td>事由:</td>
				<td colspan="8"><input class="easyui-validatebox textbox"
					data-options="prompt:'这里是模板.',required:true, multiline:true"
					value="" style="width:700px;height:30px"></td>
			</tr>
			<tr>
				<td>出访目标和必要性:</td>
				<td colspan="8"><input class="easyui-validatebox textbox"
					data-options="prompt:'这里有模板.',required:true, multiline:true"
					value="" style="width:700px;height:30px"></td>
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

		<div style="height:150px;padding: 10px 60px 10px 60px">
			<table id="schedule" class="easyui-datagrid" title="行程表"
				style="width:615px;height:150px;"
				data-options="singleSelect:true,collapsible:true,url:'schedule.json',method:'get',toolbar:toolbar">
	
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
			style="width:900px;padding:10px 10px 10px 10px">
			<table>
				<tr>
					<td>姓名:</td>
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
			style="width:900px;padding:10px 10px 10px 10px">
			<table>
				<tr>
					<td>经费管理部门:</td>
					<td><select class="easyui-combobox" name="state"
						style="width:150px;">
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
			style="width:900px;padding:10px 10px 20px 10px">
			<table cellpadding="5">

				<tr>
					<td>附件限pdf/doc/jpeg格式:</td>
				</tr>
				<tr>
					<td>邀请函:</td>
					<td><input class="easyui-filebox"
						data-options="required:true,buttonText:'选择文件'"
						style="width:200px"></td>
					<td><a href="#" class="easyui-linkbutton"
						style="width:100%">上传</a></td>
					<td>邀请函翻译件:</td>
					<td><input class="easyui-filebox"
						data-options="required:true,buttonText:'选择文件'"
						style="width:200px"></td>
					<td><a href="#" class="easyui-linkbutton"
						style="width:100%">上传</a></td>
				</tr>
				<tr>
					<td>详细行程安排:</td>
					<td><input class="easyui-filebox"
						data-options="required:true,buttonText:'选择文件'"
						style="width:200px"></td>
					<td><a href="#" class="easyui-linkbutton"
						style="width:100%">上传</a></td>
					<td>详细行程安排翻译件:</td>
					<td><input class="easyui-filebox"
						data-options="required:true,buttonText:'选择文件'"
						style="width:200px"></td>
					<td><a href="#" class="easyui-linkbutton"
						style="width:100%">上传</a></td>
				</tr>


				<tr>
					<td>身份证扫描件:</td>
					<td><input class="easyui-filebox"
						data-options="required:true,buttonText:'选择文件'"
						style="width:200px"></td>
					<td><a href="#" class="easyui-linkbutton"
						style="width:100%">上传</a></td>
				</tr>
				<tr>
					<td>参加国际会议还需提交以下材料:</td>
				</tr>
				<tr>
					<td>论文录用通知:</td>
					<td><input class="easyui-filebox"
						data-options="required:true,buttonText:'选择文件'"
						style="width:200px"></td>
					<td><a href="#" class="easyui-linkbutton"
						style="width:100%">上传</a></td>
					<td>论文录用通知翻译件:</td>
					<td><input class="easyui-filebox"
						data-options="required:true,buttonText:'选择文件'"
						style="width:200px"></td>
					<td><a href="#" class="easyui-linkbutton"
						style="width:100%">上传</a></td>
				</tr>
				<tr>
					<td>论文摘要:</td>
					<td><input class="easyui-filebox"
						data-options="required:true,buttonText:'选择文件'"
						style="width:200px"></td>
					<td><a href="#" class="easyui-linkbutton"
						style="width:100%">上传</a></td>
					<td>论文摘要翻译件:</td>
					<td><input class="easyui-filebox"
						data-options="required:true,buttonText:'选择文件'"
						style="width:200px"></td>
					<td><a href="#" class="easyui-linkbutton"
						style="width:100%">上传</a></td>
				</tr>
			</table>

		</div>


		<div class="easyui-panel" title=" （7） 提交申请"
			style="width:900px;padding:10px 60px 20px 60px">
			<table>
				<tr>
					<td>其它需要额外说明的情况:</td>
					<td><input class="easyui-validatebox textbox"
						data-options=" required:true, multiline:true" value=""
						style="width:500px;height:100px"></td>

				</tr>
				<tr>
					
					<td><a href="#" class="easyui-linkbutton"
						data-options="iconCls:'icon-save'" style="width:80px"
						onclick="saveData()">保存</a></td>
					<td><a href="#"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-ok'" onclick="submitData()"
						style="width:80px">确认提交</a></td>
					
				</tr>
				
			</table>
		</div>

</form>
	
</body>
</html>