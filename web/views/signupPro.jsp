<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="com.chatting.User.*"%>
<html>
<head>
    <title>회원가입 처리</title>
</head>
<body>
    <%request.setCharacterEncoding("utf-8");%>
    <%
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String nickname = request.getParameter("nickname");
        UserBean userBean = new UserBean(email, password, nickname);
        UserDAO dao = UserDAO.getInstance();
        if (dao.emailCheck(userBean.getEmail()).equals("fail")){
    %>
        <script>
            alert("이미 존재하는 아이디 입니다.")
            history.back();
        </script>
    <%
        } else {
            if(dao.signup(userBean).equals("success")) {
    %>
        <script>
            alert("회원가입을 성공 했습니다.");
            location.href = '/login';
        </script>
    <%
            }else{
    %>
        <script>
            alert("회원가입을 실패 했습니다.");
            history.back();
        </script>
    <%
            }
        }
    %>
</body>
</html>
