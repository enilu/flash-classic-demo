package cn.enilu.flash.common.model;

import cn.enilu.flash.core.lang.Lists;
import cn.enilu.flash.common.entity.Role;
import cn.enilu.flash.common.entity.User;

import java.util.ArrayList;
import java.util.List;

public class UserModel extends User {
    private List<Role> roles;

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public List<Long> getRoleIds() {
        if (roles == null) {
            return new ArrayList<Long>();
        }
        return Lists.map(roles, "id");
    }
}
