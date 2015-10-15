package com.foreign.app.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;

/**
 * 审批节点模型
 * @author Administrator
 *
 */
public class FlowApproval extends Model<FlowApproval> {

	private static final long serialVersionUID = 1L;

	public static final FlowApproval dao = new FlowApproval();

	public static FlowApproval findByOrderIdAndTaskKey(String orderId,
			String taskKey) {
		return dao
				.findFirst(
						"select * from flow_approval where orderId = ? and taskKey = ?",
						orderId, taskKey);
	}

	public static List<FlowApproval> findByOrderId(String orderId) {
		String sql = "select * from flow_approval where orderId = '" + orderId
				+ "' order by operateTime ASC";

		List<FlowApproval> list = dao.find(sql);

		for (int i = 0; i < list.size(); i++) {
			String operator = list.get(i).getStr("operator");
			SysUser sysUser = SysUser.getUserByName(operator);
			int role_no = sysUser.getInt("role_no");
			String operator_role = SysRole.getRoleName(role_no);
			list.get(i).put("operator_role", operator_role);
		}
		return list;
	}

	public static void changeNoPassToNoExam(String orderId) {
		String sql = "update flow_approval set result = '2' where orderId = "
				+ orderId + " and result = 0";
		Db.update(sql);
	}

}
