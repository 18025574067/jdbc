
drop table if exists emp;

-- 员工表
create table emp(
	id int primary key auto_increment, -- 员工id, 主键且自增长 
	ename varchar(50) not null unique, -- 员工姓名, 非空并且唯一
	joindate date not null, -- 入职日期, 非空
	salary double(7, 2) not null, -- 工资, 非空
	bonus double(7, 2) DEFAULT 0  -- 奖金, 如果没有奖金默认为0
);


insert into emp(id, ename, joindate, salary, bonus) values (1, '张三', '1999-11-11', 8800, 5000);

-- 演示主键约束: 非空且唯一
insert into emp(id, ename, joindate, salary, bonus) values (null, '张三', '1999-11-11', 8800, 5000);
insert into emp(id, ename, joindate, salary, bonus) values (2, '张三', '1999-11-11', 8800, 5000);
insert into emp(id, ename, joindate, salary, bonus) values (2, '李四', '1999-11-11', 8800, 5000);

-- 演示非空约束
insert into emp(id, ename, joindate, salary, bonus) values (3, null, '1999-11-11', 8800, 5000);

-- 演示唯一约束
insert into emp(id, ename, joindate, salary, bonus) values (3, '李四', '1999-11-11', 8800, 5000);

-- 演示默认约束
insert into emp(id, ename, joindate, salary) values (3, '王五', '1999-11-11', 8800);
insert into emp(id, ename, joindate, salary, bonus) values (3, '王五', '1999-11-11', 8800, null);

-- 演示自动增长: auto_increment: 当列是数字类型并且唯一.
insert into emp(ename, joindate, salary) values ('王五', '1999-11-11', 8800);
insert into emp(id, ename, joindate, salary, bonus) values (null, '王五2', '1999-11-11', 8800, null);
insert into emp(id, ename, joindate, salary, bonus) values (null, '王五3', '1999-11-11', 8800, null);

select * from emp;




/*
外键约束:

	[CONSTRAINT] [外键名称] FOREIGN KEY(外键列名) [REFERENCES] [主表名称(主表列名称)];
	
	-- 建完表后添加外键约束
	alter table 表名 add constraint 外键名称 foreign key (外键字段名称) references 主表名称(主表列名称);
	
	-- 删除约束
	alter table 表名 drop foreign key 外键名称;
*/
	
	-- 删除表
	drop table if exists emp;
	drop table if exists dept;
	
	-- 部门表
	create table dept(
		id int primary key auto_increment,
		dep_name varchar(20),
		addr varchar(20)
	);
	
	-- 员工表
	create table emp(
		id int primary key auto_increment,
		name varchar(20),
		age int,
		dep_id int,
		-- 添加外键, dep_id, 关联dept表的id 主键
		CONSTRAINT fk_emp_dept FOREIGN KEY(dep_id) REFERENCES dept(id)
	);
	
-- 添加2个部门
insert into dept(dep_name, addr) values 
('研发部', '广州'),('销售部', '深圳');

insert into emp(name, age, dep_id) values 
('张三', 20, 1),
('李四', 20, 1), 
('王五', 20, 1),
('赵六', 20, 2),
('孙七', 22, 2),
('周八', 18, 2);

select * from emp;

select * from dept;

-- 删除外键
alter table emp drop foreign key fk_emp_dept;
	
-- 建完表添加外键
alter table emp add constraint fk_emp_dept foreign key(dep_id) REFERENCES dept(id);
	
	
	








