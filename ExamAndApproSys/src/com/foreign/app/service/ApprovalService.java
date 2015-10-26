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
import com.foreign.app.common.FlowCommon;
import com.foreign.app.model.FlowApproval;
import com.foreign.app.model.RelationTeacherVisit;
import com.foreign.app.model.SysUser;
import com.foreign.app.utils.RoleCommon;
import com.framework.flow.Service.SnakerService;

public class ApprovalService extends SnakerService {
	public void getTaskKey(String orderId, String operator) {

	}

	public void saveApproval(FlowApproval approval, String taskKey,
			String operator) {
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

//	public void unitApprove(FlowApproval approval, String operator,
//			String orderId) {
//		// 流程数据
//		Map<String, Object> params = new HashMap<String, Object>();
//
//		List<Task> list = engine.query().getActiveTasks(
//				new QueryFilter().setOrderId(orderId));
//
//		String taskId = "";
//		if (list != null && list.size() > 0) {
//			taskId = list.get(0).getId();
//		}
//
//		if (approval.getStr("result").equals("1")) {
//
//			SysUser user = SysUser.getUserByRoleNo(RoleCommon.INTERNALSTAFF);
//
//			params.put("internalStaff.operator", user.get("user_name"));
//
//			execute(taskId, operator, params);
//
//			Map<String, Object> map = new HashMap<String, Object>();
//
//			map.put("unitPass", 1);
//
//			engine.order().addVariable(orderId, map);
//
//		} else {
//
//			executeAndJump(taskId, operator, params, "end1");
//
//			RelationTeacherVisit relationTeacherVisit = RelationTeacherVisit
//					.getRelationTeacherVisitByOrderId(orderId);
//			relationTeacherVisit.set("result", 0);
//			relationTeacherVisit.update();
//		}
//	}
//
//	public void internalStaffApprove(FlowApproval approval, String operator,
//			String orderId) {
//		// 构造并保存流程数据
//		String result = approval.getStr("result");
//
//		Map<String, Object> params = new HashMap<String, Object>();
//
//		if (result.equals("1")) {
//
//			SysUser user = SysUser.getUserByRoleNo(RoleCommon.INTERNALCHIEF);
//
//			params.put("internalChief.operator", user.get("user_name"));
//
//			List<Task> list = engine.query()
//					.getActiveTasks(
//							new QueryFilter().setOperator(operator).setOrderId(
//									orderId));
//			
//
//			for (Task task : list) {
//				executeAndJump(task.getId(), operator, params, "internalChief");
//			}
//
//			FlowApproval flowApproval = FlowApproval.findByOrderIdAndTaskKey(
//					orderId, FlowCommon.INTERNALCHIEF);
//
//			if (flowApproval != null) {
//				flowApproval.delete();
//			}
//
//		} else if (result.equals("0")) {
//
//			List<Task> list = engine.query().getActiveTasks(
//					new QueryFilter().setOperator(operator));
//
//			for (Task task : list) {
//				executeAndJump(task.getId(), operator, params, "newApply");
//			}
//
//		}
//	}
//
//	public void internalChiefApprove(FlowApproval approval, String operator,
//			String orderId) {
//		// 构造并保存流程数据
//		String result = approval.getStr("result");
//
//		List<Task> list = engine.query().getActiveTasks(
//				new QueryFilter().setOrderId(orderId));
//
//		String taskId = "";
//		if (list != null && list.size() > 0) {
//			taskId = list.get(0).getId();
//		}
//
//		Map<String, Object> params = new HashMap<String, Object>();
//		if (result.equals("1")) {
//
//			params.put(
//					"financial.operator",
//					SysUser.getUserByRoleNo(RoleCommon.FINANCIAL).getStr(
//							"user_name"));
//
//			params.put(
//					"discipline.operator",
//					SysUser.getUserByRoleNo(RoleCommon.DISCIPLINE).getStr(
//							"user_name"));
//
//			params.put(
//					"fundsSource.operator",
//					SysUser.getUserByRoleNo(RoleCommon.FUNDSSOURCE).getStr(
//							"user_name"));
//			executeAndJump(taskId, operator, params, "fork1");
//
//			Map<String, Object> map = new HashMap<String, Object>();
//
//			map.put("chiefPass", 1);
//
//			engine.order().addVariable(orderId, map);
//
//		} else if (result.equals("0")) {
//
//			executeAndJump(taskId, operator, null, "end1");
//
//			RelationTeacherVisit relationTeacherVisit = RelationTeacherVisit
//					.getRelationTeacherVisitByOrderId(orderId);
//			relationTeacherVisit.set("result", 0);
//			relationTeacherVisit.update();
//
//		} else if (result.equals("2")) {
//
//			SysUser sysUser = SysUser.getUserByRoleNo(RoleCommon.INTERNALSTAFF);
//
//			params.put("internalStaff.operator", sysUser.getStr("user_name"));
//
//			executeAndJump(taskId, operator, params, "internalStaff");
//
//			FlowApproval flowApproval = FlowApproval.findByOrderIdAndTaskKey(
//					orderId, FlowCommon.INTERNALSTAFF);
//
//			if (flowApproval != null) {
//				flowApproval.delete();
//			}
//
//		}
//	}
//
//	public void financeApprove(FlowApproval approval, String operator,
//			String orderId) {
//		String result = approval.getStr("result");
//
//		Map<String, Object> params = new HashMap<String, Object>();
//
//		List<Task> list = engine.query().getActiveTasks(
//				new QueryFilter().setOrderId(orderId).setOperator(operator));
//
//		String taskId = "";
//		if (list != null && list.size() > 0) {
//			taskId = list.get(0).getId();
//		}
//
//		if (result.equals("1")) {
//
//			params.put(
//					"internalLeader.operator",
//					SysUser.getUserByRoleNo(RoleCommon.INTERNALLEADER).get(
//							"user_name"));
//
//			params.put(
//					"businessLeader.operator",
//					SysUser.getUserByRoleNo(RoleCommon.BUSINESSLEADER).get(
//							"user_name"));
//
//			executeAndJump(taskId, operator, params, "join1");
//
//		} else if (result.equals("0")) {
//
//			SysUser sysUser = SysUser.getUserByRoleNo(RoleCommon.INTERNALSTAFF);
//
//			params.put("internalStaff.operator", sysUser.getStr("user_name"));
//
//			params.put("toDepartment", 0);
//
//			executeAndJump(taskId, operator, params, "internalStaff");
//
//			Map<String, Object> map = new HashMap<String, Object>();
//
//			map.put("chiefPass", 1);
//
//			map.put("toDepartment", 0);
//
//			engine.order().addVariable(orderId, map);
//
//			FlowApproval flowApproval = FlowApproval.findByOrderIdAndTaskKey(
//					orderId, FlowCommon.INTERNALSTAFF);
//
//			if (flowApproval != null) {
//				flowApproval.delete();
//			}
//
//		}
//	}
//
//	public void fundsSourceApprove(FlowApproval approval, String operator,
//			String orderId) {
//
//		String result = approval.getStr("result");
//
//		Map<String, Object> params = new HashMap<String, Object>();
//
//		List<Task> list = engine.query().getActiveTasks(
//				new QueryFilter().setOrderId(orderId).setOperator(operator));
//
//		String taskId = "";
//		if (list != null && list.size() > 0) {
//			taskId = list.get(0).getId();
//		}
//
//		if (result.equals("1")) {
//
//			params.put(
//					"internalLeader.operator",
//					SysUser.getUserByRoleNo(RoleCommon.INTERNALLEADER).get(
//							"user_name"));
//
//			params.put(
//					"businessLeader.operator",
//					SysUser.getUserByRoleNo(RoleCommon.BUSINESSLEADER).get(
//							"user_name"));
//
//			executeAndJump(taskId, operator, params, "join1");
//
//		} else if (result.equals("0")) {
//
//			SysUser sysUser = SysUser.getUserByRoleNo(RoleCommon.INTERNALSTAFF);
//
//			params.put("internalStaff.operator", sysUser.getStr("user_name"));
//
//			executeAndJump(taskId, operator, params, "internalStaff");
//
//		}
//	}
//
//	public void disciplineApprove(FlowApproval approval, String operator,
//			String orderId) {
//
//		String result = approval.getStr("result");
//
//		List<Task> list = engine.query().getActiveTasks(
//				new QueryFilter().setOrderId(orderId).setOperator(operator));
//
//		String taskId = "";
//		if (list != null && list.size() > 0) {
//			taskId = list.get(0).getId();
//		}
//
//		if (result.equals("1")) {
//
//			Map<String, Object> params = new HashMap<String, Object>();
//
//			params.put(
//					"internalLeader.operator",
//					SysUser.getUserByRoleNo(RoleCommon.INTERNALLEADER).get(
//							"user_name"));
//
//			params.put(
//					"businessLeader.operator",
//					SysUser.getUserByRoleNo(RoleCommon.BUSINESSLEADER).get(
//							"user_name"));
//
//			executeAndJump(taskId, operator, params, "join1");
//
//		} else if (result.equals("0")) {
//
//			engine.order().terminate(orderId, SnakerEngine.ADMIN);
//
//			RelationTeacherVisit relationTeacherVisit = RelationTeacherVisit
//					.getRelationTeacherVisitByOrderId(orderId);
//			relationTeacherVisit.set("result", 0);
//			relationTeacherVisit.update();
//
//		}
//	}
//
//	public void businessLeaderApprove(FlowApproval approval, String operator,
//			String orderId) {
//		String result = approval.getStr("result");
//
//		List<Task> list = engine.query().getActiveTasks(
//				new QueryFilter().setOrderId(orderId));
//
//		String taskId = "";
//		if (list != null && list.size() > 0) {
//			taskId = list.get(0).getId();
//		}
//
//		if (result.equals("1")) {
//
//			Map<String, Object> params = new HashMap<String, Object>();
//
//			params.put(
//					"internalLeader.operator",
//					SysUser.getUserByRoleNo(RoleCommon.INTERNALLEADER).get(
//							"user_name"));
//
//			execute(taskId, operator, params);
//
//		} else if (result.equals("0")) {
//
//			executeAndJump(taskId, operator, null, "end1");
//
//		}
//	}
//
//	public void internalLeaderApprove(FlowApproval approval, String operator,
//			String orderId) {
//		String result = approval.getStr("result");
//
//		List<Task> list = engine.query().getActiveTasks(
//				new QueryFilter().setOrderId(orderId));
//
//		String taskId = "";
//		if (list != null && list.size() > 0) {
//			taskId = list.get(0).getId();
//		}
//
//		if (result.equals("1")) {
//
//			Map<String, Object> params = new HashMap<String, Object>();
//
//			params.put(
//					"partySecretary.operator",
//					SysUser.getUserByRoleNo(RoleCommon.PARTYSECRETARY).get(
//							"user_name"));
//
//			executeAndJump(taskId, operator, params, "decision2");
//
//		} else if (result.equals("0")) {
//
//			executeAndJump(taskId, operator, null, "end1");
//
//		}
//	}
//
//	public void partySecretaryApprove(FlowApproval approval, String operator,
//			String orderId) {
//		String result = approval.getStr("result");
//
//		List<Task> list = engine.query().getActiveTasks(
//				new QueryFilter().setOrderId(orderId));
//
//		String taskId = "";
//		if (list != null && list.size() > 0) {
//			taskId = list.get(0).getId();
//		}
//
//		if (result.equals("1")) {
//
//			RelationTeacherVisit relationTeacherVisit = RelationTeacherVisit
//					.getRelationTeacherVisitByOrderId(orderId);
//			relationTeacherVisit.set("result", 1);
//			relationTeacherVisit.update();
//
//			execute(taskId, operator, null);
//
//		} else if (result.equals("0")) {
//
//			executeAndJump(taskId, operator, null, "end1");
//
//		}
//	}
//
//	public List<ApprovalState> getApprovalToBeList(String operator) {
//		
//		
//
//		List<Task> taskList = engine.query().getActiveTasks(
//				new QueryFilter().setOperator(operator));
//
//		List<String> orderIdList = new ArrayList<String>();
//
//		List<RelationTeacherVisit> list = new ArrayList<RelationTeacherVisit>();
//
//		for (int i = 0; i < taskList.size(); i++) {
//			Task task = taskList.get(i);
//			boolean flag = false;
//			for (int j = 0; j < orderIdList.size(); j++) {
//				if (orderIdList.contains(task.getOrderId())) {
//					flag = true;
//				}
//			}
//
//			if (flag) {
//				continue;
//			} else {
//				String orderId = task.getOrderId();
//				RelationTeacherVisit relationTeacherVisit = RelationTeacherVisit
//						.getRelationTeacherVisitByOrderId(orderId);
//				list.add(relationTeacherVisit);
//			}
//		}
//		
//		for (int i = 0; i < list.size(); i++) {
//			list.get(i);
//		}
//
//		return setNode(list);
//	}
}
