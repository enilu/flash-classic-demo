package cn.enilu.flash.common.controller;


import cn.enilu.flash.core.db.Pagination;
import cn.enilu.flash.core.lang.Beans;
import cn.enilu.flash.core.util.JsonResponse;
import cn.enilu.flash.common.entity.Role;
import cn.enilu.flash.common.model.RoleModel;
import cn.enilu.flash.common.service.RoleService;
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
import java.util.HashSet;

@Controller
@RequestMapping("/roles")
public class RoleController extends BaseController {

	@Inject
	private RoleService roleService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(HttpServletRequest request, Model model) {
		Pagination<Role> roles = roleService.search(getQueryForm(request));
		model.addAttribute("roles", roles);
		return "roles/index";
	}

	// new是关键字，用new0代替。
	@RequestMapping(value = "new", method = RequestMethod.GET)
	public String new0(Model model) {
		model.addAttribute("role", new Role());
		return "roles/new";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String create(@Valid Role role, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		model.addAttribute("role", role);
		if (result.hasErrors()) {
			return "roles/new";
		}

		roleService.create(role);
		redirectAttrs.addFlashAttribute("message", "创建成功!");
		return "redirect:/roles/" + role.getId();
	}

	@RequestMapping(value = "/{id:^\\d+$}", method = RequestMethod.GET)
	public String show(@PathVariable("id") Long id, Model model) {
		RoleModel role = roleService.load(id);
		model.addAttribute("role", role);
		return "roles/show";
	}

	@RequestMapping(value = "/{id:^\\d+$}/edit", method = RequestMethod.GET)
	public String edit(@PathVariable("id") Long id, Model model) {
		Role role = roleService.find(id);
		model.addAttribute("role", role);
		return "roles/edit";
	}

	@RequestMapping(value = "/{id:^\\d+$}", method = RequestMethod.PUT)
	public String update(@PathVariable("id") Long id, Role input, Model model) {
		Role role = roleService.find(id); 
		Beans.extend(role, input, "name", "description");
		roleService.update(role);
		return "redirect:/roles/" + id;
	}

	@RequestMapping(value = "/{id:^\\d+$}", method = RequestMethod.DELETE)
	public @ResponseBody
	JsonResponse destroy(@PathVariable("id") Long id,
			RedirectAttributes redirectAttrs) {
		Role role = roleService.find(id);
		roleService.destroy(role);
		String message = "删除成功!";
		redirectAttrs.addFlashAttribute("message", message);

		return new JsonResponse(true, message);
	}

	@RequestMapping(value = "/{id:^\\d+$}/edit_permissions", method = RequestMethod.GET)
	public String editPermissions(@PathVariable("id") Long id, Model model) {
		RoleModel role = roleService.load(id);
		model.addAttribute("role", role);
		model.addAttribute("rolePermissionIds", new HashSet<>(role.getPermissionIds()));
		model.addAttribute("allPermissions", roleService.findAllPermissions());
		
		setBreadcrumb("角色管理", "/roles", role.getName(), "/roles/" + role.getId(), "权限管理", null);
		return "roles/edit_permissions";
	}

	@RequestMapping(value = "/{id:^\\d+$}/save_permissions", method = RequestMethod.POST)
	public String savePermissions(@PathVariable("id") Long id, Long[] permissionIds,
								  Model model,
								  RedirectAttributes redirectAttributes) {
		Role role = roleService.find(id);
		roleService.savePermissions(id, permissionIds);
		
		redirectAttributes.addFlashAttribute("message", "修改权限成功");
		return "redirect:/roles/" + id;
	}
}
