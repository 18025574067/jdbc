package com.itheima.jdbc;

import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;
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

    }
}
