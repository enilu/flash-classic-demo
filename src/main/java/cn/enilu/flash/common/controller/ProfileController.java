package cn.enilu.flash.common.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/profile")
public class ProfileController extends BaseController {
    @RequestMapping(  method = RequestMethod.GET)
    public String index(){
        setBreadcrumb("首页","/","个人中心", null);
        return "profile";
    }
}
