package com.foreign.app.utils;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.foreign.app.model.SysUser;
import com.foreign.app.model.SysUserRole;

public class PrivilegeTag extends TagSupport {

	// 申请人
	private static final String APPLY_VIEW = "apply_view";

	private static final String APPLY_MENU = "apply_menu";

	// 预审人员拥有的菜单
	private static final String PRE_APPROVAL_VIEW = "pre_approval_view";

	// 审批人员拥有的菜单
	private static final String APPROVAL_VIEW = "approval_view";

	private static final String APPROVAL_MENU = "approval_menu";

	// 管理人员
	private static final String ADMIN_VIEW = "admin_view";

	private static final String ADMIN_MENU = "admin_menu";

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
			int roleId = SysUserRole.getRoleIdByUserId(user.getInt("id"));

			if (roleId == RoleCommon.APPLY_USER && powerName.equals(APPLY_VIEW)) {
				return EVAL_PAGE;
			}

			if (roleId == RoleCommon.PRE_APPROVAL_USER
					&& powerName.equals(PRE_APPROVAL_VIEW)) {
				return EVAL_PAGE;
			}

			if (roleId == RoleCommon.APPROVAL_USER
					&& powerName.equals(APPROVAL_VIEW)) {
				return EVAL_PAGE;
			}

			if (roleId == RoleCommon.ADMIN && powerName.equals(ADMIN_VIEW)) {
				return EVAL_PAGE;
			}

			if ((roleId == RoleCommon.PRE_APPROVAL_USER || roleId == RoleCommon.APPROVAL_USER)
					&& powerName.equals(APPROVAL_MENU)) {
				return EVAL_PAGE;
			}
			if ((roleId == RoleCommon.APPLY_USER)
					&& powerName.equals(APPLY_MENU)) {
				return EVAL_PAGE;
			}
			if ((roleId == RoleCommon.ADMIN) && powerName.equals(ADMIN_MENU)) {
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
