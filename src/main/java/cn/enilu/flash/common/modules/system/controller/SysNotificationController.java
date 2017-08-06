package cn.enilu.flash.common.modules.system.controller;

import cn.enilu.flash.common.controller.BaseController;
import cn.enilu.flash.common.modules.system.entity.SysNotification;
import cn.enilu.flash.common.modules.system.service.SysNotificationService;
import cn.enilu.flash.core.db.Pagination;
import cn.enilu.flash.core.lang.Beans;
import cn.enilu.flash.core.util.JsonResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;


@Controller
@RequestMapping("/system/sys_notifications")
public class SysNotificationController extends BaseController {

	@Inject
	private SysNotificationService sysNotificationService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(HttpServletRequest request, Model model) {
		Pagination<SysNotification> sysNotifications = sysNotificationService.search(getQueryForm(request));
		model.addAttribute("sysNotifications", sysNotifications);
		return "system/sys_notifications/index";
	}

	// new是关键字，用new0代替。
	@RequestMapping(value = "new", method = RequestMethod.GET)
	public String new0(Model model) {
		model.addAttribute("sysNotification", new SysNotification());
		return "system/sys_notifications/new";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String create(@Valid SysNotification sysNotification, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		model.addAttribute("sysNotification", sysNotification);
		if (result.hasErrors()) {
			return "system/sys_notifications/new";
		}

		sysNotificationService.create(sysNotification);
		redirectAttrs.addFlashAttribute("message", "创建成功!");
		return "redirect:/system/sys_notifications/" + sysNotification.getId();
	}

	@RequestMapping(value = "/{id:^\\d+$}", method = RequestMethod.GET)
	public String show(@PathVariable("id") Long id, Model model) {
		SysNotification sysNotification = sysNotificationService.find(id);
		model.addAttribute("sysNotification", sysNotification);
		return "system/sys_notifications/show";
	}

	@RequestMapping(value = "/{id:^\\d+$}/edit", method = RequestMethod.GET)
	public String edit(@PathVariable("id") Long id, Model model) {
		SysNotification sysNotification = sysNotificationService.find(id);
		model.addAttribute("sysNotification", sysNotification);
		return "system/sys_notifications/edit";
	}

	@RequestMapping(value = "/{id:^\\d+$}", method = RequestMethod.PUT)
	public String update(@PathVariable("id") Long id, SysNotification input, Model model) {
		SysNotification sysNotification = sysNotificationService.find(id); 
		Beans.extend(sysNotification, input, "title", "content", "createTime");
		sysNotificationService.update(sysNotification);
		return "redirect:/system/sys_notifications/" + id;
	}

	@RequestMapping(value = "/{id:^\\d+$}", method = RequestMethod.DELETE)
	public @ResponseBody
	JsonResponse destroy(@PathVariable("id") Long id,
						 RedirectAttributes redirectAttrs) {
		SysNotification sysNotification = sysNotificationService.find(id);
		sysNotificationService.destroy(sysNotification);
		String message = "删除成功!";
		redirectAttrs.addFlashAttribute("message", message);

		return new JsonResponse(true, message);
	}

}
