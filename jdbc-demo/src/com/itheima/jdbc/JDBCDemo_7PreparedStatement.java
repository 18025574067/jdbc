package com.itheima.jdbc;

import org.junit.Test;
import java.sql.*;

/**
    JDBC API详解: ResultSet.
 */
public class JDBCDemo_7PreparedStatement {
    /**
        SQL防注入.
     */
    @Test
    public void testPreparedStatement() throws Exception {
        // 2. 获取连接 如果连接是本地的MySQL, 并且端口是3306, 可以简化书写.
        String url = "jdbc:mysql:///db1?useSSL=false";
        String user = "root";
        String password = "mysql";
        Connection conn =  DriverManager.getConnection(url, user, password);

        // 接收用户输入的用户名和密码
        String name = "张三";
//        String pwd = "' or '1' = '1";
        String pwd = "123";

        String sql = "select * from tb_user where username = ? and password = ?";

        // 获取pstmt对象
        PreparedStatement pstmt = conn.prepareStatement(sql);

        // 设置?的值
        pstmt.setString(1, name);
        pstmt.setString(2, pwd);

        // 执行sql语句
        ResultSet rs = pstmt.executeQuery();

        // 判断登录是否成功
        if (rs.next()){
            // 登录成功
            System.out.println("登录成功");
        }else {
            System.out.println("登录失败");
        }

        // 7. 释放资源
        rs.close();
        pstmt.close();
        conn.close();
    }

    /**
     SQL防注入.
     */
    @Test
    public void testPreparedStatement2() throws Exception {
        // 2. 获取连接 如果连接是本地的MySQL, 并且端口是3306, 可以简化书写.
        String url = "jdbc:mysql:///db1?useSSL=false";
        String user = "root";
        String password = "mysql";
        Connection conn =  DriverManager.getConnection(url, user, password);

        // 接收用户输入的用户名和密码
        String name = "张三";
        String pwd = "' or '1' = '1";
//        String pwd = "123";

        String sql = "select * from tb_user where username = ? and password = ?";

        // 获取pstmt对象
        PreparedStatement pstmt = conn.prepareStatement(sql);

        // 设置?的值
        pstmt.setString(1, name);
        pstmt.setString(2, pwd);

        // 执行sql语句
        ResultSet rs = pstmt.executeQuery();

        // 判断登录是否成功
        if (rs.next()){
            // 登录成功
            System.out.println("登录成功");
        }else {
            System.out.println("登录失败");
        }

        // 7. 释放资源
        rs.close();
        pstmt.close();
        conn.close();
    }
}
