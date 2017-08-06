package cn.enilu.flash.common.modules.system.controller;

import cn.enilu.flash.common.aop.SystemControllerLog;
import cn.enilu.flash.common.controller.BaseController;
import cn.enilu.flash.common.modules.system.entity.Permission;
import cn.enilu.flash.common.modules.system.service.PermissionService;
import cn.enilu.flash.core.db.Pagination;
import cn.enilu.flash.core.lang.Beans;
import cn.enilu.flash.core.util.JsonResponse;
import org.joda.time.DateTime;
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
@RequestMapping("/system/permissions")
//@Permissions("permission.mgmt")
public class PermissionController extends BaseController {

	@Inject
	private PermissionService permissionService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(HttpServletRequest request, Model model) {
		Pagination<Permission> permissions = permissionService.search(getQueryForm(request));
		model.addAttribute("permissions", permissions);

		setBreadcrumb("权限管理", null);
		return "system/permissions/index";
	}

	// new是关键字，用new0代替。
	@RequestMapping(value = "new", method = RequestMethod.GET)
	public String new0(Model model) {
		model.addAttribute("permission", new Permission());
		setBreadcrumb("权限管理", "/system/permissions","新建",null);
		return "system/permissions/new";
	}

	@RequestMapping(method = RequestMethod.POST)
	@SystemControllerLog(description="创建权限")
	public String create(@Valid Permission permission, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		model.addAttribute("permission", permission);
		if (result.hasErrors()) {
			setBreadcrumb( "权限管理", "/system/permissions","新建",null);
			return "permissions/new";
		}
		permission.setUpdatedAt(DateTime.now());
		permission.setCreatedAt(DateTime.now());
		permissionService.create(permission);
		redirectAttrs.addFlashAttribute("message", "创建成功!");
		return "redirect:/system/permissions/" + permission.getId();
	}

	@RequestMapping(value = "/{id:^\\d+$}", method = RequestMethod.GET)
	public String show(@PathVariable("id") Long id, Model model) {
		Permission permission = permissionService.find(id);
		model.addAttribute("permission", permission);
		setBreadcrumb( "权限管理", "/system/permissions", permission.getDescription(), null);
		return "system/permissions/show";
	}

	@RequestMapping(value = "/{id:^\\d+$}/edit", method = RequestMethod.GET)
	public String edit(@PathVariable("id") Long id, Model model) {
		Permission permission = permissionService.find(id);
		model.addAttribute("permission", permission);
		setBreadcrumb( "权限管理", "/system/permissions","编辑"+permission.getDescription(),null);
		return "system/permissions/edit";
	}

	@RequestMapping(value = "/{id:^\\d+$}", method = RequestMethod.PUT)
	@SystemControllerLog(description="更新权限")
	public String update(@PathVariable("id") Long id, Permission input, Model model) {
		Permission permission = permissionService.find(id); 
		Beans.extend(permission, input, "name", "description");
		permission.setUpdatedAt(DateTime.now());
		permissionService.update(permission);
		return "redirect:/system/permissions/" + id;
	}

	@RequestMapping(value = "/{id:^\\d+$}", method = RequestMethod.DELETE)

	@SystemControllerLog(description="删除权限")
	public @ResponseBody
	JsonResponse destroy(@PathVariable("id") Long id,
			RedirectAttributes redirectAttrs) {
		Permission permission = permissionService.find(id);
		permissionService.destroy(permission);
		String message = "删除成功!";
		redirectAttrs.addFlashAttribute("message", message);

		return new JsonResponse(true, message);
	}

}
