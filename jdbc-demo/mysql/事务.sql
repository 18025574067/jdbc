drop table if exists account;

-- 创建账户表
create table account(
  id int primary key auto_increment,
  name varchar(10),
  money double(10, 2)
);

-- 添加数据
insert into account(name, money) values('张三', 1000), ('李四', 1000);

begin;
-- 转账操作
-- 1. 查询李四的账户
-- select * from account where name='李四';
-- 2. 李四账户-500
update account set money = money - 500 where name='李四';
-- 出错了
-- 3. 张三账户+500
update account set money = money + 500 where name='张三';
-- 事务提交
commit;

-- 事务回滚
-- rollback;

-- 1. 查询事务的默认提交方式
-- select @@autocommit;
-- 2. 修改事务的提交方式 手动提交
-- set @@autocommit = false;

select * from account;