package cn.enilu.flash.common.service;

import cn.enilu.flash.core.db.DB;
import cn.enilu.flash.core.db.Pagination;
import cn.enilu.flash.core.service.EntityService;
import cn.enilu.flash.common.entity.Role;
import cn.enilu.flash.common.entity.User;
import cn.enilu.flash.common.entity.UserRole;
import cn.enilu.flash.common.model.UserModel;
import com.google.common.base.Charsets;
import com.google.common.hash.HashFunction;
import com.google.common.hash.Hashing;
import org.apache.commons.lang.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
@Transactional
public class UserService extends EntityService<User, Long> {
	private Logger logger = LoggerFactory.getLogger(UserService.class);

	@Inject
	private DB db;

	private HashFunction sha1 = Hashing.sha1();

	public UserService() {
		super(User.class);
	}

	public Pagination<User> search(int page) {
		Pagination<User> users = db.from("user").orderBy("id desc")
				.paginate(User.class, page);
		return users;
	}
	
	public UserModel load(Long id) {
		UserModel user = db.from(UserModel.class).where("id", id).first(UserModel.class);
		List<Role> roles = db.from(Role.class).select("role.*")
				.join("join user_role on user_role.role_id = role.id")
				.where("user_role.user_id", id).all(Role.class);
		user.setRoles(roles);
		return user;
	}

    private String encodePassword(String password, String salt) {
        return sha1.hashString(password + "#" + salt, Charsets.UTF_8).toString();
    }

    private String createSalt(String name) {
        return sha1.hashString(name + "#" + System.currentTimeMillis() + "#" + RandomStringUtils.random(20), Charsets.UTF_8).toString();
    }

	public void create(User user) {
		String salt = createSalt(user.getName());
		String cryptedPassword = encodePassword(user.getPassword(), salt);
		user.setSalt(salt);
		user.setCryptedPassword(cryptedPassword);

		db.insert(user);
		logger.info("created a new user, name=" + user.getName() + ", id="
				+ user.getId());
	}

	public User changePassword(Long id, String plainPassword) {
		User user = db.find(User.class, id);
		String cryptedPassword = encodePassword(plainPassword,
                user.getSalt());
		user.setCryptedPassword(cryptedPassword);

		db.update(user);
		return user;
	}

	public User login(String name, String password) {
		User user = db.from("user").where("name", name).first(User.class);
		if (user == null) {
			return null;
		}

		String cryptedPassword = encodePassword(password,
                user.getSalt());
		if (cryptedPassword.equals(user.getCryptedPassword())) {
			return user;
		}

		return null;
	}

	public boolean isValidPassword(User user, String password) {
		String cryptedPassword = encodePassword(password,
				user.getSalt());
		return cryptedPassword.equals(user.getCryptedPassword());
	}

	public List<Role> findAllRoles() {
		return db.from(Role.class).orderBy("id asc").all(Role.class);
	}

	@Transactional
	public void saveRoles(Long userId, Long[] roleIds) {
		List<UserRole> oldUserRoles = db.from(UserRole.class)
				.where("user_id", userId).all(UserRole.class);

		Set<Long> idSet = new HashSet<Long>(Arrays.asList(roleIds));
		for (UserRole userRole : oldUserRoles) {
			if (idSet.contains(userRole.getRoleId())) {
				idSet.remove(userRole.getRoleId());
			} else {
				db.delete(userRole);
			}
		}

		for (Long roleId : idSet) {
			UserRole userRole = new UserRole();
			userRole.setUserId(userId);
			userRole.setRoleId(roleId);
			db.insert(userRole);
		}
	}

    public static void main(String[] args) {
        UserService userService = new UserService();
        String salt = userService.createSalt("admin");
        System.out.println("salt=" + salt);
        String encryptedPassword = userService.encodePassword("admin", salt);
        System.out.println("encryptedPassword=" + encryptedPassword);
    }

}
