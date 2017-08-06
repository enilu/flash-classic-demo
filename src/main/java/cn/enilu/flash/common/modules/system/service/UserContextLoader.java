package cn.enilu.flash.common.modules.system.service;

import cn.enilu.flash.core.db.DB;
import cn.enilu.flash.common.modules.system.entity.Permission;
import cn.enilu.flash.common.modules.system.entity.User;
import cn.enilu.flash.web.auth.IUserContextLoader;
import cn.enilu.flash.web.auth.UserContext;
import org.springframework.stereotype.Component;

import javax.inject.Inject;
import java.util.HashSet;
import java.util.List;

@Component
public class UserContextLoader implements IUserContextLoader {
    @Inject
    private DB db;

    public void setDb(DB db) {
        this.db = db;
    }

    @Override
    public UserContext load(String id) {
        User user = db.from(User.class).where("id", id).first(User.class, true);
        
        UserContext userContext = new UserContext();
        userContext.setId(user.getId().toString());
        userContext.setUser(user);

        List<String> permissionNames = db.from(Permission.class)
                .select("permission.name")
                .join("join role_permission on role_permission.permission_id = permission.id")
                .join("join user_role on user_role.role_id = role_permission.role_id")
                .segment("user_role.user_id = ?", user.getId())
                .all(String.class);
        userContext.setPermissions(new HashSet<String>(permissionNames));
        
        return userContext;
    }
}
