package cn.enilu.flash.common.controller;

import cn.enilu.flash.common.entity.Permission;
import cn.enilu.flash.common.service.PermissionService;
import cn.enilu.flash.core.db.Pagination;
import cn.enilu.flash.core.lang.Beans;
import cn.enilu.flash.core.util.JsonResponse;
import cn.enilu.flash.web.auth.annotation.Permissions;
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
@RequestMapping("/permissions")
//@Permissions("permission.mgmt")
public class PermissionController extends BaseController {

	@Inject
	private PermissionService permissionService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(HttpServletRequest request, Model model) {
		Pagination<Permission> permissions = permissionService.search(getQueryForm(request));
		model.addAttribute("permissions", permissions);

		setBreadcrumb("首页", "/", "权限管理", null);
		return "permissions/index";
	}

	// new是关键字，用new0代替。
	@RequestMapping(value = "new", method = RequestMethod.GET)
	public String new0(Model model) {
		model.addAttribute("permission", new Permission());
		setBreadcrumb("首页", "/", "权限管理", "/permissions","新建",null);
		return "permissions/new";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String create(@Valid Permission permission, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		model.addAttribute("permission", permission);
		if (result.hasErrors()) {
			setBreadcrumb("首页", "/", "权限管理", "/permissions","新建",null);
			return "permissions/new";
		}
		permission.setUpdatedAt(DateTime.now());
		permission.setCreatedAt(DateTime.now());
		permissionService.create(permission);
		redirectAttrs.addFlashAttribute("message", "创建成功!");
		return "redirect:/permissions/" + permission.getId();
	}

	@RequestMapping(value = "/{id:^\\d+$}", method = RequestMethod.GET)
	public String show(@PathVariable("id") Long id, Model model) {
		Permission permission = permissionService.find(id);
		model.addAttribute("permission", permission);
		setBreadcrumb("首页", "/", "权限管理", "/permissions", permission.getDescription(), null);
		return "permissions/show";
	}

	@RequestMapping(value = "/{id:^\\d+$}/edit", method = RequestMethod.GET)
	public String edit(@PathVariable("id") Long id, Model model) {
		Permission permission = permissionService.find(id);
		model.addAttribute("permission", permission);
		setBreadcrumb("首页", "/", "权限管理", "/permissions","编辑"+permission.getDescription(),null);
		return "permissions/edit";
	}

	@RequestMapping(value = "/{id:^\\d+$}", method = RequestMethod.PUT)
	public String update(@PathVariable("id") Long id, Permission input, Model model) {
		Permission permission = permissionService.find(id); 
		Beans.extend(permission, input, "name", "description");
		permission.setUpdatedAt(DateTime.now());
		permissionService.update(permission);
		return "redirect:/permissions/" + id;
	}

	@RequestMapping(value = "/{id:^\\d+$}", method = RequestMethod.DELETE)
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
