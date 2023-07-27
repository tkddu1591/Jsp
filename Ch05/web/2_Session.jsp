<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-27
  Time: 오전 10:05
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Session</title>
    </head>
    <body>
        <h3>Session</h3>
        <form action="proc/loginProc.jsp" method="post">
            <input type="text" name="id" placeholder="아이디 입력"><br>
            <input type="password" name="pw" placeholder="비밀번호 입력"><br>
            <input type="submit"  placeholder="로그인"><br>
        </form>
        <a href="index.jsp">홈</a>

    </body>
</html>
