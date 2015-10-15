package com.foreign.app.utils;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.foreign.app.model.SysUser;

public class PrivilegeTag extends TagSupport {

	private static final String menu_apply = "menu_apply";

	private static final String menu_approval = "menu_approval";

	private static final String menu_chief = "menu_chief";

	/**
	 * 添加用户，
	 */
	private static final long serialVersionUID = 1L;
	private String powerName;

	public String getPowerName() {
		return powerName;
	}

	public void setPowerName(String powerName) {
		this.powerName = powerName;
	}

	@Override
	public int doStartTag() throws JspException {

		if (powerName == null || powerName.equals("")) {
			throw new RuntimeException();
		}

		HttpSession session = pageContext.getSession();

		SysUser user = (SysUser) session.getAttribute("loginUser");
		if (user != null) {
			int role_no = user.getInt("role_no");

			if (role_no == RoleCommon.TEACHER && powerName.equals(menu_apply)) {
				return EVAL_PAGE;
			}

			if (role_no != RoleCommon.TEACHER
					&& powerName.equals(menu_approval)) {
				return EVAL_PAGE;
			}

			if (role_no == RoleCommon.INTERNALCHIEF
					&& powerName.equals(menu_chief)) {
				return EVAL_PAGE;
			}

		}

		return SKIP_BODY;

	}

	@Override
	public int doEndTag() throws JspException {

		return EVAL_PAGE;

	}

}
