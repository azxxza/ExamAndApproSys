package com.foreign.app.controller;

import java.util.List;

import com.foreign.app.model.SysLevel;
import com.foreign.app.utils.BaseController;

public class LevelController extends BaseController {
	/**
	 * 部门列表
	 */
	public void getLevelList() {
		List<SysLevel> levelList = SysLevel.getLevelList();
		renderJson(levelList);
	}

}
