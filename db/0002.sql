
-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES ('1', '1', 'admin', '添加用户', '2016-10-13 18:04:59', 'cn.enilu.flash.common.controller.UserController', 'create', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `logs` VALUES ('2', '1', 'admin', '更新用户', '2016-10-13 18:14:40', 'cn.enilu.flash.common.controller.UserController', 'update', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `logs` VALUES ('3', '1', 'admin', '更新权限', '2016-10-13 18:14:51', 'cn.enilu.flash.common.controller.PermissionController', 'update', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `logs` VALUES ('4', '1', 'admin', '修改权限', '2016-10-13 18:15:09', 'cn.enilu.flash.common.controller.UserController', 'savePermissions', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `logs` VALUES ('5', '1', 'admin', '更新权限', '2016-10-13 23:25:06', 'cn.enilu.flash.common.controller.PermissionController', 'update', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `logs` VALUES ('6', '1', 'admin', '更新权限', '2016-10-13 23:25:12', 'cn.enilu.flash.common.controller.PermissionController', 'update', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `logs` VALUES ('7', '1', 'admin', '更新角色', '2016-10-13 23:25:46', 'cn.enilu.flash.common.controller.RoleController', 'update', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `logs` VALUES ('8', '1', 'admin', '更新角色', '2016-10-13 23:26:02', 'cn.enilu.flash.common.controller.RoleController', 'update', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `logs` VALUES ('9', '1', 'admin', '更新角色', '2016-10-13 23:26:36', 'cn.enilu.flash.common.controller.RoleController', 'update', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `logs` VALUES ('10', '1', 'admin', '更新权限', '2016-10-13 23:27:27', 'cn.enilu.flash.common.controller.PermissionController', 'update', '0:0:0:0:0:0:0:1', null, null, null);
INSERT INTO `logs` VALUES ('11', '1', 'admin', '更新用户', '2016-10-13 23:41:34', 'cn.enilu.flash.common.controller.UserController', 'update', '0:0:0:0:0:0:0:1', null, null, null);

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', 'system.user', '普通用户标识', '2016-10-13 23:27:27', '2015-09-11 11:28:57');
INSERT INTO `permission` VALUES ('2', 'user.mgmt', '用户管理', '2015-09-11 11:28:57', '2015-09-11 11:28:57');
INSERT INTO `permission` VALUES ('3', 'role.mgmt', '角色管理', '2015-09-11 11:28:57', '2015-09-11 11:28:57');
INSERT INTO `permission` VALUES ('4', 'permission.mgmt', '权限管理', '2016-09-11 18:03:24', '2016-09-11 18:03:24');
INSERT INTO `permission` VALUES ('5', 'logs.mgmt', '日志管理', '2016-10-13 23:25:12', '2016-09-11 18:03:39');

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '普通用户', '普通用户，不具备系统管理权限', '2016-10-13 23:26:36', '2015-09-11 11:28:57');
INSERT INTO `role` VALUES ('2', '管理员', '超级管理员角色', '2016-10-13 23:26:02', '2015-09-11 11:28:57');

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1', '1', '2015-09-11 11:28:57', '2015-09-11 11:28:57');
INSERT INTO `role_permission` VALUES ('2', '2', '1', '2015-09-11 11:28:57', '2015-09-11 11:28:57');
INSERT INTO `role_permission` VALUES ('3', '2', '2', '2015-09-11 11:28:57', '2015-09-11 11:28:57');
INSERT INTO `role_permission` VALUES ('4', '2', '3', '2015-09-11 11:28:57', '2015-09-11 11:28:57');
INSERT INTO `role_permission` VALUES ('6', '2', '4', '2016-10-13 17:57:01', '2016-10-13 17:57:01');
INSERT INTO `role_permission` VALUES ('7', '2', '5', '2016-10-13 17:57:02', '2016-10-13 17:57:02');

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'eniluzt@qq.com', null, null, '2016-10-13 23:41:33', '2016-10-13 23:41:33');
INSERT INTO `user` VALUES ('2', 'test', 'test@qq.com', null, null, '2016-10-13 18:14:40', '2016-10-13 18:14:40');

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1', '2015-09-11 11:28:57', '2015-09-11 11:28:57');
INSERT INTO `user_role` VALUES ('2', '1', '2', '2015-09-11 11:28:57', '2015-09-11 11:28:57');
INSERT INTO `user_role` VALUES ('3', '2', '1', '2016-10-13 18:15:09', '2016-10-13 18:15:09');
