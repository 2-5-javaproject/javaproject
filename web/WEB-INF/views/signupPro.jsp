<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.chatting.User.UserBean" %>
<%@ page import="com.chatting.User.UserDAO" %>

<html>
<head>
    <title>회원가입 처리</title>
</head>
<body>
    <%request.setCharacterEncoding("utf-8");%>
    <jsp:useBean id="userBean" class="com.chatting.User.UserBean" />
    <jsp:setProperty name="userBean" property="*" />

    <%
        UserDAO dao = UserDAO.getInstance();
        dao.signup(userBean);
    %>
    <div>
        <div><%=userBean.getNickname()%>님! 회원가입을 환영합니다!</div>
        <div><a href="login.jsp">로그인 페이지로 이동!</a></div>
    </div>
</body>
</html>
