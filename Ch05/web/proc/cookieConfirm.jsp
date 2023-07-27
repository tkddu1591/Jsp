<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-27
  Time: 오전 9:32
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>cookieConfirm</title>
    </head>
    <body>
        <h3>쿠키확인</h3>
        <%
            Cookie[] cookies = request.getCookies();
            for (Cookie cookie : cookies) {
        %>
        <p>
            쿠키명 : <%=cookie.getName()%><br>
            쿠키값 : <%=cookie.getValue()%><br>
        </p>
        <%
            }
        %>
        <a href="../index.jsp">홈</a>
    </body>
</html>
