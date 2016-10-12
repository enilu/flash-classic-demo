package cn.enilu.flash.common.controller;

import cn.enilu.flash.common.entity.User;
import cn.enilu.flash.common.service.UserService;
import cn.enilu.flash.web.auth.UserContext;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Controller
@RequestMapping("/sessions")
public class SessionController extends BaseController {
    @Inject
    private UserService userService;

    public static class LoginForm {
        @NotEmpty
        private String name;
        @NotEmpty
        private String password;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

    }

    @RequestMapping(value = "new", method = RequestMethod.GET)
    public String showLogin(HttpServletRequest request, Model model) {
        if (getCurrentUser(request) != null) {
            return "redirect:/";
        }

        model.addAttribute("loginForm", new LoginForm());
        return "sessions/new";
    }

    @RequestMapping(value = "new", method = RequestMethod.POST)
    public String login(HttpServletRequest request, HttpServletResponse response,
                        @Valid LoginForm loginForm, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("message", "用户名密码不能为空");
            return "sessions/new";
        }
        User user = userService.login(loginForm.getName(),
                loginForm.getPassword());
        if (user == null) {
            model.addAttribute("message", "用户名密码不匹配");
            return "sessions/new";
        }

        request.getSession().setAttribute(UserContext.USER_ID_SESSION_ATTRIBUTE, user.getId());
        return "redirect:/";
    }

    @RequestMapping(value = "logout")
    public String logout(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        request.getSession().invalidate();
        return "redirect:/sessions/new";
    }

}
