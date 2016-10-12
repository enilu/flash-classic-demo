package cn.enilu.flash.common.utils;

import javax.servlet.http.HttpServletRequest;

/**
 * class IpUtil<br>
 * </p> Copyright by easecredit.com<br>
 * 作者: zhangtao <br>
 * 创建日期: 16-9-11<br>
 */
public class IpUtil {
    public static String getClientIp(HttpServletRequest request) {
        return request.getRemoteAddr();
    }
}
