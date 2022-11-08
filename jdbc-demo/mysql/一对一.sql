drop table if exists tb_user;
drop table if exists tb_user_desc;

create table tb_user(
	id int primary key auto_increment,
	photo varchar(20),
	nickname varchar(20),
	age int(3),
	gender char(1),
	desc_id int unique
);


create table tb_user_desc(
	id int primary key auto_increment,
	city varchar(10),
	edu varchar(5),
	income double,
	status varchar(2)
);

-- 建完表后, 添加外键
alter table tb_user add constraint fk_tb_user_desc foreign key(desc_id) references tb_user_desc(id);
