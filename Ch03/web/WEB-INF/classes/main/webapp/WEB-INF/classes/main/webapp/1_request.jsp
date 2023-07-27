<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-25
  Time: 오전 9:29
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>1.request</title>
    </head>
    <body>
        <h3>1.request 내장객체</h3>
        <form action="./prog/userProc.jsp">

            <input type="text" name="uid" placeholder="아이디 입력"><br>
            <input type="text" name="name" placeholder="이름 입력"><br>
            <input type="text" name="age" placeholder="나이 입력"><br>
            <input type="submit" placeholder="전송하기"><br>
        </form>
    </body>
</html>
