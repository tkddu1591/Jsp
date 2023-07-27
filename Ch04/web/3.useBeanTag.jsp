<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-26
  Time: 오전 11:39
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>useBeanTag</title>
    </head>
    <body>
        <form action="./proc/userProc.jsp" method="get">
            <input type="text" name="uid" placeholder="아이디 입력"><br>
            <input type="text" name="name" placeholder="이름 입력"><br>
            <input type="text" name="hp" placeholder="휴대폰 번호 입력"><br>
            <input type="number" name="age" placeholder="나이 입력"><br>
            <input type="submit" value="전송하기"><br>
        </form>


    </body>
</html>
