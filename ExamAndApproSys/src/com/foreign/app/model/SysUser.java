package com.foreign.app.model;

import com.jfinal.plugin.activerecord.Model;

public class SysUser extends Model<SysUser> {
	private static final long serialVersionUID = 1L;
	private static final String SYS_USER = "sys_user";
	public final static SysUser dao = new SysUser();

	// 查找用户
	public static SysUser getUser(String username, String password) {

		// 设置查找语句
		String sql = "Select * From " + SYS_USER + " Where user_name = '"
				+ username + "' and user_password = '" + password + "'";

		// 数据库查找
		return SysUser.dao.findFirst(sql);
	}

	public static SysUser getUserByName(String username) {
		// 设置查找语句
		String sql = "Select * From " + SYS_USER + " Where user_name = '"
				+ username + "'";

		return SysUser.dao.findFirst(sql);

	}

	public static SysUser getUserByRoleNo(int role_no) {
		// 设置查找语句
		String sql = "Select * From " + SYS_USER + " Where role_no = "
				+ role_no;

		return SysUser.dao.findFirst(sql);

	}

	public static String getWorkIdByUserName(String userName) {
		String sql = "select * from " + SYS_USER + " where user_name = '"
				+ userName + "'";

		SysUser sysUser = dao.findFirst(sql);

		if (sysUser != null) {
			return sysUser.getStr("t_work_id");
		}

		return "";
	}

	public SysUnit getSysUnit() {
		int unitId = 0;

		unitId = this.get("unit_id");

		SysUnit sysUnit = SysUnit.dao.findById(unitId);

		return sysUnit;
	}

	// 得到用户所属部门
	public Integer getUserLevel() {
		String t_work_id = this.getStr("t_work_id");

		FormTeacherBasic teacher = FormTeacherBasic
				.getTeacherByWorkId(t_work_id);

		int t_b_level = 0;

		if (teacher != null) {
			t_b_level = teacher.get("t_b_level");
		}

		return t_b_level;
	}
	
	

}
