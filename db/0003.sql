insert into permission(name, description, created_at, updated_at) values
  ("system.user", "普通用户", now(), now()),
  ("user.mgmt", "用户管理", now(), now()),
  ("role.mgmt", "角色管理", now(), now());

insert into role(name, description, updated_at, created_at) values
  ("普通用户", "", now(), now()),
  ("管理员", "", now(), now());

insert into role_permission(role_id, permission_id, updated_at, created_at) values
  (1, 1, now(), now()),
  (2, 1, now(), now()),
  (2, 2, now(), now()),
  (2, 3, now(), now());

insert into user_role(user_id, role_id, updated_at, created_at) values
  (1, 1, now(), now()),
  (1, 2, now(), now());