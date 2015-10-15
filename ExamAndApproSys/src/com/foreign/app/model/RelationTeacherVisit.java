package com.foreign.app.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;

public class RelationTeacherVisit extends Model<RelationTeacherVisit> {

	private static final long serialVersionUID = 1L;
	private static final String RELATION_TEACHER_VISIT = "relation_teacher_visit";
	public final static RelationTeacherVisit dao = new RelationTeacherVisit();

	public static int getVisitCountByWorkId(String t_work_id) {
		String sql = "select count(1) from " + RELATION_TEACHER_VISIT
				+ " where t_work_id = " + t_work_id;

		Long count = Db.queryLong(sql);

		if (count != null) {
			return count.intValue();
		}

		return 0;

	}

	public static RelationTeacherVisit getTeacherVisitByOrderIdAndTaskId(
			String orderId, String taskId) {
		String sql = "select * from " + RELATION_TEACHER_VISIT
				+ " where order_id = " + orderId + " and task_id = " + taskId;

		return dao.findFirst(sql);

	}

	public static String getVisitNoByOrderId(String orderId) {

		RelationTeacherVisit relationTeacherVisit = getRelationTeacherVisitByOrderId(orderId);

		if (relationTeacherVisit != null) {
			return relationTeacherVisit.getStr("visit_no");
		}

		return "";
	}

	public static RelationTeacherVisit getRelationTeacherVisitByOrderId(
			String orderId) {
		String sql = "select * from " + RELATION_TEACHER_VISIT
				+ " where order_id = '" + orderId + "'";

		return dao.findFirst(sql);
	}

	public static String getVisitSummaryByOrderId(String orderId) {
		String sql = "select * from " + RELATION_TEACHER_VISIT
				+ " where order_id = '" + orderId + "'";

		RelationTeacherVisit relationTeacherVisit = dao.findFirst(sql);

		if (relationTeacherVisit != null) {
			return relationTeacherVisit.getStr("visit_summary");
		}

		return "";
	}

	public static List<RelationTeacherVisit> getHasApprovedList(String operator) {
		String t_work_id = SysUser.getWorkIdByUserName(operator);

		String sql = "select * from " + RELATION_TEACHER_VISIT
				+ " where t_work_id = " + t_work_id + " and result != '2'";

		return dao.find(sql);

	}

	public static List<RelationTeacherVisit> getRemainApproveList(
			String operator) {
		String t_work_id = SysUser.getWorkIdByUserName(operator);

		String sql = "select * from " + RELATION_TEACHER_VISIT
				+ " where t_work_id = " + t_work_id + " and result = '2'";

		return dao.find(sql);
	}

}
