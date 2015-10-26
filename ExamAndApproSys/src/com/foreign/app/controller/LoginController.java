package com.foreign.app.controller;

import com.foreign.app.model.SysUser;
import com.foreign.app.utils.BaseController;
import com.foreign.app.utils.MessageBean;

public class LoginController extends BaseController {

	public void login() {
		render("login.jsp");
	}

	public void doLogin() {
		MessageBean messageBean = new MessageBean();
		// 获取数据
		String username = getPara("username");
		String password = getPara("password");
		// 数据库查找
		SysUser loginUser = SysUser.getUser(username, password);
		
		if (loginUser != null) {
			setSessionAttr(SessionUser, loginUser);// 设置当前登录用户
			messageBean.setFlag(true);
		} else {
			messageBean.setFlag(false);
			messageBean.setMessage("用户名或者密码不正确！");
		}

		renderJson(messageBean);
	}

	public void doLoginTest() {
		
		String username = getPara("username");

		SysUser loginUser = SysUser.getUserByName(username);

		setSessionAttr(SessionUser, loginUser);// 设置当前登录用户

		redirect("/index");

	}

	public void logout() {
		if (getSessionAttr(SessionUser) != null) {
			removeSessionAttr(SessionUser);
		}
		redirect("/loginController/login");
	}
}
