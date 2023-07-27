<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-25
  Time: 오전 11:33
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>forward2</title>
    </head>
    <body>
        <h3>forward22 페이지</h3>
        <%
            //forward는 서버 자원내에서 제어권 이동이기 때문에 타 서버 자원으로 이동 불가.
            pageContext.forward("https://naver.com");
        %>

    </body>
</html>
