-- 查询所有数据
SELECT * FROM stu;
-- 给指定列添加数据 INSERT INTO 表名（列名 1, 列名 2, ...）VALUES(值 1, 值 2,...);
INSERT INTO stu ( id, NAME ) VALUES( 1, '张小三' );
-- 给所有列添加数据
INSERT INTO stu ( id, NAME, gender, birthday, score, email, tel, STATUS ) VALUES( 2, '李四', '男', '1999-11-11', 88.88, 'lisi@itcast.cn' '18888888888', 1 );
SELECT * FROM stu;
-- 修改数据 update 表名 set 列名1=值1, 列名2=值2,... [where 条件];
-- 将张三的性别改为女
UPDATE stu SET gender = '女' WHERE 	NAME = '张三';
-- 将张三的生日改为1999-12-12 分数改为99.99
UPDATE stu SET birthday = '1999-12-12', score = 99.99 WHERE	NAME = '张三';

-- 删除 delete from 表名 [where 条件];
delete from stu where name='张小三';
-- 如果删除不加条件，则会删除表中所有数据。
delete from stu;












