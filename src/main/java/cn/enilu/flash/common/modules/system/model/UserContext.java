package cn.enilu.flash.common.modules.system.model;

import cn.enilu.flash.common.modules.system.entity.SysNotification;

import java.util.List;

/**
 * Created by zt on 2017/8/6 0006.
 */
public class UserContext extends cn.enilu.flash.web.auth.UserContext {
    private List<SysNotification> notifications;

    public List<SysNotification> getNotifications() {
        return notifications;
    }

    public void setNotifications(List<SysNotification> notifications) {
        this.notifications = notifications;
    }
}
