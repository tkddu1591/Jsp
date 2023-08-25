<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-08-25
  Time: 오전 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>

        <h3>목록</h3>

        <table border="1">
            <tr>
                <th>ID</th>
                <th>이름</th>
                <th>전화번호</th>
                <th>직책</th>
                <th>부서</th>
                <th>입사일</th>
                <th>관리</th>
            </tr>
            <c:forEach var="list" items="${requestScope.memberDTOS}">
            <tr>
                <td>${list.getUid()}</td>
                <td>${list.getName()}</td>
                <td>${list.getHp()}</td>
                <td>${list.getPos()}</td>
                <td>${list.getDep()}</td>
                <td>${list.getrDate()}</td>
                <td>
                    <a href="modify.do?uid=${list.getUid()}">수정</a>
                    <a href="delete.do?uid=${list.getUid()}">삭제</a>
                </td>
            </tr>
            </c:forEach>
        </table>


        <a href="register.do">추가</a>
        <a href="index.jsp">홈</a>
    </body>
</html>
