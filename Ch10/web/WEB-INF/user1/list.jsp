
<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-28
  Time: 오전 9:41
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <meta charset="UTF-8">
        <title>user1::list</title>

    </head>
    <body>
        <h3>User1 목록</h3>

        <a href="/Ch10_war_exploded/user1/register.do">추가</a><br>
        <a href="/Ch10_war_exploded/index.jsp">홈</a><br>
        <table border="1">
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>hp</th>
                <th>나이</th>
                <th>관리</th>
            </tr>
            <c:forEach var="user" items="${requestScope.users}">
            <tr>
                <td>${user.getUid()}</td>
                <td>${user.getName()}</td>
                <td>${user.getHp()}</td>
                <td>${user.getAge()}</td>
                <td>
                    <a href="#">수정</a> |
                    <a href="/Ch10_war_exploded/delete.do">삭제</a>
                </td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>
