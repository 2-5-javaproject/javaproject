
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그아웃 처리</title>
</head>
<body>
<%
    session.invalidate();
    response.sendRedirect("/index");
%>
</body>
</html>
