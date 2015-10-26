package com.foreign.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.snaker.engine.IQueryService;
import org.snaker.engine.access.Page;
import org.snaker.engine.access.QueryFilter;
import org.snaker.engine.entity.WorkItem;

import com.foreign.app.bean.ApprovalState;
import com.foreign.app.common.FlowCommon;
import com.foreign.app.model.FlowApproval;
import com.foreign.app.model.FormTeacherBasic;
import com.foreign.app.service.ApprovalService;
import com.foreign.app.utils.BaseController;
import com.foreign.app.utils.RoleCommon;

public class ApprovalController extends BaseController {

	private ApprovalService approvalService = new ApprovalService();

	public void editApprove() {

		String orderId = getPara("orderId");
		String taskKey = getPara("taskKey");
		setAttr("orderId", orderId);
		setAttr("taskKey", taskKey);

		render("applyView.jsp");
	}

	// 待批申请
	public void approve_toBe() {
		render("approve_toBe.jsp");
	}

	// 已批申请
	public void approve_ed() {
		render("approve_ed.jsp");
	}

	// 待批申请 json 数据
	public void getApprove_toBeJsonList() {

//		String operator = getOperator();
//
//		List<ApprovalState> remainApproveList = approvalService
//				.getApprovalToBeList(operator);
//
//		Map<String, Object> map = new HashMap<String, Object>();
//
//		map.put("rows", remainApproveList);
//
//		renderJson(map);
	}

	// 已批申请 json 数据
	public void getTeacherApprovedList() {

		IQueryService queryService = approvalService.getEngine().query();

		Page<WorkItem> majorPage = new Page<WorkItem>();

		List<WorkItem> list = queryService.getWorkItems(majorPage,
				new QueryFilter().setOperator(getOperator()));

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("rows", list);

		renderJson(map);
	}

	// 查看详情并审批
	public void processDetail() {

		keepPara();

		String orderId = getPara("orderId");

		String t_work_id = getPara("t_work_id");
		
		System.out.println(t_work_id);

		if (t_work_id != null) {
			FormTeacherBasic formTeacherBasic = FormTeacherBasic
					.getTeacherByWorkId(t_work_id);

			setAttr("formTeacherBasic", formTeacherBasic);
		}
		
		int role = getOperatorRole();

//		switch (role) {
//		case RoleCommon.UNIT: {
//			setAttr("isOpen", false);
//			break;
//		}
//
//		case RoleCommon.INTERNALSTAFF: {
//			setAttr("isOpen", true);
//			break;
//		}
//
//		case RoleCommon.INTERNALCHIEF: {
//			setAttr("isOpen", true);
//			break;
//		}
//
//		case RoleCommon.FINANCIAL: {
//			setAttr("isOpen", true);
//			break;
//		}
//
//		case RoleCommon.FUNDSSOURCE: {
//			setAttr("isOpen", true);
//			break;
//		}
//
//		case RoleCommon.DISCIPLINE: {
//			setAttr("isOpen", false);
//			break;
//		}
//
//		case RoleCommon.BUSINESSLEADER: {
//			setAttr("isOpen", false);
//			break;
//		}
//
//		case RoleCommon.INTERNALLEADER: {
//			setAttr("isOpen", false);
//			break;
//		}
//
//		case RoleCommon.PARTYSECRETARY: {
//			setAttr("isOpen", true);
//			break;
//		}
//
//		default:
//			break;
//		}

		List<FlowApproval> approvalList = FlowApproval.findByOrderId(orderId);

		setAttr("approvalList", approvalList);

		render("applyView.jsp");
	}

	public void processApply() {
		String operator = getOperator();
		int roleId = getLoginUser().getInt("role_no");

		switch (roleId) {

//		case RoleCommon.UNIT: {
//
//			unitApprove(operator);
//			break;
//		}
//
//		case RoleCommon.INTERNALSTAFF: {
//
//			internalStaffApprove(operator);
//			break;
//		}
//
//		case RoleCommon.INTERNALCHIEF: {
//			internalChiefApprove(operator);
//			break;
//		}
//
//		case RoleCommon.FINANCIAL: {
//			financeApprove(operator);
//			break;
//		}
//
//		case RoleCommon.FUNDSSOURCE: {
//			fundsSourceApprove(operator);
//			break;
//		}
//
//		case RoleCommon.DISCIPLINE: {
//			disciplineApprove(operator);
//			break;
//		}
//
//		case RoleCommon.BUSINESSLEADER: {
//			businessLeaderApprove(operator);
//			break;
//		}
//
//		case RoleCommon.INTERNALLEADER: {
//			internalLeaderApprove(operator);
//			break;
//		}
//
//		case RoleCommon.PARTYSECRETARY: {
//			partySecretaryApprove(operator);
//			break;
//		}

		default: {
			break;
		}
		}

		renderMessage();
	}

//	// 单位审批
//	public void unitApprove(String operator) {
//
//		FlowApproval approval = getModel(FlowApproval.class, "approval");
//
//		String orderId = approval.getStr("orderId");
//
//		approvalService.saveApproval(approval, FlowCommon.UNIT, operator);
//
//		approvalService.unitApprove(approval, operator, orderId);
//
//	}
//
//	// 国际处工作人员审批
//	public void internalStaffApprove(String operator) {
//
//		FlowApproval approval = getModel(FlowApproval.class, "approval");
//
//		String orderId = approval.getStr("orderId");
//
//		approvalService.saveApproval(approval, FlowCommon.INTERNALSTAFF,
//				operator);
//
//		approvalService.internalStaffApprove(approval, operator, orderId);
//
//	}
//
//	// 国际处长审批
//	public void internalChiefApprove(String operator) {
//
//		FlowApproval approval = getModel(FlowApproval.class, "approval");
//
//		String orderId = approval.get("orderId");
//
//		approvalService.saveApproval(approval, FlowCommon.INTERNALCHIEF,
//				operator);
//
//		approvalService.internalChiefApprove(approval, operator, orderId);
//
//	}
//
//	// 财务处审批
//	public void financeApprove(String operator) {
//
//		FlowApproval approval = getModel(FlowApproval.class, "approval");
//
//		String orderId = approval.getStr("orderId");
//
//		approvalService.saveApproval(approval, FlowCommon.FINANCIAL, operator);
//
//		approvalService.financeApprove(approval, operator, orderId);
//
//	}
//
//	// 经费来源部门审批
//	public void fundsSourceApprove(String operator) {
//
//		FlowApproval approval = getModel(FlowApproval.class, "approval");
//
//		String orderId = approval.getStr("orderId");
//
//		approvalService
//				.saveApproval(approval, FlowCommon.FUNDSSOURCE, operator);
//
//		approvalService.fundsSourceApprove(approval, operator, orderId);
//
//	}
//
//	// 纪监审部门处理流程
//	public void disciplineApprove(String operator) {
//
//		FlowApproval approval = getModel(FlowApproval.class, "approval");
//
//		String orderId = approval.get("orderId");
//
//		approvalService.saveApproval(approval, FlowCommon.DISCIPLINE, operator);
//
//		approvalService.disciplineApprove(approval, operator, orderId);
//
//	}
//
//	// 业务分管校领导审批
//	public void businessLeaderApprove(String operator) {
//
//		FlowApproval approval = getModel(FlowApproval.class, "approval");
//
//		String orderId = approval.get("orderId");
//
//		approvalService.saveApproval(approval, FlowCommon.BUSINESSLEADER,
//				operator);
//
//		approvalService.businessLeaderApprove(approval, operator, orderId);
//
//	}
//
//	// 分管外事校领导审批
//	public void internalLeaderApprove(String operator) {
//
//		FlowApproval approval = getModel(FlowApproval.class, "approval");
//
//		String orderId = approval.get("orderId");
//
//		approvalService.saveApproval(approval, FlowCommon.INTERNALLEADER,
//				operator);
//
//		approvalService.internalLeaderApprove(approval, operator, orderId);
//
//	}
//
//	// 校党委书记审批
//	public void partySecretaryApprove(String operator) {
//
//		FlowApproval approval = getModel(FlowApproval.class, "approval");
//
//		String orderId = approval.getStr("orderId");
//
//		approvalService.saveApproval(approval, FlowCommon.PARTYSECRETARY,
//				operator);
//
//		approvalService.partySecretaryApprove(approval, operator, orderId);
//
//	}

}
