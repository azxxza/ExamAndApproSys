package com.foreign.app.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.snaker.engine.entity.Order;

import com.foreign.app.bean.ApprovalState;
import com.foreign.app.model.FlowApproval;
import com.foreign.app.model.FormTeacherBasic;
import com.foreign.app.model.RelationTeacherVisit;
import com.foreign.app.model.SysUser;
import com.foreign.app.model.SysUserRole;
import com.framework.flow.Service.SnakerService;

public class ApplyService extends SnakerService {

	// 保存申请流程
	public String saveApplyFlow(SysUser loginUser) {

		String operator = loginUser.getStr("user_name");

		Integer level = loginUser.getUserLevel();

		Map<String, Object> orderParams = new HashMap<String, Object>();

		orderParams.put("l_no", level);

		SysUser sysUser = SysUserRole

		orderParams.put("unit.operator", sysUser.getStr("user_name"));

		Order order = startAndExecute(operator, orderParams);

		return order.getId();

	}

	// 更新流程数据
	public void updateApplyFlow(SysUser loginUser, String taskId) {
		// 操作人
		String operator = loginUser.getStr("user_name");

		Integer level = loginUser.getUserLevel();

		// 流程变量参数
		Map<String, Object> params = new HashMap<String, Object>();

		SysUser user = SysUser.getUserByRoleId(3);

		// 执行人
		params.put("newApply.operator", operator);

		// 下一个执行人
		params.put("internalStaff.operator", user.get("user_name"));

		params.put("l_no", level);

		execute(taskId, operator, params);

		/** 流程数据构造结束 */
	}

	// 保存或更新教师基本信息
	public void saveOrUpadteFormTeacherBasic(FormTeacherBasic teacherBasic,
			String t_work_id) {
		if (teacherBasic != null) {
			FormTeacherBasic basic = FormTeacherBasic
					.getTeacherByWorkId(t_work_id);
			if (basic != null) {
				teacherBasic.set("id", basic.getInt("id"));
				teacherBasic.set("t_work_id", basic.getStr("t_work_id"));
				teacherBasic.update();
			} else {
				teacherBasic.save();
			}

		}

	}

	// 生成并保存结果表
	public void saveRelationTeacherVisit(SysUser loginUser, String orderId,
			String visit_no, String visit_summary) {

		String t_work_id = loginUser.getStr("t_work_id");

		RelationTeacherVisit teacherVisit = RelationTeacherVisit
				.getRelationTeacherVisitByOrderId(orderId);

		if (teacherVisit == null) {

			teacherVisit = new RelationTeacherVisit();

			teacherVisit.set("t_work_id", t_work_id);

			teacherVisit.set("order_id", orderId);

			teacherVisit.set("visit_no", visit_no);

			teacherVisit.set("visit_summary", visit_summary);

			teacherVisit.save();

		}

	}

	// 更新审批节点结果表
	public void updateApproval(String orderId) {

		List<FlowApproval> list = FlowApproval.findByOrderId(orderId);

		FlowApproval approvalUnit = FlowApproval.findByOrderIdAndTaskKey(
				orderId, "approveUnit");

		FlowApproval approveInternalUnitChief = FlowApproval
				.findByOrderIdAndTaskKey(orderId, "approveInternalUnitChief");

		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				FlowApproval approval = list.get(i);
				if (approvalUnit != null
						&& approval.get("taskKey").equals(
								approvalUnit.get("taskKey"))) {
					continue;
				}

				if (approveInternalUnitChief != null
						&& approval.get("taskKey").equals(
								approveInternalUnitChief.get("taskKey"))) {
					continue;
				}
				approval.set("result", 0);
				approval.update();
			}
		}
	}

	public void deleteApply(String orderId) {

		List<FlowApproval> list = FlowApproval.findByOrderId(orderId);

		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				list.get(i).delete();
			}
		}

		engine.order().cascadeRemove(orderId);

		RelationTeacherVisit teacherVisit = RelationTeacherVisit
				.getRelationTeacherVisitByOrderId(orderId);

		if (teacherVisit != null) {
			teacherVisit.delete();
		}
	}

	public List<ApprovalState> getTeacherApplyList(String operator) {

		List<RelationTeacherVisit> list = RelationTeacherVisit
				.getRemainApproveList(operator);

		return setNode(list);

	}

	public List<ApprovalState> getTeacherApprovedList(String operator) {

		List<RelationTeacherVisit> list = RelationTeacherVisit
				.getHasApprovedList(operator);

		return setNode(list);
	}

}
