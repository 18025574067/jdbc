
-- 删除stu表
drop table if exists stu;

-- 创建stu表
create table stu (
 id int, -- 编号
 name varchar(20), -- 姓名
 age int, -- 年龄
 sex varchar(5), -- 性别
 address varchar(100), -- 地址
 math double(5, 2), -- 数字成绩
 english double(5, 2), -- 英语成绩
 hire_date date -- 入学成绩
);

-- 添加数据
insert into stu(id, name, age, sex, address, math, english, hire_date) 
values
(1, '马运', 55, '男', '杭州', 66, 78, '1995-09-01'),
(2, '马花疼', 45, '女', '深圳', 98, 87, '1998-09-01'),
(3, '马斯克', 55, '男', '香港', 56, 77, '1999-09-02'),
(4, '柳白', 20, '女', '湖南', 76, 65, '1997-09-05'), 
(5, '柳青', 20, '男', '湖南', 86, null, '1998-09-01'),
(6, '刘德花', 57, '男', '香港', 99, 99, '1998-09-01'),
(7, '张学右', 22, '女', '香港', 99, 99, '1998-09-01'),
(8, '德玛西亚', 18, '男', '南京', 56, 65, '1994-09-02');

select * from stu;

-- 查询name, age 两列
select name, age from stu;

-- 查询所有列的数据, 列名的列表可以使用*替代, 不要使用!
select id, name, age, sex, address, math, english, hire_date from stu;
select * from stu;

-- 查询地址信息
select address from stu;
-- 去除重复记录
select distinct address from stu;

-- 查询姓名,数学成绩,英语成绩
select name, math, english from stu;
select name, math as 数学成绩, english as 英语成绩 from stu;
select name, math 数学成绩, english 英语成绩 from stu;

select * from stu;

-- 条件查询==================

-- 1. 查询年龄大于20岁的学员信息
select * from stu where age > 20;

-- 2. 查询年龄大于等于20岁的学员信息
select * from stu where age >= 20;

-- 3. 查询年龄大于等于20岁并且 年龄小于等于30岁的学员信息
select * from stu where age >= 20 and age <= 30;
select * from stu where age between 20 and 30;

-- 4. 查询入学日期在'1998-09-01'到'1999-09-01'之间的学员信息
select * from stu where hire_date between '1998-09-01' and '1999-09-01';

-- 5. 查询年龄等于18岁的学员信息
select * from stu where age = 18;

-- 6. 查询年龄不等于18岁的学员信息
select * from stu where age != 18;
select * from stu where age <> 18;

-- 7. 查询年龄等于18岁或者年龄等于20岁或者年龄等于22岁的学员信息
select * from stu where age in (18, 20, 22);

-- 8. 查询英语成绩为null的学员信息
select * from stu where english is null;
-- 注意:null值的比较不能使用 = !=, 需要使用is    not is! 


-- 模糊查询 like =============================

/*
 通配符:
  (1)_:代表单个任意字符
	(2)%:代表任意个数字符
*/

-- 1. 查询姓'马'的学员信息
select * from stu where name like '马%';

-- 2. 查询第二个字是'花'的学员信息
select * from stu where name like '_花%';

-- 3. 查询名字中包含'德'的学员信息
select * from stu where name like '%德%';


/*
 排序查询:
	* 语法:select 字段列表 from 表名 order by 排序字段名1[排序方式1], 排序字段名2[排序方式2] ...;
	* 排序方式:
			* ASC:升序排列(默认值)
			* DESC:降序排序
*/
-- 1. 查询学生信息,按照年龄升序排列
select * from stu order by age asc;
select * from stu order by age ;

-- 2. 查询学生信息,按照数学成绩降序排列
select * from stu order by math desc;

-- 3. 查询学生信息,按照数学成绩降序排列, 如果数学成绩一样, 再按英语成绩升序排序.
select * from stu order by math desc, english asc;

/*
	聚合函数
		* count: 统计数量
		* max: 求最大值
		* min: 求最小值
		* sum: 求和
		* avg: 求平均值
*/

-- 1. 统计班级一共有多少个学生
select * from stu;
select count(id) from stu; -- count统计的数据不能为null就可以.
select count(english) from stu; 

-- 2. 查询数学成绩的最高分
select max(math) from stu;

-- 3. 查询数学成绩的最低分
select min(math) from stu;

-- 4. 查询数学成绩的总分
select sum(math) from stu;

-- 5. 查询数学成绩的平均分
select avg(math) from stu;

-- 6. 查询英语成绩的最低分
select min(english) from stu; -- null不参与聚合运算.


/*
	分组函数
		select 字段列表 from 表名 [where 分组前条件限定] group by 分组字段名 [having 分组后条件过滤]...;
*/
select * from stu;

-- 1. 查询男同学和女同学各自的数学平均分
select sex, avg(math) from stu group by sex;
-- 注意:分组之后,查询的字段为聚合函数和分组字段,查询其他字段无任何意义
-- select name, sex, avg(math) from stu group by sex;

-- 2. 查询男同学和女同学各自的数学平均分,以及各自人数
select sex, avg(math), count(*) from stu group by sex;

-- 3. 查询男同学和女同学各自的数学平均分,以及各自人数,要求:分数低于70分的不参与分组
select sex, avg(math), count(*) from stu where math > 70 group by sex;

-- 4. 查询男同学和女同学各自的数学平均分,以及各自人数,要求:分数低于70分的不参与分组,分组之后人数大于2.
select sex, avg(math), count(*) from stu where math > 70 group by sex having count(*) > 2;


/*
	分页查询:
			select 字段列表 from 表名 limit 起始索引,查询条目数
				* 起始索引: 从0开始
*/
select * from stu;

-- 1. 从0开始查询,查询3条数据
select * from stu limit 0, 3;

-- 2. 每页显示3条数据,查询第1页数据
select * from stu limit 0, 3;

-- 3. 每页显示3条数据,查询第1页数据
select * from stu limit 3, 3;

-- 4. 每页显示3条数据,查询第1页数据
select * from stu limit 6, 3;

-- 起始索引 = (当前页码 - 1) * 每页显示的条数.







