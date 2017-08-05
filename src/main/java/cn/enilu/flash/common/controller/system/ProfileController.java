package cn.enilu.flash.common.controller.system;



import cn.enilu.flash.common.controller.BaseController;
import cn.enilu.flash.common.model.UserModel;
import cn.enilu.flash.common.service.UserService;
import cn.enilu.flash.web.auth.UserContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;

@Controller
@RequestMapping("/profile")
public class ProfileController extends BaseController {
    @Inject
    private UserService userService ;
    @RequestMapping(  method = RequestMethod.GET)
    public String index(Model model){
        UserContext userContext = getUserContext();
        UserModel user = userService.load(Long.valueOf(userContext.getId()));
        model.addAttribute("user", user);
        setBreadcrumb("个人中心", null);
        return "profile";
    }
}
