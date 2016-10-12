package cn.enilu.flash.common.model;

import cn.enilu.flash.core.lang.Lists;
import cn.enilu.flash.common.entity.Permission;
import cn.enilu.flash.common.entity.Role;

import java.util.ArrayList;
import java.util.List;

public class RoleModel extends Role {
    
    private List<Permission> permissions;

    public List<Permission> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<Permission> permissions) {
        this.permissions = permissions;
    }
    
    public List<Long> getPermissionIds() {
        if (permissions == null) {
            return new ArrayList<Long>();
        }
        return Lists.map(permissions, "id");
    }
}
