/*
 *  Copyright 2014-2015 snakerflow.com
 *  *
 *  * Licensed under the Apache License, Version 2.0 (the "License");
 *  * you may not use this file except in compliance with the License.
 *  * You may obtain a copy of the License at
 *  *
 *  *     http://www.apache.org/licenses/LICENSE-2.0
 *  *
 *  * Unless required by applicable law or agreed to in writing, software
 *  * distributed under the License is distributed on an "AS IS" BASIS,
 *  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  * See the License for the specific language governing permissions and
 *  * limitations under the License.
 *
 */
package com.framework.flow.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.snaker.engine.SnakerEngine;
import org.snaker.engine.access.QueryFilter;
import org.snaker.engine.entity.Order;
import org.snaker.engine.entity.Task;
import org.snaker.engine.entity.WorkItem;
import org.snaker.jfinal.plugin.SnakerPlugin;

import com.foreign.app.bean.ApprovalState;
import com.foreign.app.common.FlowCommon;
import com.foreign.app.model.FlowApproval;
import com.foreign.app.model.RelationTeacherVisit;
import com.foreign.app.model.SysUser;

/**
 * 流程控制器父类，主要提供常用的流程api
 * 
 * @author yuqs
 * @since 0.1
 */
public class SnakerService {

	protected static final String PROCESS_NAME = "approval";

	protected static final int VERSION = 0;

	/**
	 * 通过插件获取流程引擎入口
	 */
	protected SnakerEngine engine = SnakerPlugin.getEngine();

	/**
	 * 获取引擎
	 * 
	 * @return
	 */
	public SnakerEngine getEngine() {
		return engine;
	}

	public Order startInstanceByName(String operator, Map<String, Object> args) {
		return engine
				.startInstanceByName(PROCESS_NAME, VERSION, operator, args);
	}

	// 启动流程并执行第一个任务
	public Order startAndExecute(String operator, Map<String, Object> params) {
		Order order = engine.startInstanceByName(PROCESS_NAME, VERSION,
				operator, params);

		List<Task> tasks = engine.query().getActiveTasks(
				new QueryFilter().setOrderId(order.getId()));
		if (tasks != null && tasks.size() > 0) {
			
			Task task = tasks.get(0);

			execute(task.getId(), operator, params);

		}
		return order;
	}

	// 执行任务
	public List<Task> execute(String taskId, String operator,
			Map<String, Object> params) {
		return engine.executeTask(taskId, operator, params);
	}

	// 驳回，任意跳转
	public List<Task> executeAndJump(String taskId, String operator,
			Map<String, Object> params, String nodeName) {
		return engine.executeAndJumpTask(taskId, operator, params, nodeName);
	}

	protected List<ApprovalState> setNode(List<RelationTeacherVisit> list) {

		List<ApprovalState> remainApproveList = new ArrayList<ApprovalState>();

		for (int i = 0; i < list.size(); i++) {

			RelationTeacherVisit relationTeacherVisit = list.get(i);

			ApprovalState approvalNode = new ApprovalState();

			String orderId = relationTeacherVisit.getStr("order_id");

			approvalNode.setOrderId(orderId);

			String workId = relationTeacherVisit.getStr("t_work_id");

			approvalNode.setWorkId(workId);

			String visitNo = relationTeacherVisit.getStr("visit_no");

			approvalNode.setVisitNo(visitNo);

			String visitSummary = relationTeacherVisit.getStr("visit_summary");

			approvalNode.setVisitSummary(visitSummary);

			String result = relationTeacherVisit.getStr("result");

			approvalNode.setResult(result);

			approvalNode = setRemainApproveNodeState(orderId, approvalNode);

			remainApproveList.add(approvalNode);

		}

		return remainApproveList;
	}

	private ApprovalState setRemainApproveNodeState(String orderId,
			ApprovalState remainApprove) {
		// 所在单位
		FlowApproval unit = FlowApproval.findByOrderIdAndTaskKey(orderId,
				FlowCommon.UNIT);

		if (unit != null) {
			unit.getBoolean("result");
			remainApprove.setUnitResult("");
		}

		// 国际处工作人员
		FlowApproval staff = FlowApproval.findByOrderIdAndTaskKey(orderId,
				FlowCommon.INTERNALSTAFF);

		if (staff != null) {
			remainApprove.setInternalStaffResult(staff.getBoolean("result").toString());
		}

		// 国际处长
		FlowApproval chief = FlowApproval.findByOrderIdAndTaskKey(orderId,
				FlowCommon.INTERNALCHIEF);

		if (chief != null) {
			remainApprove.setInternalChiefResult(chief.getBoolean("result").toString());
		}
		// 财务处
		FlowApproval finance = FlowApproval.findByOrderIdAndTaskKey(orderId,
				FlowCommon.FINANCIAL);
		if (finance != null) {
			remainApprove.setFinanceResult(finance.getBoolean("result").toString());
		}
		// 经费来源部门
		FlowApproval fundsSource = FlowApproval.findByOrderIdAndTaskKey(
				orderId, FlowCommon.FUNDSSOURCE);
		if (fundsSource != null) {
			remainApprove.setFundsSourceResult(fundsSource.getBoolean("result").toString());
		}

		// 纪监审部门
		FlowApproval discipline = FlowApproval.findByOrderIdAndTaskKey(orderId,
				FlowCommon.DISCIPLINE);
		if (discipline != null) {
			remainApprove.setDisciplineResult(discipline.getBoolean("result").toString());
		}

		// 分管业务校领导
		FlowApproval businessLeader = FlowApproval.findByOrderIdAndTaskKey(
				orderId, FlowCommon.BUSINESSLEADER);
		if (businessLeader != null) {
			remainApprove.setBusinessLeaderResult(businessLeader
					.getBoolean("result").toString());
		}

		// 分管外事校领导

		FlowApproval internalLeader = FlowApproval.findByOrderIdAndTaskKey(
				orderId, FlowCommon.INTERNALLEADER);
		if (internalLeader != null) {

			remainApprove.setInternalLeaderResult(internalLeader
					.getBoolean("result").toString());
		}
		// 校党委书记
		FlowApproval partySecretary = FlowApproval.findByOrderIdAndTaskKey(
				orderId, FlowCommon.PARTYSECRETARY);
		if (partySecretary != null) {
			remainApprove.setPartySecretaryResult(partySecretary
					.getBoolean("result").toString());
		}

		return remainApprove;
	}

	protected ApprovalState getRemainApprove(WorkItem workItem) {

		String orderId = workItem.getOrderId();

		ApprovalState remainApprove = new ApprovalState();

		String userName = workItem.getCreator();

		String t_work_id = SysUser.getWorkIdByUserName(userName);

		remainApprove.setOrderId(orderId);

		remainApprove.setWorkId(t_work_id);

		String orderNo = workItem.getOrderNo();

		remainApprove.setVisitNo(orderNo);

		String visitSummary = RelationTeacherVisit
				.getVisitSummaryByOrderId(orderId);

		remainApprove.setVisitSummary(visitSummary);

		remainApprove = setRemainApproveNodeState(orderId, remainApprove);

		return remainApprove;

	}

}
