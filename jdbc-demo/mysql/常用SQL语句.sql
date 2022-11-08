MySQL常用SQL语句大全

江南极客

于 2017-12-21 19:22:28 发布


 　　1、新建用户：

 　　　　>CREATE USER name IDENTIFIED BY 'ssapdrow';

 　　2、更改密码：

 　　　　>SET PASSWORD FOR name=PASSWORD('fdddfd');

 　　3、权限管理

 　　　　>SHOW GRANTS FOR name;    //查看name用户权限

 　　　　>GRANT SELECT ON db_name.* TO name;　　　　//给name用户db_name数据库的所有权限

 　　　　>REVOKE SELECT ON db_name.* TO name;　　　　//GRANT的反操作，去除权限；

一、数据库操作：　

 　　1、查看数据库：

 　　　　>SHOW DATABASES;

 　　2、创建数据库：

 　　　　>CREATE DATABASE db_name;　　//db_name为数据库名

 　　3、使用数据库：

 　　　　>USE db_name;

 　　4、删除数据库：

 　　　　>DROP DATABASE db_name;

二、创建表：

 　　1、创建表：

 　　　　>CREATE TABLE table_name(

         　　　　>id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,　　　　//id值，无符号、非空、递增——唯一性，可做主键。

         　　　　>name VARCHAR(60) NOT NULL

         　　　　>score TINYINT UNSIGNED NOT NULL DEFAULT 0,　　　　//设置默认列值

         　　　　>PRIMARY KEY(id)

         　　　　>)ENGINE=InnoDB　　　　//设置表的存储引擎，一般常用InnoDB和MyISAM；InnoDB可靠，支持事务；MyISAM高效不支持全文检索

 　　　　>DEFAULT charset=utf8;　　//设置默认的编码，防止数据库中文乱码

 　　　　如果有条件的创建数据表还可以使用   >CREATE TABLE IF NOT EXISTS tb_name(........

         　　2、复制表：

         　　　　>CREATE TABLE tb_name2 SELECT * FROM tb_name;

         　　　　或者部分复制：

         　　　　>CREATE TABLE tb_name2 SELECT id,name FROM tb_name;

         　　3、创建临时表：

         　　　　>CREATE TEMPORARY TABLE tb_name(这里和创建普通表一样);

         　　4、查看数据库中可用的表：

         　　　　>SHOW TABLES;

         　　5、查看表的结构：

         　　　　>DESCRIBE tb_name;

 　　　　也可以使用：

 　　　　>SHOW COLUMNS in tb_name; 　　　　//from也可以

 　　6、删除表：

 　　　　>DROP [ TEMPORARY ] TABLE [ IF EXISTS ] tb_name[ ,tb_name2.......];

 　　　　实例：

 　　　　>DROP TABLE IF EXISTS tb_name;

 　　7、表重命名：

 　　　　>RENAME TABLE name_old TO name_new;

 　　　　还可以使用：

 　　　　>ALTER TABLE name_old RENAME name_new;

三、修改表：

 　　1、更改表结构：

 　　　　>ALTER TABLE tb_name ADD[CHANGE,RENAME,DROP] ...要更改的内容...

 　　　　实例：

 　　　　>ALTER TABLE tb_name ADD COLUMN address varchar(80) NOT NULL;

 　　　　>ALTER TABLE tb_name DROP address;

 　　　　>ALTER TABLE tb_name CHANGE score score SMALLINT(4) NOT NULL;

四、插入数据：

 　　1、插入数据：

 　　　　>INSERT INTO tb_name(id,name,score)VALUES(NULL,'张三',140),(NULL,'张四',178),(NULL,'张五',134);

 　　　　这里的插入多条数据直接在后边加上逗号，直接写入插入的数据即可；主键id是自增的列，可以不用写。

 　　2、插入检索出来的数据：

 　　　　>INSERT INTO tb_name(name,score) SELECT name,score FROM tb_name2;

五、更新数据：

 　　1、指定更新数据：

 　　　　>UPDATE tb_name SET score=189 WHERE id=2;

 　　　　>UPDATE tablename SET columnName=NewValue [ WHERE condition ]

六、删除数据：

 　　1、删除数据：

 　　　　>DELETE FROM tb_name WHERE id=3;

七、条件控制：

 　　1、WHERE 语句：

 　　　　>SELECT * FROM tb_name WHERE id=3;

 　　2、HAVING 语句：

 　　　　>SELECT * FROM tb_name GROUP BY score HAVING count(*)>2

 　　3、相关条件控制符： 

 　　　　=、>、<、<>、IN(1,2,3......)、BETWEEN a AND b、NOT

 　　　　AND 、OR

 　　　　Linke()用法中      %  为匹配任意、  _  匹配一个字符（可以是汉字）

 　　　　IS NULL 空值检测

八、MySQL的正则表达式：

  　　1、Mysql支持REGEXP的正则表达式：

  　　　　>SELECT * FROM tb_name WHERE name REGEXP '^[A-D]'   //找出以A-D 为开头的name

  　　2、特殊字符需要转义。

九、MySQL的一些函数：

   　　1、字符串链接——CONCAT()

    　　　　>SELECT CONCAT(name,'=>',score) FROM tb_name

    　　2、数学函数：

    　　　　AVG、SUM、MAX、MIN、COUNT；

    　　3、文本处理函数：

    　　　　TRIM、LOCATE、UPPER、LOWER、SUBSTRING

    　　4、运算符：

    　　　　+、-、*、\

    　　5、时间函数：

    　　　　DATE()、CURTIME()、DAY()、YEAR()、NOW().....

十、分组查询：

      　　1、分组查询可以按照指定的列进行分组：

      　　　　>SELECT COUNT(*) FROM tb_name GROUP BY score HAVING COUNT(*)>1;

      　　2、条件使用Having；

      　　3、ORDER BY 排序：

      　　　　ORDER BY DESC|ASC　　　　=>按数据的降序和升序排列

十一、UNION规则——可以执行两个语句（可以去除重复行）

十二、全文检索——MATCH和AGAINST

       　　1、SELECT MATCH(note_text)AGAINST('PICASO') FROM tb_name;

       　　2、InnoDB引擎不支持全文检索，MyISAM可以；

十三、视图

        　　1、创建视图

        　　　　>CREATE VIEW name AS SELECT * FROM tb_name WHERE ~~ ORDER BY ~~;

        　　2、视图的特殊作用：

        　　　　　　a、简化表之间的联结（把联结写在select中）；

        　　　　　　b、重新格式化输出检索的数据（TRIM，CONCAT等函数）；

        　　　　　　c、过滤不想要的数据（select部分）

        　　　　　　d、使用视图计算字段值，如汇总这样的值。

十四、使用存储过程：

         　　个人理解，存储过程就是一个自定义函数，有局部变量参数，可传入参数，可以返回值，不过这语法够呆滞的~~~

         　　1、创建存储过程：

         　　　　>CREATE PROCEDURE pro(

                 　　　　>IN num INT,OUT total INT)

         　　　　>BEGIN

         　　　　>SELECT SUM(score) INTO total FROM tb_name WHERE id=num;

         　　　　>END;

         　　　***这里的  IN (传递一个值给存储过程)，OUT（从存储过程传出一个值），INOUT（对存储过程传入、传出），INTO（保存变量）

         　　2、调用存储过程：

         　　　　>CALL pro(13,@total)　　　　　　//这里的存储过程两个变量，一个是IN一个是OUT，这里的OUT也是需要写上的，不写会出错

         　　　　>SELECT @total　　　　　　　　　//这里就可以看到结果了；

         　　3、存储过程的其他操作：

         　　　　>SHOW PROCEDURE STATUS;　　　　　　//显示当期的存储过程

         　　　　>DROP PROCEDURE pro;　　　　　　　　　//删除指定存储过程

十五、使用游标：

         　　对这个理解不是很懂，朋友多多指点哦~~~

         　　　1、游标的操作

         　　　　>CREATE PROCEDURE pro()

    　　　　>BEGIN 

    　　　　>DECLARE ordername CURSOR FOR

    　　　　>SELECT order_num FROM orders;

    　　　　>END;

    　　　　

    　　　　>OPEN ordername;　　　　//打开游标

     

    　　　　>CLOSE ordername;　　　　//关闭游标

十六、触发器：

    　　触发器是指在进行某项指定操作时，触发触发器内指定的操作；

    　　1、支持触发器的语句有DELETE、INSERT、UPDATE,其他均不支持

    　　2、创建触发器：

    　　　　>CREATE TRIGGER trig AFTER INSERT ON ORDERS FOR EACH ROW SELECT NEW.orser_name;

    　　　　>INSERT语句，触发语句，返回一个值

    　　3、删除触发器

    　　　　>DROP TRIGGER trig;

十七、语法整理：

    　　1、ALTER TABLE（修改表）

    　　　　ALTER TABLE table_name

    　　　　(　　ADD　　　　column　　datatype  　　[ NULL | NOT NULL ]　　[ CONSTRAINTS ]

            　　　　　　 CHANGE　　column 　　datatype 　　COLUMNS　　[ NULL | NOT NULL ]　　 [ CONSTRAINTS ]

            　　　　　　 DROP　　　 column，

            　　　　　　　。。。。

            　　　　)

    　　2、COMMIT(处理事务)

    　　　　>COMMIT;

     　　3、CREATE INDEX(在一个或多个列上创建索引)

    　　　　CREATE INDEX index_name ON tb_name (column [ ASC | DESC ] , .......);

     　　4、CREATE PROCEDURE (创建存储过程)

    　　　　CREATE PROCEDURE pro([ parameters ])

    　　　　BEGIN

    　　　　........

    　　　　END

     　　5、CREATE TABLE(创建表)

    　　　　CREATE TABLE tb_name(

            　　　　column_name　　datetype　　[ NULL | NOT NULL ] 　　[ condtraints]   ,

            　　　　column_name　　datetype　　[ NULL | NOT NULL ] 　　[ condtraints]   ,

            　　　　.......

            　　　　PRIMARY KEY( column_name )

            　　　　)ENGINE=[  InnoDB | MyiSAM ]DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

     　　6、CREATE USER(创建用户)

    　　　　CREATE USER user_name [ @hostname ] [ IDENTIFIED BY [ PASSWORD ] 'pass_word' ];

     　　7、CREATE VIEW （在一个或多个表上创建视图）

     　　　　CREATE [ OR REPLACE ] VIEW view_name AS SELECT。。。。。。

      　　8、DELETE (从表中删除一行或多行)

    　　　　DELETE FROM table_name [WHERE ......]

     　　9、DROP(永久删除数据库及对象，如视图、索引等)

    　　　　DROP DATEBASE | INDEX | PROCEDURE | TABLE | TRIGGER | USER | VIEW  name

     　　10、INSERT （给表添加行）

     　　　　INSERT INTO tb_name [ ( columns,...... ) ]  VALUES(value1,............);

     　　　　使用SELECT值插入：

     　　　　INSERT INTO tb_name [ ( columns,...... ) ]

     　　　　SELECT columns , .......   FROM tb_name [ WHERE ...... ] ;

     　　 11、ROLLBACK（撤销一个事务处理块）

     　　　　ROLLBACK [  TO  savapointname  ];

     　　 12、SAVEPOINT(为ROLLBACK设置保留点)

    　　　　SAVEPOINT sp1;

    　　 13、SELECT (检索数据，显示信息)

    　　　　SELECT column_name,.....FROM tb_name  [ WHERE ]   [ UNION ]    [ RROUP BY ]   [ HAVING ]   [ ORDER BY ]

     　　14、START TRANSACTION (一个新的事务处理块的开始)

    　　　　START TRANSACTION

    　　 15、UPDATE(更新一个表中的一行或多行)

    　　　　UPDATE tb_name SET column=value,......[ where ]
