package com.foreign.app.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.snaker.engine.access.QueryFilter;
import org.snaker.engine.entity.Task;

import com.foreign.app.bean.ApprovalState;
import com.foreign.app.common.FlowCommon;
import com.foreign.app.model.FlowApproval;
import com.foreign.app.model.FormTeacherBasic;
import com.foreign.app.model.FormTeacherFamily;
import com.foreign.app.model.SysLevel;
import com.foreign.app.model.SysUser;
import com.foreign.app.service.ApplyService;
import com.foreign.app.utils.BaseController;
import com.foreign.app.utils.JsonUtil;
import com.foreign.app.utils.MessageBean;
import com.foreign.app.utils.VisitGenerate;

public class ApplyController extends BaseController {

	private ApplyService applyService = new ApplyService();

	// 个人出境申请
	public void newApply() {

		String t_work_id = getUserWorkId();

		FormTeacherBasic formTeacherBasic = FormTeacherBasic
				.getTeacherByWorkId(t_work_id);

		setAttr("formTeacherBasic", formTeacherBasic);

		setAttr("readonly", false);

		render("newApply.jsp");
	}

	// 家庭信息
	public void getTeacherFamilyJsonList() {

		Map<String, Object> map = new HashMap<String, Object>();

		String t_work_id = getPara("t_work_id");

		List<FormTeacherFamily> list = FormTeacherFamily
				.getTeacherFamilyByWorkId(t_work_id);

		map.put("rows", list);

		renderJson(map);

	}

	// 提交个人出境申请
	public void saveApply() {

		SysUser loginUser = getLoginUser();

		String t_work_id = loginUser.getStr("t_work_id");

		String orderId = applyService.saveApplyFlow(loginUser);

		/** 流程数据构造结束 */

		FormTeacherBasic teacherBasic = getModel(FormTeacherBasic.class);

		applyService.saveOrUpadteFormTeacherBasic(teacherBasic, t_work_id);

		String visit_no = VisitGenerate.getVisitNo(applyService.getEngine());

		String visit_summary = VisitGenerate.getVisitSummary(
				teacherBasic.getStr("t_b_name"), "美国", "访问学者");

		applyService.saveRelationTeacherVisit(loginUser, orderId, visit_no,
				visit_summary);

		// 返回json 数据
		MessageBean messageBean = new MessageBean();

		messageBean.setFlag(true);

		renderJson(messageBean);
	}

	public void updateApply() {

		SysUser loginUser = getLoginUser();

		String t_work_id = loginUser.getStr("t_work_id");

		String orderId = getPara("orderId");

		System.out.println(orderId);

		List<Task> list = applyService.getEngine().query()
				.getActiveTasks(new QueryFilter().setOrderId(orderId));

		if (list != null && list.size() > 0) {

			String taskId = list.get(0).getId();

			// 更新流程数据

			applyService.updateApplyFlow(loginUser, taskId);

			FlowApproval approval = FlowApproval.findByOrderIdAndTaskKey(
					orderId, FlowCommon.INTERNALSTAFF);

			if (approval != null) {
				approval.delete();
			}

		}

		// 保存业务数据

		FormTeacherBasic teacherBasic = getModel(FormTeacherBasic.class);

		applyService.saveOrUpadteFormTeacherBasic(teacherBasic, t_work_id);

		// applyService.updateApproval(orderId);

		String visit_summary = VisitGenerate.getVisitSummary(
				teacherBasic.getStr("t_b_name"), "美国", "访问学者");

		applyService.saveRelationTeacherVisit(loginUser, orderId, null,
				visit_summary);

		renderMessage();

	}

	// 待批申请
	public void toBeApprove() {

		SysUser loginUser = getLoginUser();

		int t_level = loginUser.getUserLevel();

		boolean isLarge = SysLevel.isLargerOrEqualChieifLearder(t_level);
		if (isLarge) {
			render("chiefToBeApprove.jsp");
		} else {
			render("toBeApprove.jsp");
		}

	}

	public void approved() {
		render("approved.jsp");
	}

	// 撤销申请
	public void deleteApply() {

		String orderId = getPara("orderId");

		applyService.deleteApply(orderId);

		renderMessage();

	}

	// 待批列表
	public void getTeacherApplyList() {

		Map<String, Object> map = new HashMap<String, Object>();

		List<ApprovalState> approvalNodeList = applyService
				.getTeacherApplyList(getOperator());

		map.put("rows", approvalNodeList);

		// 转成json字符串
		String jsonStr = JsonUtil.objectToJson(map);

		renderJson(jsonStr);
	}

	// 已批申请列表
	public void getTeacherApprovedList() {

		Map<String, Object> map = new HashMap<String, Object>();

		List<ApprovalState> approvalNodeList = applyService
				.getTeacherApprovedList(getOperator());

		map.put("rows", approvalNodeList);

		// 转成json字符串
		String jsonStr = JsonUtil.objectToJson(map);

		renderJson(jsonStr);
	}

	public void editApply() {

		FormTeacherBasic formTeacherBasic = FormTeacherBasic
				.getTeacherByWorkId(getUserWorkId());

		if (formTeacherBasic != null) {
			setAttr("formTeacherBasic", formTeacherBasic);
		}

		String orderId = getPara("orderId");

		List<Task> list = applyService
				.getEngine()
				.query()
				.getActiveTasks(
						new QueryFilter().setOrderId(orderId).setOperator(
								getOperator()));
		
		

		if (list != null && list.size() > 0) {
			setAttr("isOpen", true);
		} else {
			setAttr("isOpen", false);
		}

		keepPara();

		List<FlowApproval> approvalList = FlowApproval.findByOrderId(orderId);

		setAttr("approvalList", approvalList);

		render("applyView.jsp");
	}

}
