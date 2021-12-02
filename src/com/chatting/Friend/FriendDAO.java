package com.chatting.Friend;

import com.chatting.User.DBConnection;
import com.chatting.User.UserBean;
import com.chatting.User.UserDAO;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FriendDAO {
    private static FriendDAO instance;
    private Connection con;
    private PreparedStatement pstmt;

    public FriendDAO() {

    }

    public static FriendDAO getInstance() {
        if (instance == null) {
            instance = new FriendDAO();
        }
        return instance;
    }

    public void friendAdd(String myName, String friendName) throws SQLException {
        try {
            if (myName == friendName){
                return;
            }
            con = DBConnection.getConnection();
            con.setAutoCommit(false);

            String query = "insert into friend";
            query += " (friendname, nickname)";
            query += " values(?,?)";

            pstmt = con.prepareStatement(query);
            pstmt.setString(1, friendName);
            pstmt.setString(2, myName);

            pstmt.executeUpdate();
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
    }

    public List<String> friendList(String myName) throws SQLException {
        ResultSet rs = null;
        List<String> friendList = new ArrayList<>();
        String test;
        try {
            con = DBConnection.getConnection();
            con.setAutoCommit(false);

            String query = "select friendname from friend where nickname = ?";
            pstmt = con.prepareStatement(query);
            pstmt.setString(1, myName);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                friendList.add(rs.getString(1));
            }
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
        return friendList;
    }
}
