<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.chatting.User.UserDAO" %>
<html>
<head>
    <title>로그인 처리</title>
</head>
<body>
    <%request.setCharacterEncoding("utf-8");%>
    <%
        UserDAO dao = UserDAO.getInstance();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String nickname = dao.findOfNickname(email);
        String check = dao.login(email, password);

        if(check.equals("success")){
            session.setAttribute("sessinID", nickname); //nickname
    %>
    <script>
        alert("로그인 성공");
        location.href = '/chatting';
    </script>
    <%
        } else if(check.equals("password fail")) {
    %>
    <script>
        alert("비밀번호가 틀렸습니다.");
        history.back();
    </script>
    <%
        }else {
    %>
    <script>
        alert("아이디가 틀렸습니다.");
        history.back();
    </script>
    <%
        }
    %>
</body>
</html>
