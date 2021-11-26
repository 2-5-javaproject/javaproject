package com.chatting.User;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    private Connection con;
    private PreparedStatement pstmt;
    private DataSource dataFactory;

    public UserDAO(){
        try {
            Context ctx = new InitialContext();
            Context envContext = (Context) ctx.lookup("java:/comp/env");
            dataFactory = (DataSource) envContext.lookup("jdbc/mysql");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void signup(UserVO userVO) {
        try {
            con = dataFactory.getConnection();
            String email = userVO.getEmail();
            String password = userVO.getPassword();
            String nickname = userVO.getNickname();

            String query = "insert into jdbc.user";
            query += " (email, password, nickname)";
            query += " value(?,?,?)";

            pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            pstmt.setString(3, nickname);
            pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void serchUser(UserVO userVO) {
        try {
            con = dataFactory.getConnection();
            String query = "select " + userVO.getEmail() + " from jdbc.chat ";
            pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
