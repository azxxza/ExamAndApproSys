package com.foreign.app.model;

import com.jfinal.plugin.activerecord.Model;

public class FormTeacherBasic extends Model<FormTeacherBasic> {

	private static final long serialVersionUID = 1L;
	private static final String FORM_TEACHER_BASIC = "form_teacher_basic";
	public final static FormTeacherBasic dao = new FormTeacherBasic();

	public static FormTeacherBasic getTeacherByWorkId(String t_work_id) {
		
		String sql = "select * from " + FORM_TEACHER_BASIC
				+ " where t_work_id = " + t_work_id;

		return dao.findFirst(sql);
	}

}
