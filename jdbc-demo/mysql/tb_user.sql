create database mybatis;

use mybatis;

drop table if exists tb_user;

create table tb_user(

	id int primary key auto_increment,
	username varchar(20),
	password varchar(20),
	gender char(1),
	addr varchar(30)
);


insert into tb_user values(1, 'zhangsan', '123', '男', '北京');
insert into tb_user values(2, '李四', '234', '女', '天津');
insert into tb_user values(3, '王五', '11', '男', '西安');
