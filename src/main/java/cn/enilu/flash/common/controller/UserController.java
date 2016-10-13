package cn.enilu.flash.common.controller;

import cn.enilu.flash.core.db.Pagination;
import cn.enilu.flash.core.util.JsonResponse;
import cn.enilu.flash.core.util.MailUtil;
import cn.enilu.flash.core.validation.Confirm;
import cn.enilu.flash.common.entity.User;
import cn.enilu.flash.common.model.UserModel;
import cn.enilu.flash.common.service.UserService;
import cn.enilu.flash.web.Page;
import cn.enilu.flash.web.auth.annotation.Permissions;
import org.hibernate.validator.constraints.NotBlank;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

@Controller
@RequestMapping("/users")
@Permissions("user.mgmt")
public class UserController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(UserController.class);

    @Inject
    private UserService userService;

    @ModelAttribute("user")
    public User initUser() {
        return new User();
    }

    @RequestMapping(method = RequestMethod.GET)
    public String index(Page page, Model model) {
        Pagination<User> users = userService.search(page.getPage());
        model.addAttribute("users", users);

        setBreadcrumb("用户管理", null);
        return "users/index";
    }

    // new是关键字，用new0代替。
    @RequestMapping(value = "new", method = RequestMethod.GET)
    public String new0(HttpServletRequest request, Model model) {
        return renderNewPage(request);
    }

    private String renderNewPage(HttpServletRequest request) {
        setBreadcrumb(request, "用户管理", "/users", "添加用户", null);
        return "users/new";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String create(HttpServletRequest request,
                         @Valid User user, BindingResult result, Model model,
                         RedirectAttributes redirectAttrs) {
        model.addAttribute("user", user);
        if (result.hasErrors()) {
            return renderNewPage(request);
        }

        userService.create(user);
        redirectAttrs.addFlashAttribute("message", "创建成功!");
        return "redirect:/users/" + user.getId();
    }

    @RequestMapping(value = "/{id:^\\d+$}", method = RequestMethod.GET)
    public String show(@PathVariable("id") Long id, Model model) {
        UserModel user = userService.load(id);
        model.addAttribute("user", user);

        setBreadcrumb("用户管理", "/users", user.getName(), null);
        return "users/show";
    }

    @RequestMapping(value = "/{id:^\\d+$}/edit", method = RequestMethod.GET)
    public String edit(HttpServletRequest request, @PathVariable("id") Long id, Model model) {
        User user = userService.find(id);
        model.addAttribute("user", user);
        setBreadcrumb(request, "用户管理", "/users",user.getName(),"/users/"+id, "编辑用户", null);
        return "users/edit";
    }

    @RequestMapping(value = "/{id:^\\d+$}/edit_notice", method = RequestMethod.GET)
    public String editNotice(@PathVariable("id") Long id, Model model) {
        User user = userService.find(id);
        model.addAttribute("user", user);
        return "users/edit_notice";
    }

    @RequestMapping(value = "/{id:^\\d+$}", method = RequestMethod.PUT)
    public String update(@PathVariable("id") Long id, User user, Model model) {
        user.setId(id);
        userService.update(user);
        return "redirect:/users/" + id;
    }

    @RequestMapping(value = "/{id:^\\d+$}", method = RequestMethod.DELETE)
    public
    @ResponseBody
    JsonResponse destroy(@PathVariable("id") Long id,
                         RedirectAttributes redirectAttrs) {
        User user = userService.delete(id);
        String message = "删除用户" + user.getName() + "成功!";
        redirectAttrs.addFlashAttribute("message", "删除用户" + user.getName()
                + "成功!");

        return new JsonResponse(true, message);
    }

    @Confirm.List({@Confirm(property = "password", confirmProperty = "confirmPassword")})
    public static class ResetPasswordForm {
        @NotBlank
        private String password;
        @NotBlank
        private String confirmPassword;

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public String getConfirmPassword() {
            return confirmPassword;
        }

        public void setConfirmPassword(String confirmPassword) {
            this.confirmPassword = confirmPassword;
        }

    }

    @RequestMapping(value = "/{id:^\\d+$}/reset_password", method = RequestMethod.GET)
    public String showResetPassword(@PathVariable("id") Long id, Model model) {
        User user = userService.find(id);
        model.addAttribute("user", user);
        model.addAttribute("resetPasswordForm", new ResetPasswordForm());
        setBreadcrumb("用户管理", "/users", user.getName(), "/users/" + id, "重置密码", null);
        return "users/reset_password";
    }

    @RequestMapping(value = "/{id:^\\d+$}/reset_password", method = RequestMethod.PUT)
    public String resetPassword(@PathVariable("id") Long id,
                                @Valid ResetPasswordForm resetPasswordForm, BindingResult result,
                                Model model, RedirectAttributes redirectAttrs) {
        User user = userService.find(id);
        model.addAttribute("user", user);
        if (result.hasErrors()) {
            model.addAttribute("resetPasswordForm", resetPasswordForm);
            setBreadcrumb("用户管理", "/users", user.getName(), "/users/"+id,"重置密码",null);
            return "users/reset_password";
        }
        userService.changePassword(id, resetPasswordForm.getPassword());
        redirectAttrs.addFlashAttribute("message", "重置密码成功");
        return "redirect:/users/" + id;
    }

    public static class ChangePasswordForm extends ResetPasswordForm {
        private String oldPassword;

        public String getOldPassword() {
            return oldPassword;
        }

        public void setOldPassword(String oldPassword) {
            this.oldPassword = oldPassword;
        }
    }

    @RequestMapping(value = "/change_password", method = RequestMethod.GET)
    public String showChangePassword(Model model) {
        model.addAttribute("changePasswordForm", new ChangePasswordForm());
        return "users/change_password";
    }

    @RequestMapping(value = "/change_password", method = RequestMethod.PUT)
    public String changePassword(HttpServletRequest request, @Valid ChangePasswordForm changePasswordForm,
                                 BindingResult result, Model model, RedirectAttributes redirectAttrs) {
        User user = getCurrentUser(request);
        if (result.hasErrors()
                || !checkOldPassword(user, changePasswordForm, result)) {
            model.addAttribute("changePasswordForm", changePasswordForm);
            return "users/change_password";
        }
        userService.changePassword(user.getId(),
                changePasswordForm.getPassword());
        redirectAttrs.addFlashAttribute("message", "修改密码成功");
        return "redirect:/users";
    }

    private boolean checkOldPassword(User operator,
                                     ChangePasswordForm changePasswordForm, BindingResult result) {
        if (userService.isValidPassword(operator,
                changePasswordForm.getOldPassword())) {
            return true;
        }
        result.rejectValue("oldPassword", "password.error", "原密码错误");
        return false;
    }

    @RequestMapping(value = "/{id:^\\d+$}/edit_roles", method = RequestMethod.GET)
    public String editRoles(@PathVariable("id") Long id, Model model) {
        UserModel user = userService.load(id);
        model.addAttribute("user", user);
        model.addAttribute("userRoleIds", new HashSet<Long>(user.getRoleIds()));
        model.addAttribute("allRoles", userService.findAllRoles());

        setBreadcrumb("用户管理", "/users", user.getName(), "/users/" + user.getId(), "角色管理", null);
        return "users/edit_roles";
    }

    @RequestMapping(value = "/{id:^\\d+$}/save_roles", method = RequestMethod.POST)
    public String savePermissions(@PathVariable("id") Long id, Long[] roleIds,
                                  Model model,
                                  RedirectAttributes redirectAttributes) {
        User user = userService.find(id);
        userService.saveRoles(id, roleIds);

        redirectAttributes.addFlashAttribute("message", "修改权限成功");
        return "redirect:/users/" + id;
    }

    @Resource
    private MailUtil mailUtil;

    @RequestMapping(value = "/{id:^\\d+$}/forget_password", method = RequestMethod.GET)
    public String forgetPassword(@PathVariable("id") Long id, Model model, RedirectAttributes redirectAttributes)
    {
        User user = userService.find(id);
        //创建邮件
        MailUtil.MailBean mailBean = new MailUtil.MailBean();
        mailBean.setSubject("reset your password");
        mailBean.setToEmails(new String[]{user.getEmail()});
        mailBean.setTemplate("hello ${userName} !<a href='www.baidu.com' >baidu</a>");
        Map map = new HashMap();
        map.put("userName", "Fang Dong");
        mailBean.setData(map);

        //发送邮件
        try {
            mailUtil.send(mailBean);
        } catch (MessagingException e) {
            logger.error("send mail error:", e);
        }
        return "";
    }
}
