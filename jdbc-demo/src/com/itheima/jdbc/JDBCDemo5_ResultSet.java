package com.itheima.jdbc;

import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
    JDBC API详解: ResultSet.
 */
public class JDBCDemo5_ResultSet {
    /**
        执行DQL语句.
     */
    @Test
    public void testResultSet() throws Exception {
        // 1. 注册驱动
        // Class.forName("com.mysql.jdbc.Driver");

        // 2. 获取连接 如果连接是本地的MySQL, 并且端口是3306, 可以简化书写.
        String url = "jdbc:mysql:///db1?useSSL=false";
        String user = "root";
        String password = "mysql";
        Connection conn =  DriverManager.getConnection(url, user, password);

        // 3. 定义sql语句
        String sql = "select * from account";

        // 4. 获取statement对象
        Statement stmt = conn.createStatement();

        // 5. 执行sql语句
        ResultSet rs = stmt.executeQuery(sql);

        // 6. 处理结果, 遍历rs中的所有数据
        // 6.1 光标向下移动一行, 并且判断当前行是否有数据.
        while (rs.next()){
            // 6.2 获取数据 getXxx();
            int id = rs.getInt(1);
            String name = rs.getString(2);
            double money = rs.getDouble(3);

            System.out.println("id:" + id + ", name:" + name + ", money:" + money);
            System.out.println("===========");
        }

        // 7. 关闭资源
        rs.close();
        stmt.close();
        conn.close();
    }
}
