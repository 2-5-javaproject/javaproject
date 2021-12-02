package com.chatting.User;

import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    private static UserDAO instance;
    private Connection con;
    private PreparedStatement pstmt;
    private DataSource dataFactory;

    public UserDAO() {

    }

    public static UserDAO getInstance() {
        if (instance == null) {
            instance = new UserDAO();
        }
        return instance;
    }

    public String signup(UserBean user) throws SQLException {
        String result = "";
        try {
            con = DBConnection.getConnection(); // DBConnection의 Connection con 반환
            con.setAutoCommit(false); // SQL 문장이 실패 시 아무런 데이터도 들어가지 않게 한다.

            String query = "insert into user";
            query += " (email, password, nickname)";
            query += " values(?,?,?)";

            pstmt = con.prepareStatement(query);
            pstmt.setString(1, user.getEmail());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getNickname());

            pstmt.executeUpdate();
            result = "success";
            con.commit();
        } catch (ClassNotFoundException | NamingException | SQLException sqle) {
            con.rollback();
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                    pstmt = null;
                }
                if (con != null) {
                    con.close();
                    con = null;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public String emailCheck(String email) {
        String result = "";
        ResultSet rs = null;
        try {
            con = DBConnection.getConnection();
            String query = "select email from user where email = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                result = "fail";
            } else {
                result = "success";
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
                if (pstmt != null) {
                    pstmt.close();
                    pstmt = null;
                }
                if (con != null) {
                    con.close();
                    con = null;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public String login(String email, String password) {
        String pwdCheck = "";
        String result = "";
        ResultSet rs = null;

        try {
            con = DBConnection.getConnection();
            String query = "select password from user where email = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
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
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
                if (pstmt != null) {
                    pstmt.close();
                    pstmt = null;
                }
                if (con != null) {
                    con.close();
                    con = null;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public String findOfNickname(String email) {
        ResultSet rs = null;
        String nickname = "none";
        try {
            con = DBConnection.getConnection();
            String query = "select nickname from user where email = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                nickname = rs.getString(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                    rs = null;
                }
                if (pstmt != null) {
                    pstmt.close();
                    pstmt = null;
                }
                if (con != null) {
                    con.close();
                    con = null;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return nickname;
    }
}

