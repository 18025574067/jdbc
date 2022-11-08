drop table if exists music;
drop table if exists song;
drop table if exists review;
drop table if exists user;

create table music(
	title varchar(32), -- 专辑名
	alias varchar(32), -- 专辑别名
	image varchar(64), -- 封面图片
	style varchar(8), -- 流派
	type varchar(4), -- 类型
	medium varchar(4), -- 介质
	publish_time date, -- 发行时间
	publisher varchar(16), -- 出版者
	number tinyint, -- 唱片数
	barcode bigint, -- 条形码
	summary varchar(1024), -- 简介
	artist varchar(16), -- 艺术家
	id int primary key auto_increment -- 编号(唯一)
);

create table song(
	name varchar(32), -- 歌曲名
	serial_number tinyint, -- 歌曲序号
	music_id int,
	id int primary key auto_increment
);

create table review(
	content varchar(256), -- 评论内容
	rating tinyint, -- 评分 
	review_time datetime,  -- 评论时间
	music_id int,
	user_id int
);

create table user(
	username varchar(16) unique, -- 用户名(唯一)
	image varchar(64), -- 用户头像图片地址
	signature varchar(64), -- 个人签名,例如(万般各所是 一切皆圆满)
	nickname varchar(16), -- 用户昵称
	id int primary key auto_increment -- 用户编号
);

create table music_user(
	id int primary key auto_increment,
	music_id int,
	user_id int 
);

-- 建完表后, 添加外键
-- 专辑--(一对多) --曲目
alter table song add constraint fk_song_music foreign key(music_id) references music(id);
-- 专辑 --(一对多)-- 短评
alter table review add constraint fk_review_music foreign key(music_id) references music(id);
-- 专辑 --(多对多) -- 用户
alter table music_user add constraint fk_music_id foreign key(music_id) references music(id);
alter table music_user add constraint fk_user_id foreign key(user_id) references user(id);
-- 用户 --(一对多) -- 短评
alter table review add constraint fk_review_user foreign key(user_id) references user(id);




