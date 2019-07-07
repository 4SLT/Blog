package _4slt.dao;

import java.sql.*;

public class DBconnect {

    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/servicedemo";

    static final String USER = "root";
    static final String PASS = "root";

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    /**
     * 创建连接
     */

    public void dbConnect() {

        try {
            //注册驱动
            Class.forName(JDBC_DRIVER);
            //获取连接
            connection = DriverManager.getConnection(DB_URL, USER, PASS);
            //创建Statement对象
            statement = connection.createStatement();
            //准备sql

        } catch (ClassNotFoundException e) {
            System.out.println("注册驱动失败");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("获取连接失败");
            e.printStackTrace();
        }
    }

    /**
     * 断开数据库连接，注意顺序，先statement后connection
     */

    public void dbDisconnect() {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
}