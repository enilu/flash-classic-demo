package cn.enilu.flash.common.controller;

import cn.enilu.flash.core.db.Pagination;
import cn.enilu.flash.common.entity.Logs;
import cn.enilu.flash.common.service.LogsService;
import cn.enilu.flash.web.auth.annotation.Permissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/logss")
//@Permissions("logs.mgmt")
public class LogsController extends BaseController {

	@Inject
	private LogsService logsService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(HttpServletRequest request, Model model) {
		Pagination<Logs> logss = logsService.search(getQueryForm(request));
		model.addAttribute("logss", logss);

		setBreadcrumb( "日志管理", null);
		return "logss/index";
	}


	@RequestMapping(value = "/{id:^\\d+$}", method = RequestMethod.GET)
	public String show(@PathVariable("id") Long id, Model model) {
		Logs logs = logsService.find(id);
		model.addAttribute("logs", logs);

		setBreadcrumb( "日志管理", "/logss", logs.getAction(),null);
		return "logss/show";
	}


}
