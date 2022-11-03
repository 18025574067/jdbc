package com.itheima.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
    JDBC API详解: DriverManager.
 */
public class JDBCDemo2_DriverManager {
    public static void main(String[] args) throws Exception {
        // 1. 注册驱动
//        Class.forName("com.mysql.jdbc.Driver");

        // 2. 获取连接 如果连接是本地的MySQL, 并且端口是3306, 可以简化书写.
//        String url = "jdbc:mysql://localhost:3306/db1";
//        String url = "jdbc:mysql://localhost:3306/db1?useSSL=false&serverTimezone=UTC";
        String url = "jdbc:mysql:///db1?useSSL=false";
//        String url = "jdbc:mysql:///db1";
        String user = "root";
        String password = "mysql";
        Connection conn =  DriverManager.getConnection(url, user, password);

        // 3. 定义sql语句
        String sql = "update account set money = 3000 where id = 1";

        // 4. 获取执行sql的对象 Statement;
        Statement stmt = conn.createStatement();

        // 5. 执行sql
        int count = stmt.executeUpdate(sql); // 受影响的行数.

        // 6. 处理结果
        System.out.println(count);

        // 7. 释放资源
        stmt.close();
        conn.close();
    }
}
