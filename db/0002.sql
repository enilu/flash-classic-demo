create table permission(
  id bigint not null auto_increment primary key,
  name varchar(255) not null comment 'label: 权限标识名，如user.write, user.view, searchable:like',
  description varchar(1024) comment 'label: 权限描述',
  updated_at timestamp not null default current_timestamp on update current_timestamp,
  created_at timestamp not null,
  unique key uk_permission_name(name)
) engine=InnoDB default charset=utf8 comment 'label: 权限';

create table role(
  id bigint not null auto_increment primary key,
  name varchar(255) not null comment 'label: 角色名, searchable:like',
  description varchar(1024) comment 'label: 角色描述',
  updated_at timestamp not null default current_timestamp on update current_timestamp,
  created_at timestamp not null,
  unique key uk_role_name(name)
) engine=InnoDB default charset=utf8 comment 'label: 角色';

create table role_permission(
  id bigint not null auto_increment primary key,
  role_id bigint not null comment 'ref: role',
  permission_id bigint not null comment 'ref: permission',
  updated_at timestamp not null default current_timestamp on update current_timestamp,
  created_at timestamp not null,
  unique key uk_role_permission_role_id_permission_id(role_id, permission_id)
) engine=InnoDB default charset=utf8 comment '角色，权限关联表';

create table user_role(
  id bigint not null auto_increment primary key,
  user_id bigint not null comment 'ref: user',
  role_id bigint not null comment 'ref: role',
  updated_at timestamp not null default current_timestamp on update current_timestamp,
  created_at timestamp not null,
  unique key uk_user_role_user_id_role_id(user_id, role_id)
) engine=InnoDB default charset=utf8 comment '用户,角色关联表';


CREATE TABLE logs (
  id int(11) NOT NULL AUTO_INCREMENT,
  operator int(11) NOT NULL,
  operator_name varchar(64),
  action varchar(64),
  operate_time datetime DEFAULT NULL,
  class_name varchar(128),
  method_name varchar(64),
  ip varchar(32),
  exception_code varchar(128),
  exception_detail text,
  params text,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
