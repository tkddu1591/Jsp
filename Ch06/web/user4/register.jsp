<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-28
  Time: 오후 12:07
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User4::register</title>
    </head>
    <body>
        <h3>User4 등록</h3>
        <a href="list.jsp">목록</a><br>
        <a href="../1_JDBC.jsp">홈</a><br>

        <form action="registerProc.jsp" method="post">
            <table border="1">
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>성별</td>
                    <td>
                        <input type="radio" name="gender" value="1">남자
                        <input type="radio" name="gender" value="2">여자
                    </td>
                </tr>
                <tr>
                    <td>나이</td>
                    <td><input type="number" name="age"></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td><input type="text" name="addr"></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><input type="submit" value="등록"></td>
                </tr>
            </table>
        </form>

    </body>
</html>
