package java.com.chatting.Chat;


import java.com.chatting.User.DBConnection;

import java.sql.*;

public class ChatDAO {
    private Connection con;
    private ResultSet rs;
    private PreparedStatement pstmt;

    public ChatDAO() {
        try {
            String URL = "jdbc:mysql://localhost:3306/jsp_web_commu?useUnicode=true&characterEncoding=UTF-8&characterSetResults=UTF-8";
            String id = "root";
            String password = "2468";

            con = DBConnection.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void Chat(String nickname, String chat, String createDate) {
        String sql = "select nickname,chat,createDate from chat";
        try {
            pstmt = con.prepareStatement(sql);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
