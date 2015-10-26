package com.foreign.app.utils;

import com.foreign.app.model.SysUser;
import com.jfinal.core.Controller;

/**
 * 公共的Controller类
 * 
 * @author azx
 * 
 */
public class BaseController extends Controller {

	// 登录用户存放的key值
	public static final String SessionUser = "loginUser";

	protected String getUserWorkId() {
		String t_work_id = "";
		SysUser user = getLoginUser();

		if (user != null) {
			t_work_id = user.getStr("t_work_id");
		}

		return t_work_id;
	}

	protected SysUser getLoginUser() {
		return getSessionAttr(SessionUser);
	}

	protected String getOperator() {
		return getLoginUser().getStr("user_name");
	}

	protected int getOperatorRole() {
		return getLoginUser().getInt("role_no");
	}

	protected void renderMessage() {

		MessageBean messageBean = new MessageBean();

		messageBean.setFlag(true);

		renderJson(messageBean);
	}

}
