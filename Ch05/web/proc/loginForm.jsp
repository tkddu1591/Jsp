<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-27
  Time: 오전 11:15
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    //자동 로그인 체크여부에 따라 로그인 처리
    Cookie[] cookies = request.getCookies();

    for (Cookie cookie : cookies) {
        if (cookie.getName().equals("cid")) {
            session.setAttribute("sessid", cookie.getValue());
        }
    }
    //로그인 여부
    String sessid = (String) session.getAttribute("sessid");
    if (sessid != null) {
        response.sendRedirect("loginSuccess.jsp");
        return;
    }
%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>loginForm</title>
    </head>
    <body>
        <h3>loginForm</h3>
        <form action="loginProc.jsp" method="post">
            <input type="text" name="id" placeholder="아이디 입력"><br>
            <input type="password" name="pw" placeholder="비밀번호 입력"><br>
            <label><input type="checkbox" name="auto" placeholder="auto" value="1">AutoLogin</label><br>
            <input type="submit" placeholder="로그인"><br>
        </form>
        <a href="../index.jsp">홈</a>

    </body>
</html>
