drop table if exists emp;
drop table if exists dept;
drop table if exists job;
drop table if exists salarygrade;

-- 部门表
create table dept(
	id int primary key, -- 部门id
	dname varchar(50), -- 部门名称
	loc varchar(50) -- 部门所在地
);

-- 职务表, 职务名称, 职务描述
create table job(
	id int primary key,
	jname varchar(20),
	description varchar(50)
);

-- 员工表
create table emp(
	id int primary key, -- 员工id
	ename varchar(50), -- 员工姓名
	job_id int, -- 职务id
	mgr int, -- 上级领导
	joindate date, -- 入职日期
	salary decimal(7, 2), -- 工资
	bonus decimal(7, 2), -- 奖金
	dept_id int, -- 所在部门编号 
	constraint emp_jobid_ref_job_id_fk foreign key(job_id) references job(id),
	constraint emp_deptid_ref_dept_id_fk foreign key(dept_id) references dept(id)
);

-- 工资等级表
create table salarygrade(
	grade int primary key, -- 级别
	losalary int, -- 最低工资
	hisalary int -- 最高工资
);

-- 添加4个部门 
insert into dept(id, dname, loc) values 
(10, '教研部', '北京'),
(20, '学工部', '上海'), 
(30, '销售部', '广州'),
(40, '财务部', '深圳');

-- 添加4个职务
insert into job() values 
(1, '董事长', '管理整个公司, 接单'),
(2, '经理', '管理部门员工'),
(3, '销售员', '向客人推销产品'),
(4, '文员', '使用办公软件');

-- 添加员工
insert into emp(id, ename, job_id, mgr, joindate, salary, bonus, dept_id) values 
(1001, '孙悟空', 4, 1004, '2000-12-17', '8000.00', null, 20 ), 
(1002, '卢俊义', 3, 1006, '2001-02-20', '16000.00', '3000.00', 30), 
(1003, '林冲', 3, 1006, '2001-02-22', '12500.00', '5000.00', 30), 
(1004, '唐僧', 2, 1009, '2001-04-02', '29750.00', null, 20),
(1005, '李逵', 4, 1006, '2001-09-20', '12500.00', '14000.00', 30),
(1006, '宋江', 2, 1009, '2001-05-01', '28500.00', null, 30),
(1007, '刘备', 2, 1009, '2001-09-01', '24500.00', null, 30),
(1008, '猪八戒', 4, 1004, '2007-04-19', '30000.00', null, 20),
(1009, '罗贯中', 1, null, '2001-11-17', '50000.00', null, 10),
(1010, '吴用', 3, 1006, '2001-09-08', '15000.00', '0.00', 30),
(1011, '沙僧', 4, 1004, '2007-05-23', '11000.00', null, 30),
(1012, '刘德化', 4, 1006, '2001-12-03', '9500.00', null, 30),
(1013, '小白龙', 4, 1004, '2001-12-03', '30000.00', null, 20),
(1014, '关羽', 4, 1007, '2002-01-23', '13000.00', null, 10);

-- 添加5个工资等级
insert into salarygrade(grade, losalary, hisalary) values 
(1, 7000, 12000), 
(2, 12010, 14000), 
(3, 14010, 20000), 
(4, 20010, 30000),
(5, 30010, 99990);


-- 要求:
-- 1. 查询所有员工信息, 查询员工编号, 员工姓名, 工资, 职务名称, 职务描述
/*
	分析:
		1. 员工编号, 员工姓名, 工资信息在emp表中
		2. 职务名称, 职务描述信息在job表中
		3. job职务表和emp员工表 是一对多的关系, emp.job_id = job.id
*/
-- 隐式内连接
-- select emp.id, emp.ename, emp.salary, job.jname, job.description from emp, job where emp.job_id = job.id;
-- 显式内连接
-- select emp.id, emp.ename, emp.salary, job.jname, job.description from emp inner join job on emp.job_id = job.id;

-- 2. 查询员工编号, 员工姓名, 工资,职务名称, 职务描述, 部门名称, 部门位置
/*
	分析:
		1. 员工编号, 员工姓名, 工资信息在emp表中
		2. 职务名称, 职务描述信息在job表中
		3. job职务表和emp员工表 是一对多的关系, emp.job_id = job.id
		4. 部门名称, 部门位置 来自于部门表 dept表中
		5. dept部门表和emp员工表 是一对多的关系, dept.id = emp.dept_id.
*/
-- 隐式内连接
-- select emp.id, emp.ename, emp.salary, job.jname, job.description, dept.dname, dept.loc from emp, job, dept where emp.job_id = job.id and dept.id = emp.dept_id;
-- 显式内连接
-- select emp.id, emp.ename, emp.salary, job.jname, job.description , dept.dname, dept.loc from emp inner join job on emp.job_id = job.id inner join dept on dept.id = emp.dept_id;
-- select emp.id, emp.ename, emp.salary, job.jname, job.description , dept.dname, dept.loc from emp inner join job inner join dept on emp.job_id = job.id and dept.id = emp.dept_id;

-- 3. 查询员工姓名, 工资, 工资等级
/*
	分析:
		1. 员工姓名, 工资信息在emp员工表中
		2. 工资等级信息在salarygrade工资等级表中
		3. emp.salary >= salarygrade.losalary and emp.salary <= salarygrade.hisalary
*/
-- select emp.ename, emp.salary, t2.grade from emp, salarygrade t2 where emp.salary >= t2.losalary and emp.salary <= t2.hisalary;

-- 4. 查询员工姓名, 工资, 职务名称, 职务描述, 部门名称, 部门位置, 工资等级

-- 5. 查询出部门编号, 部门名称, 部门位置, 部门人数







