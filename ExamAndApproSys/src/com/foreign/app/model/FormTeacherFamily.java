package com.foreign.app.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

public class FormTeacherFamily extends Model<FormTeacherFamily> {

	private static final long serialVersionUID = 1L;
	private static final String FORM_TEACHER_FAMILY = "form_teacher_family";
	public final static FormTeacherFamily dao = new FormTeacherFamily();

	public static List<FormTeacherFamily> getTeacherFamilyByWorkId(
			String t_work_id) {
		String sql = "select * from " + FORM_TEACHER_FAMILY
				+ " where t_work_id = " + 1;

		return dao.find(sql);

	}

	public static FormTeacherFamily getTeacherFamilyById(String id) {
		return dao.findById(id);
	}

}
