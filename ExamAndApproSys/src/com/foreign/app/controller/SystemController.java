package com.foreign.app.controller;

import com.foreign.app.model.SysUser;
import com.foreign.app.utils.BaseController;

public class SystemController extends BaseController {

	public void index() {
		
		SysUser user = getSessionAttr(SessionUser);
		if (user == null) {
			redirect("/loginController/login");
		} else {
			render("index.jsp");

		}

	}

	public void welcome() {
		render("welcome.jsp");
	}

}
