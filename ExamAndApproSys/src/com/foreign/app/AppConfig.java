package com.foreign.app;

import org.snaker.engine.SnakerEngine;
import org.snaker.engine.entity.Process;
import org.snaker.engine.helper.StreamHelper;
import org.snaker.jfinal.plugin.SnakerPlugin;

import com.foreign.app.controller.ApplyController;
import com.foreign.app.controller.ApprovalController;
import com.foreign.app.controller.LevelController;
import com.foreign.app.controller.LoginController;
import com.foreign.app.controller.MaintenanceController;
import com.foreign.app.controller.ReportController;
import com.foreign.app.controller.SearchController;
import com.foreign.app.controller.SystemController;
import com.foreign.app.model.FlowApproval;
import com.foreign.app.model.FormTeacherBasic;
import com.foreign.app.model.FormTeacherFamily;
import com.foreign.app.model.FormVisitAttachment;
import com.foreign.app.model.FormVisitExtraInstruction;
import com.foreign.app.model.FormVisitFinancialBudget;
import com.foreign.app.model.FormVisitInviter;
import com.foreign.app.model.FormVisitTask;
import com.foreign.app.model.FormVisitTaskRoute;
import com.foreign.app.model.RelationTeacherVisit;
import com.foreign.app.model.SysLevel;
import com.foreign.app.model.SysRole;
import com.foreign.app.model.SysUnit;
import com.foreign.app.model.SysUser;
import com.foreign.app.model.SysUserRole;
import com.foreign.app.model.SysUserUnit;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;

/**
 * 应用总配置
 * 
 * @author yuqs
 * @since 0.1
 */
public class AppConfig extends JFinalConfig {
	/**
	 * 配置常量
	 */
	public void configConstant(Constants me) {

		loadPropertyFile("jfinal.properties");

		me.setDevMode(getPropertyToBoolean("devMode", true));

		me.setViewType(ViewType.JSP);

		me.setBaseViewPath("/jsp");

	}

	/**
	 * 配置路由
	 */
	public void configRoute(Routes me) {
		// 数据字典

		me.add("/", SystemController.class, "/system");

		me.add("/loginController", LoginController.class, "/system");

		me.add("/applyController", ApplyController.class, "/apply");

		me.add("/approvalController", ApprovalController.class, "approval");

		me.add("/searchController", SearchController.class, "statistics");

		me.add("/reportController", ReportController.class, "statistics");

		me.add("/maintenanceController", MaintenanceController.class,
				"maintenance");

		me.add("/levelController", LevelController.class);

	}

	/**
	 * 配置插件
	 */
	public void configPlugin(Plugins me) {
		// 配置C3p0数据库连接池插件
		C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl"),
				getProperty("user"), getProperty("password").trim());
		me.add(c3p0Plugin);

		// 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		me.add(arp);

		arp.addMapping("flow_approval", FlowApproval.class);

		arp.addMapping("form_teacher_basic", FormTeacherBasic.class);

		arp.addMapping("form_teacher_family", FormTeacherFamily.class);

		arp.addMapping("form_visit_task", FormVisitTask.class);

		arp.addMapping("form_visit_task_route", FormVisitTaskRoute.class);

		arp.addMapping("form_visit_inviter", FormVisitInviter.class);

		arp.addMapping("form_visit_financial_budget",
				FormVisitFinancialBudget.class);

		arp.addMapping("form_visit_attachment", FormVisitAttachment.class);

		arp.addMapping("form_visit_extra_instruction",
				FormVisitExtraInstruction.class);

		arp.addMapping("relation_teacher_visit", RelationTeacherVisit.class);

		arp.addMapping("sys_level", SysLevel.class);

		arp.addMapping("sys_role", SysRole.class);

		arp.addMapping("sys_unit", SysUnit.class);

		arp.addMapping("sys_user", SysUser.class);

		arp.addMapping("sys_user_role", "user_id, role_id", SysUserRole.class);

		arp.addMapping("sys_user_unit", "user_id, unit_id", SysUserUnit.class);

		// 配置Snaker插件
		SnakerPlugin snakerPlugin = new SnakerPlugin(c3p0Plugin,
				this.prop.getProperties());
		me.add(snakerPlugin);

	}

	/**
	 * 配置全局拦截器
	 */
	public void configInterceptor(Interceptors me) {

	}

	/**
	 * 配置处理器
	 */
	public void configHandler(Handlers me) {

	}

	public static void main(String[] args) {
		JFinal.start("WebRoot", 80, "/", 5);
	}

	// jfinal 启动时调用的方法

	@Override
	public void afterJFinalStart() {

		super.afterJFinalStart();

		initFlows();

	}

	/**
	 * 初始化审批出国留学审批流程(将流程定义写入数据库)
	 */
	private void initFlows() {
		// 通过Snaker插件获取snaker 工作流引擎
		SnakerEngine engine = SnakerPlugin.getEngine();

		Process process = engine.process().getProcessByName("approval");

		if (process == null) {
			engine.process()
					.deploy(StreamHelper
							.getStreamFromClasspath("flow/approval.snaker"));

		} else {
			engine.process()
					.redeploy(
							process.getId(),
							StreamHelper
									.getStreamFromClasspath("flow/approval.snaker"));
		}

	}
}
