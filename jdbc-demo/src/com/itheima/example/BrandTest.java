package com.itheima.example;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.itheima.pojo.Brand;
import org.junit.Test;

import javax.sql.DataSource;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * 品牌数据的增删改查操作
 */
public class BrandTest {

    /**
     * 查询所有
     * 1. SQL:select * from tb_brand;
     * 2. 参数: 不需要
     * 3. 结果: List<Brand>
     */
    @Test
    public void testSelectAll() throws Exception {

        // 1. 获取Connection对象
        // 3. 加载配置文件
        Properties prop = new Properties();
        prop.load(new FileInputStream("../jdbc-demo/src/druid.properties"));
        // 4. 获取连接池对象
        DataSource dataSource = DruidDataSourceFactory.createDataSource(prop);
        // 5. 获取数据库连接 connection
        Connection conn = dataSource.getConnection();

        // 2. 定义sql语句
        String sql = "select * from tb_brand;";

        // 3. 获取pstms对象
        PreparedStatement pstms = conn.prepareStatement(sql);

        // 4. 设置参数

        // 5. 执行sql语句
        ResultSet rs = pstms.executeQuery();

        // 6. 处理结果, List<Brand> 封装Brand对象, 装载List对象
        Brand brand = null;
        List<Brand> brands = new ArrayList<>();
        while (rs.next()){
            // 获取数据
            int id = rs.getInt("id");
            String brandName = rs.getString("brand_name");
            String companyName = rs.getString("company_name");
            int ordered = rs.getInt("ordered");
            String description = rs.getString("description");
            int status = rs.getInt("status");

            // 封装Brand对象
            brand = new Brand();
            brand.setId(id);
            brand.setBrandName(brandName);
            brand.setCompanyName(companyName);
            brand.setOrdered(ordered);
            brand.setDescription(description);
            brand.setStatus(status);

            // 装载集合
            brands.add(brand);
        }

        System.out.println(brands);

        // 7. 释放资源
        rs.close();
        pstms.close();
        conn.close();
    }

    /**
     * 添加
     * 1. SQL:insert into tb_brand(brand_name, company_name, ordered, description, status) values(?, ?, ?, ?, ?);
     * 2. 参数: 除了id之外所有参数.
     * 3. 结果: 返回值为boolean.
     */
    @Test
    public void testAdd() throws Exception {
        // 接收页面提交的数据
        String brandName = "香飘飘奶茶";
        String companyName = "香飘飘股份有限公司";
        int ordered = 1;
        String description = "绕地球一圈";
        int status = 1;


        // 1. 获取Connection对象
        // 3. 加载配置文件
        Properties prop = new Properties();
        prop.load(new FileInputStream("../jdbc-demo/src/druid.properties"));
        // 4. 获取连接池对象
        DataSource dataSource = DruidDataSourceFactory.createDataSource(prop);
        // 5. 获取数据库连接 connection
        Connection conn = dataSource.getConnection();

        // 2. 定义sql语句
        String sql = "insert into tb_brand(brand_name, company_name, ordered, description, status) values(?, ?, ?, ?, ?);";

        // 3. 获取pstms对象
        PreparedStatement pstms = conn.prepareStatement(sql);

        // 4. 设置参数
        pstms.setString(1, brandName);
        pstms.setString(2, companyName);
        pstms.setInt(3, ordered);
        pstms.setString(4, description);
        pstms.setInt(5, status);

        // 5. 执行sql语句
        int count = pstms.executeUpdate(); // 影响的行数.

        // 6. 输出结果
        System.out.println(count > 0);

        // 7. 释放资源
        pstms.close();
        conn.close();
    }

    /**
     * 修改
     * 1. SQL:
     update tb_brand
     set brand_name=?,
     company_name=?,
     ordered=?,
     description=?,
     status=?
     where id=?;
     * 2. 参数: 需要所有参数.
     * 3. 结果: 返回值为boolean.
     */
    @Test
    public void testUpdate() throws Exception {
        // 接收页面提交的数据
        String brandName = "香飘飘";
        String companyName = "香飘飘股份有限公司";
        int ordered = 1000;
        String description = "绕地球一圈";
        int status = 1;
        int id = 4;

        // 1. 获取Connection对象
        // 3. 加载配置文件
        Properties prop = new Properties();
        prop.load(new FileInputStream("../jdbc-demo/src/druid.properties"));
        // 4. 获取连接池对象
        DataSource dataSource = DruidDataSourceFactory.createDataSource(prop);
        // 5. 获取数据库连接 connection
        Connection conn = dataSource.getConnection();

        // 2. 定义sql语句
        String sql = " update tb_brand \n" +
                "                set brand_name=?, \n" +
                "                company_name=?, \n" +
                "                ordered=?, \n" +
                "                description=?, \n" +
                "                status=? \n" +
                "             where id=?;";

        // 3. 获取pstms对象
        PreparedStatement pstms = conn.prepareStatement(sql);

        // 4. 设置参数
        pstms.setString(1, brandName);
        pstms.setString(2, companyName);
        pstms.setInt(3, ordered);
        pstms.setString(4, description);
        pstms.setInt(5, status);
        pstms.setInt(6, id);

        // 5. 执行sql语句
        int count = pstms.executeUpdate(); // 影响的行数.

        // 6. 输出结果
        System.out.println(count > 0);

        // 7. 释放资源
        pstms.close();
        conn.close();
    }


    /**
     * 删除
     * 1. SQL: delete from tb_brand where id=?;
     * 2. 参数: 只需要id
     * 3. 结果: 返回值为boolean.
     */
    @Test
    public void testDelete() throws Exception {
        // 接收页面提交的数据
        int id = 4;

        // 1. 获取Connection对象
        // 3. 加载配置文件
        Properties prop = new Properties();
        prop.load(new FileInputStream("../jdbc-demo/src/druid.properties"));
        // 4. 获取连接池对象
        DataSource dataSource = DruidDataSourceFactory.createDataSource(prop);
        // 5. 获取数据库连接 connection
        Connection conn = dataSource.getConnection();

        // 2. 定义sql语句
        String sql = "delete from tb_brand where id=?";

        // 3. 获取pstms对象
        PreparedStatement pstms = conn.prepareStatement(sql);

        // 4. 设置参数
        pstms.setInt(1, id);

        // 5. 执行sql语句
        int count = pstms.executeUpdate(); // 影响的行数.

        // 6. 输出结果
        System.out.println(count > 0);

        // 7. 释放资源
        pstms.close();
        conn.close();
    }
}