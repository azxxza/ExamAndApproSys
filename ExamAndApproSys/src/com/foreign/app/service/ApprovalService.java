package com.foreign.app.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.snaker.engine.SnakerEngine;
import org.snaker.engine.access.QueryFilter;
import org.snaker.engine.entity.Task;

import com.foreign.app.bean.ApprovalState;
import com.foreign.app.model.FlowApproval;
import com.foreign.app.model.RelationTeacherVisit;
import com.foreign.app.model.SysUser;
import com.framework.flow.Service.SnakerService;

public class ApprovalService extends SnakerService {
	public void getTaskKey(String orderId, String operator) {

	}

	public void saveApproval(FlowApproval approval, String taskKey, String operator) {
		FlowApproval model = FlowApproval.findByOrderIdAndTaskKey(
				approval.getStr("orderId"), taskKey);
		if (model == null) {
			model = new FlowApproval();
		}

		model.set("operator", operator);

		model.set("operateTime", new Date());

		model.set("result", approval.getStr("result"));

		model.set("description", approval.getStr("description"));

		model.set("orderId", approval.getStr("orderId"));

		model.set("taskKey", taskKey);

		if (model.get("id") == null || model.get("id").equals("")) {

			model.save();

		} else {
			model.update();

		}
	}

	public void unitApprove(FlowApproval approval, String operator, String orderId) {
		// 流程数据
		Map<String, Object> params = new HashMap<String, Object>();

		List<Task> list = engine.query().getActiveTasks(
				new QueryFilter().setOrderId(orderId));

		String taskId = "";
		if (list != null && list.size() > 0) {
			taskId = list.get(0).getId();
		}

		if (approval.getStr("result").equals("1")) {

			SysUser user = SysUser.getUserByRoleNo(3);

			params.put("approveInternalUnitStaff.operator",
					user.get("user_name"));

			execute(taskId, operator, params);

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("unitPass", 1);

			engine.order().addVariable(orderId, map);

		} else {

			executeAndJump(taskId, operator, params, "end1");

			RelationTeacherVisit relationTeacherVisit = RelationTeacherVisit
					.getRelationTeacherVisitByOrderId(orderId);
			relationTeacherVisit.set("result", 0);
			relationTeacherVisit.update();
		}
	}

	public void internalStaffApprove(FlowApproval approval, String operator,
			String orderId) {
		// 构造并保存流程数据
		String result = approval.getStr("result");

		Map<String, Object> params = new HashMap<String, Object>();

		if (result.equals("1")) {

			SysUser user = SysUser.getUserByRoleNo(4);

			params.put("approveInternalUnitChief.operator",
					user.get("user_name"));

			params.put("staffResult", 1);

			List<Task> list = engine.query()
					.getActiveTasks(
							new QueryFilter().setOperator(operator).setOrderId(
									orderId));

			for (Task task : list) {
				executeAndJump(task.getId(), operator, params, "decision4");
			}

		} else if (result.equals("0")) {

			List<Task> list = engine.query().getActiveTasks(
					new QueryFilter().setOperator(operator));

			for (Task task : list) {
				executeAndJump(task.getId(), operator, params, "newApply");
			}

		}
	}

	public void internalChiefApprove(FlowApproval approval, String operator,
			String orderId) {
		// 构造并保存流程数据
		String result = approval.getStr("result");

		List<Task> list = engine.query().getActiveTasks(
				new QueryFilter().setOrderId(orderId));

		String taskId = "";
		if (list != null && list.size() > 0) {
			taskId = list.get(0).getId();
		}

		if (result.equals("1")) {

			Map<String, Object> params = new HashMap<String, Object>();

			SysUser user1 = SysUser.getUserByRoleNo(5);

			SysUser user2 = SysUser.getUserByRoleNo(6);

			SysUser user3 = SysUser.getUserByRoleNo(7);

			params.put("financial.operator", user1.get("user_name"));

			params.put("fundsSource.operator", user2.get("user_name"));

			params.put("discipline.operator", user3.get("user_name"));

			executeAndJump(taskId, operator, params, "fork1");

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("chiefPass", 1);

			engine.order().addVariable(orderId, map);

		} else if (result.equals("0")) {

			executeAndJump(taskId, operator, null, "end1");

			RelationTeacherVisit relationTeacherVisit = RelationTeacherVisit
					.getRelationTeacherVisitByOrderId(orderId);
			relationTeacherVisit.set("result", 0);
			relationTeacherVisit.update();

		}
	}

	public void financeApprove(FlowApproval approval, String operator,
			String orderId) {
		String result = approval.getStr("result");

		Map<String, Object> params = new HashMap<String, Object>();

		List<Task> list = engine.query().getActiveTasks(
				new QueryFilter().setOrderId(orderId));

		String taskId = "";
		if (list != null && list.size() > 0) {
			taskId = list.get(0).getId();
		}

		if (result.equals("1")) {

			params.put("internalLeader.operator", SysUser.getUserByRoleNo(9)
					.get("user_name"));

			params.put("businessLeader.operator", SysUser.getUserByRoleNo(8)
					.get("user_name"));

			executeAndJump(taskId, operator, params, "join1");

		} else if (result.equals("0")) {

			SysUser sysUser = SysUser.getUserByRoleNo(3);

			params.put("approveInternalUnitStaff.operator",
					sysUser.getStr("user_name"));

			executeAndJump(taskId, operator, params, "approveInternalUnitStaff");

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("chiefPass", 1);

			engine.order().addVariable(orderId, map);

		}
	}

	public void fundsSourceApprove(FlowApproval approval, String operator,
			String orderId) {

		String result = approval.getStr("result");

		Map<String, Object> params = new HashMap<String, Object>();

		List<Task> list = engine.query().getActiveTasks(
				new QueryFilter().setOrderId(orderId));

		String taskId = "";
		if (list != null && list.size() > 0) {
			taskId = list.get(0).getId();
		}

		if (result.equals("1")) {

			params.put("internalLeader.operator", SysUser.getUserByRoleNo(9)
					.get("user_name"));

			params.put("businessLeader.operator", SysUser.getUserByRoleNo(8)
					.get("user_name"));

			executeAndJump(taskId, operator, params, "join1");

		} else if (result.equals("0")) {

			SysUser sysUser = SysUser.getUserByRoleNo(3);

			params.put("approveInternalUnitStaff.operator",
					sysUser.getStr("user_name"));

			executeAndJump(taskId, operator, params, "approveInternalUnitStaff");

		}
	}

	public void disciplineApprove(FlowApproval approval, String operator,
			String orderId) {

		String result = approval.getStr("result");

		List<Task> list = engine.query().getActiveTasks(
				new QueryFilter().setOrderId(orderId));

		String taskId = "";
		if (list != null && list.size() > 0) {
			taskId = list.get(0).getId();
		}

		if (result.equals("1")) {

			Map<String, Object> params = new HashMap<String, Object>();

			params.put("internalLeader.operator", SysUser.getUserByRoleNo(9)
					.get("user_name"));

			params.put("businessLeader.operator", SysUser.getUserByRoleNo(8)
					.get("user_name"));

			executeAndJump(taskId, operator, params, "join1");

		} else if (result.equals("0")) {

			engine.order().terminate(orderId, SnakerEngine.ADMIN);

			RelationTeacherVisit relationTeacherVisit = RelationTeacherVisit
					.getRelationTeacherVisitByOrderId(orderId);
			relationTeacherVisit.set("result", 0);
			relationTeacherVisit.update();

		}
	}

	public void businessLeaderApprove(FlowApproval approval, String operator,
			String orderId) {
		String result = approval.getStr("result");

		List<Task> list = engine.query().getActiveTasks(
				new QueryFilter().setOrderId(orderId));

		String taskId = "";
		if (list != null && list.size() > 0) {
			taskId = list.get(0).getId();
		}

		if (result.equals("1")) {

			Map<String, Object> params = new HashMap<String, Object>();

			params.put("internalLeader.operator", SysUser.getUserByRoleNo(9)
					.get("user_name"));

			execute(taskId, operator, params);

		} else if (result.equals("0")) {

			executeAndJump(taskId, operator, null, "end1");

		}
	}

	public void internalLeaderApprove(FlowApproval approval, String operator,
			String orderId) {
		String result = approval.getStr("result");

		List<Task> list = engine.query().getActiveTasks(
				new QueryFilter().setOrderId(orderId));

		String taskId = "";
		if (list != null && list.size() > 0) {
			taskId = list.get(0).getId();
		}

		if (result.equals("1")) {

			Map<String, Object> params = new HashMap<String, Object>();

			params.put("secretaryLeader.operator", SysUser.getUserByRoleNo(10)
					.get("user_name"));

			executeAndJump(taskId, operator, params, "decision2");

		} else if (result.equals("0")) {

			executeAndJump(taskId, operator, null, "end1");

		}
	}

	public void partySecretaryApprove(FlowApproval approval, String operator,
			String orderId) {
		String result = approval.getStr("result");

		List<Task> list = engine.query().getActiveTasks(
				new QueryFilter().setOrderId(orderId));

		String taskId = "";
		if (list != null && list.size() > 0) {
			taskId = list.get(0).getId();
		}

		if (result.equals("1")) {

			RelationTeacherVisit relationTeacherVisit = RelationTeacherVisit
					.getRelationTeacherVisitByOrderId(orderId);
			relationTeacherVisit.set("result", 1);
			relationTeacherVisit.update();

			execute(taskId, operator, null);

		} else if (result.equals("0")) {

			executeAndJump(taskId, operator, null, "end1");

		}
	}

	public List<ApprovalState> getApprovalToBeList(String operator) {

		List<Task> taskList = engine.query().getActiveTasks(
				new QueryFilter().setOperator(operator));

		List<String> orderIdList = new ArrayList<String>();

		List<RelationTeacherVisit> list = new ArrayList<RelationTeacherVisit>();

		for (int i = 0; i < taskList.size(); i++) {
			Task task = taskList.get(i);
			boolean flag = false;
			for (int j = 0; j < orderIdList.size(); j++) {
				if (orderIdList.contains(task.getOrderId())) {
					flag = true;
				}
			}

			if (flag) {
				continue;
			} else {
				String orderId = task.getOrderId();
				RelationTeacherVisit relationTeacherVisit = RelationTeacherVisit
						.getRelationTeacherVisitByOrderId(orderId);
				list.add(relationTeacherVisit);
			}
		}

		return setNode(list);
	}
}
