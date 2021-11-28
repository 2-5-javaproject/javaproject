package com.chatting.User;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public  static Connection getConnection() throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        String server = "localhost";
        String database = "jdbc";
        String user_name = "root";
        String password = "1234";
//        String password = ""; // 본인 패스워드

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://" + server + "/" + database + "?useSSL=false", user_name, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
