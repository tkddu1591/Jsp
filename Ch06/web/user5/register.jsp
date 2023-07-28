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
        <title>User5::register</title>
    </head>
    <body>
        <h3>User5 등록</h3>
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
                    <td>직급</td>
                    <td>
                        <select name="pos">
                            <option value="사원">사원</option>
                            <option value="대리">대리</option>
                            <option value="과장">과장</option>
                            <option value="차장">차장</option>
                            <option value="부장">부장</option>
                            <option value="사장">사장</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>부서</td>
                    <td>
                        <select name="dname">
                            <option value="101">영업1부</option>
                            <option value="102">영업2부</option>
                            <option value="103">영업3부</option>
                            <option value="104">영업4부</option>
                            <option value="105">영업5부</option>
                            <option value="106">영업지원부</option>
                            <option value="107">인사부</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><input type="submit" value="등록"></td>
                </tr>
            </table>
        </form>

    </body>
</html>
