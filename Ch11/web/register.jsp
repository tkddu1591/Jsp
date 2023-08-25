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
        <form action="/Ch11_war_exploded/register.do" method="post">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="uid"></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>HP</td>
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
                    <td>직급</td>
                    <td>
                        <select name="dep">
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
