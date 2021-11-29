package com.chatting.User;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.lang.reflect.Member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    private static UserDAO instance;
    private Connection con;
    private PreparedStatement pstmt;
    private DataSource dataFactory;

    public UserDAO(){
//        try {
//            Context ctx = new InitialContext();
//            Context envContext = (Context) ctx.lookup("java:/comp/env");
//            dataFactory = (DataSource) envContext.lookup("jdbc/mysql");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    }
    public static UserDAO getInstance(){
        if (instance==null){
            instance = new UserDAO();
        }
        return instance;
    }

    public void signup(UserBean user) throws SQLException {
        try {
            con = DBConnection.getConnection(); // DBConnection의 Connection con 반환
            con.setAutoCommit(false); // SQL 문장이 실패 시 아무런 데이터도 들어가지 않게 한다.

            String email = user.getEmail();
            String password = user.getPassword();
            String nickname = user.getNickname();

            String query = "insert into jdbc.user";
            query += " (email, password, nickname)";
            query += " values(?,?,?)";

            pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            pstmt.setString(3, nickname);

            pstmt.executeUpdate();
            con.commit();
        } catch (ClassNotFoundException | NamingException | SQLException sqle) {
            con.rollback();
        } finally {
            try{
                if (pstmt != null) {
                    pstmt.close();
                    pstmt=null;
                }
                if (con != null) {
                    con.close();
                    con=null;
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }

    public String login(String email, String password) {
        String pwdCheck = "";
        String result = "";
        ResultSet rs = null;

        try {
            con = DBConnection.getConnection();
            String query = "select password from jdbc.user where " + email + "=?";
            pstmt = con.prepareStatement(query);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                pwdCheck = rs.getString("password");
                if (pwdCheck.equals(password)) {
                    result = "success";
                } else {
                    result = "password fail";
                }
            } else {
                result = "email fail";
            }
        }catch (Exception e){
            e.printStackTrace();
        } finally {
            try{
                if (pstmt != null) {
                    pstmt.close();
                    pstmt=null;
                }
                if (con != null) {
                    con.close();
                    con=null;
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            return result;
        }
    }

    public void serchUser(UserBean user) {
        try {
            con = dataFactory.getConnection();
            String query = "select " + user.getEmail() + " from jdbc.chat ";
            pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
