package cn.enilu.flash.common.controller.system;

import cn.enilu.flash.common.controller.BaseController;
import cn.enilu.flash.common.entity.Logs;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController extends BaseController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "home";
	}

	@RequestMapping(value = "/no_permission")
	public String noPermission() {
		return "no_permission";
	}

	@RequestMapping(value = "/theme/{theme}", method = RequestMethod.GET)
	public String show(@PathVariable("theme") String theme, Model model) {
		getRequest().getSession().setAttribute("theme",theme);
		return "redirect:/";
	}
}
