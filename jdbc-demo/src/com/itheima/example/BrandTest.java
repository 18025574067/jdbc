package com.itheima.example;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import org.junit.Test;

import javax.sql.DataSource;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

/**
 *
 * 品牌数据的增删改查操作
 *
 */
public class BrandTest {
    @Test
    public void testSelectAll() throws Exception {
        /**
         * 查询所有
         * 1. SQL:select * from tb_brand;
         * 2. 参数: 不需要
         * 3. 结果: List<Brand>
         */

        // 1. 获取Connection对象
        // 3. 加载配置文件
        Properties prop = new Properties();
        prop.load(new FileInputStream("jdbc-demo/src/druid.properties"));
        // 4. 获取连接池对象
        DataSource dataSource = DruidDataSourceFactory.createDataSource(prop);
        // 5. 获取数据库连接 connection
        Connection conn = dataSource.getConnection();

        // 2. 定义sql语句
        String sql = "select * from tb_brand";

        // 3. 获取pstms对象
        PreparedStatement pstms = conn.prepareStatement(sql);

        // 4. 设置参数

        // 5. 执行sql语句
        ResultSet rs = pstms.executeQuery();

        // 6. 处理结果, List<Brand> 封装Brand对象, 装载List对象
        while (rs.next()){
            // 获取数据

            // 封装Brand对象

            // 装载集合

        }

        // 7. 释放资源
        rs.close();
        pstms.close();
        conn.close();
    }
}
