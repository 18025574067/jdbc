package com.itheima.jdbc;

import com.itheima.pojo.Account;
import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
    JDBC API详解: ResultSet.
 */
public class JDBCDemo6_UserLogin {
    /**
        执行DQL语句.
     */
    @Test
    public void testLogin() throws Exception {
        // 2. 获取连接 如果连接是本地的MySQL, 并且端口是3306, 可以简化书写.
        String url = "jdbc:mysql:///db1?useSSL=false";
        String user = "root";
        String password = "mysql";
        Connection conn =  DriverManager.getConnection(url, user, password);

        // 接收用户输入的用户名和密码
        String username = "张三";
        String pwd = "123";

        String sql = "select * from tb_user where username = '"+username+"' and password = '"+pwd+"'";

        // 获取stmt对象
        Statement stmt = conn.createStatement();

        // 执行sql语句
        ResultSet rs = stmt.executeQuery(sql);

        // 判断登录是否成功
        if (rs.next()){
            // 登录成功
            System.out.println("登录成功");
        }else {
            System.out.println("登录失败");
        }

        // 7. 释放资源
        rs.close();
        stmt.close();
        conn.close();
    }


    /**
     * 演示SQL注入.
     */
    @Test
    public void testLogin_Inject() throws Exception {
        // 2. 获取连接 如果连接是本地的MySQL, 并且端口是3306, 可以简化书写.
        String url = "jdbc:mysql:///db1?useSSL=false";
        String user = "root";
        String password = "mysql";
        Connection conn =  DriverManager.getConnection(url, user, password);

        // 接收用户输入的用户名和密码
        String username = "lejovbnr";
        String pwd = "' or '1' = '1";

        String sql = "select * from tb_user where username = '"+username+"' and password = '"+pwd+"'";
        System.out.println(sql);
        // 获取stmt对象
        Statement stmt = conn.createStatement();

        // 执行sql语句
        ResultSet rs = stmt.executeQuery(sql);

        // 判断登录是否成功
        if (rs.next()){
            // 登录成功
            System.out.println("登录成功");
        }else {
            System.out.println("登录失败");
        }

        // 7. 释放资源
        rs.close();
        stmt.close();
        conn.close();
    }


}
