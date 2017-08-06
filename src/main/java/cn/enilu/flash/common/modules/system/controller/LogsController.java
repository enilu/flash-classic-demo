package cn.enilu.flash.common.modules.system.controller;

import cn.enilu.flash.common.controller.BaseController;
import cn.enilu.flash.core.db.Pagination;
import cn.enilu.flash.common.modules.system.entity.Logs;
import cn.enilu.flash.common.modules.system.service.LogsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/system/logss")
//@Permissions("logs.mgmt")
public class LogsController extends BaseController {

	@Inject
	private LogsService logsService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(HttpServletRequest request, Model model) {
		Pagination<Logs> logss = logsService.search(getQueryForm(request));
		model.addAttribute("logss", logss);

		setBreadcrumb( "日志管理", null);
		return "system/logss/index";
	}


	@RequestMapping(value = "/{id:^\\d+$}", method = RequestMethod.GET)
	public String show(@PathVariable("id") Long id, Model model) {
		Logs logs = logsService.find(id);
		model.addAttribute("logs", logs);

		setBreadcrumb( "日志管理", "/system/logss", logs.getAction(),null);
		return "system/logss/show";
	}


}
