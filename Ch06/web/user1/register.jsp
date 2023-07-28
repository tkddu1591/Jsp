<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-28
  Time: 오전 9:16
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>user1::register</title>
    </head>
    <body>
        <h3>User1 등록</h3>

        <a href="list.jsp">목록</a><br>
        <a href="../1_JDBC.jsp">홈</a><br>
        <form action="registerProc.jsp" method="post">
            <table border="1">
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="uid"></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td><input type="text" name="hp"></td>
                </tr>
                <tr>
                    <td>나이</td>
                    <td><input type="number" name="age"></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><input type="submit" value="등록"></td>
                </tr>
            </table>
        </form>

    </body>
</html>
