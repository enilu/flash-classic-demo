package cn.enilu.flash.common.service;

import cn.enilu.flash.core.db.Pagination;
import cn.enilu.flash.core.db.Query;
import cn.enilu.flash.core.service.EntityService;
import cn.enilu.flash.common.entity.Permission;
import cn.enilu.flash.common.entity.Role;
import cn.enilu.flash.common.entity.RolePermission;
import cn.enilu.flash.common.model.RoleModel;
import cn.enilu.flash.web.QueryForm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class RoleService extends EntityService<Role, Long> {
	private Logger logger = LoggerFactory.getLogger(RoleService.class);

	public RoleService() {
		super(Role.class);
	}

	@Transactional
	public Pagination<Role> search(QueryForm qf) {
		Query q = db.from("role");
		qf.setupLikeConditions(q, "name");
		return q.orderBy(qf.getOrderBy()).paginate(Role.class, qf.getPage());
	}
	
	@Transactional
	public RoleModel load(Long id) {
		RoleModel role = db.from(RoleModel.class).where("id", id).first(RoleModel.class);
		List<Permission> permissions = db.from(Permission.class).select("permission.*")
				.join("join role_permission on role_permission.permission_id = permission.id")
				.where("role_permission.role_id", id)
				.all(Permission.class);
		role.setPermissions(permissions);
		return role;
	}
	
	public List<Permission> findAllPermissions() {
		return db.from(Permission.class).orderBy("id asc").all(Permission.class);
	}
	
	@Transactional
	public void savePermissions(Long roleId, Long[] permissionIds) {
		List<RolePermission> oldRolePermissions = db.from(RolePermission.class)
				.where("role_id", roleId).all(RolePermission.class);

		Set<Long> idSet = new HashSet<>(Arrays.asList(permissionIds));
		for (RolePermission rolePermission : oldRolePermissions) {
			if (idSet.contains(rolePermission.getPermissionId())) {
				idSet.remove(rolePermission.getPermissionId());
			} else {
				db.delete(rolePermission);
			}
		}
		
		for (Long permissionId : idSet) {
			RolePermission rolePermission = new RolePermission();
			rolePermission.setRoleId(roleId);
			rolePermission.setPermissionId(permissionId);
			db.insert(rolePermission);
		}
	}
}
