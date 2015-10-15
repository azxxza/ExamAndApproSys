package com.foreign.app.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

public class SysLevel extends Model<SysLevel> {

	private static final long serialVersionUID = 1L;

	public final static SysLevel dao = new SysLevel();

	private static final String SYS_LEVEL = "sys_level";

	/**
	 * 获取级别数据字典
	 * 
	 * @return
	 */
	public static List<SysLevel> getLevelList() {
		String sql = "Select * From " + SYS_LEVEL;

		return SysLevel.dao.find(sql);

	}

	// 得到正处级编号
	public static int getChiefLeaderNo() {
		String sql = "select * from " + SYS_LEVEL + " where l_name = '正处级'";

		SysLevel level = SysLevel.dao.findFirst(sql);

		if (level != null) {
			return level.getInt("l_no");
		} else {
			return 0;
		}
	}

	public static boolean isLargerOrEqualChieifLearder(int l_no) {
		if (l_no <= getChiefLeaderNo()) {
			return true;
		} else {
			return false;
		}

	}

}
