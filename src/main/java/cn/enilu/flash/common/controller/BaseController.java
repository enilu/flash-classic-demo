package cn.enilu.flash.common.controller;

import cn.enilu.flash.core.db.RecordNotFoundException;
import cn.enilu.flash.common.web.MenuList;
import cn.enilu.flash.web.taglib.Breadcrumb;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

public class BaseController extends cn.enilu.flash.web.BaseController {
    private Logger logger = LoggerFactory.getLogger(BaseController.class);
    
    @Inject
    private MenuList menus;
    
    @ModelAttribute("theme")
    public String getTheme() {
        return "adminLTE";
    }
    
    @ModelAttribute("menus")
    public MenuList getMenus() {
        return menus;
    }

    @ExceptionHandler(value={Exception.class})
    public String handleException(Exception ex, HttpServletRequest request) {
        logger.error("未处理的异常, url=" + request.getRequestURI(), ex);

        if (ex instanceof RecordNotFoundException || ex instanceof BadRequestException) {
            return "404";
        }

        return "500";
    }
    
    protected void setBreadcrumb(HttpServletRequest request, Breadcrumb breadcrumb) {
        request.setAttribute("breadcrumb", breadcrumb);
    }

    protected void setBreadcrumb(Breadcrumb breadcrumb) {
        getRequest().setAttribute("breadcrumb", breadcrumb);
    }

    protected void setBreadcrumb(HttpServletRequest request, String... nameLinks) {
        setBreadcrumb(request, new Breadcrumb(nameLinks));
    }
    
    protected void setBreadcrumb(String... nameLinks) {
        setBreadcrumb(getRequest(), new Breadcrumb(nameLinks));
    }
}
