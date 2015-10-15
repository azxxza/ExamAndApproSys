package com.foreign.app.model;

import com.jfinal.plugin.activerecord.Model;

public class SysRole extends Model<SysRole> {

	private static final long serialVersionUID = 1L;

	public final static SysRole dao = new SysRole();

	private static final String SYS_ROLE = "sys_role";

	public static String getRoleName(int role_no) {
		String sql = "select * from " + SYS_ROLE + " where role_no = "
				+ role_no;

		SysRole sysRole = dao.findFirst(sql);

		String roleName = "";
		if (sysRole != null) {
			roleName = sysRole.getStr("role_name");
		}

		return roleName;
	}

}
