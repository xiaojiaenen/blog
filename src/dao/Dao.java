package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dao {
    public Connection getConn(){
        Connection conn=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/blog?useUnicode=true&characterEncoding=utf8","root","123456");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    return conn;
    }
}
