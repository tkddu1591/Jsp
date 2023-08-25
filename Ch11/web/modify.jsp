<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-08-25
  Time: 오전 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <h3>추가</h3>
            <form action="modify.do" method="post">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="uid" value="${requestScope.memberDTO.getUid()}"></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name" value="${requestScope.memberDTO.getName()}"></td>
                </tr>
                <tr>
                    <td>HP</td>
                    <td><input type="text" name="hp" value="${requestScope.memberDTO.getHp()}"></td>
                </tr>
                <tr>
                    <td>직급</td>
                    <td>
                        <select name="pos">
                            <option value="사원"<c:if test="${requestScope.memberDTO.getPos() eq '사원'}">selected</c:if> >사원</option>
                            <option value="대리"<c:if test="${requestScope.memberDTO.getPos() eq '대리'}">selected</c:if>>대리</option>
                            <option value="과장"<c:if test="${requestScope.memberDTO.getPos() eq '과장'}">selected</c:if>>과장</option>
                            <option value="차장"<c:if test="${requestScope.memberDTO.getPos() eq '차장'}">selected</c:if>>차장</option>
                            <option value="부장"<c:if test="${requestScope.memberDTO.getPos() eq '부장'}">selected</c:if>>부장</option>
                            <option value="사장"<c:if test="${requestScope.memberDTO.getPos() eq '사장'}">selected</c:if>>사장</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>직급</td>
                    <td>
                        <select name="dep">
                            <option value="101"<c:if test="${requestScope.memberDTO.getDep() eq '101'}">selected</c:if>>영업1부</option>
                            <option value="102"<c:if test="${requestScope.memberDTO.getDep() eq '102'}">selected</c:if>>영업2부</option>
                            <option value="103"<c:if test="${requestScope.memberDTO.getDep() eq '103'}">selected</c:if>>영업3부</option>
                            <option value="104"<c:if test="${requestScope.memberDTO.getDep() eq '104'}">selected</c:if>>영업4부</option>
                            <option value="105"<c:if test="${requestScope.memberDTO.getDep() eq '105'}">selected</c:if>>영업5부</option>
                            <option value="106"<c:if test="${requestScope.memberDTO.getDep() eq '106'}">selected</c:if>>영업지원부</option>
                            <option value="107"<c:if test="${requestScope.memberDTO.getDep() eq '107'}">selected</c:if>>인사부</option>
                        </select>
                    </td>
                </tr>
                <input type="submit" value="전송">
                <%--101,영업1부
                    102,영업2부
                    103,영업3부
                    104,영업4부
                    105,영업5부
                    106,영업지원부
                    107,인사부
                --%>
            </table>

        </form>

        <a href="list.do">목록</a>
        <a href="index.jsp">홈</a>
    </body>
</html>
