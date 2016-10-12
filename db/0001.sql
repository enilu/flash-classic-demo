
create table user(
  id bigint auto_increment primary key,
  name varchar(32) comment 'label: 用户名, searchable: eq, validate: length(min=5, max=32)',
  email varchar(100) comment 'label: 邮箱, searchable: like, validate: email',
  salt varchar(64) comment '用于加密的盐',
  crypted_password varchar(64) comment '加密后的密码',
  updated_at timestamp not null default current_timestamp on update current_timestamp,
  created_at timestamp not null,
  unique key uk_user_name(name)
) engine=innodb default charset=utf8 comment 'label用户';

insert into user set name = 'admin', email='eniluzt@qq.com', salt='27ad28b980affe8c453e4f65fadcba45624b6a01', crypted_password='a96cdd2daff763cbab9028f2730d83a6cd5ddb93', created_at = now();
