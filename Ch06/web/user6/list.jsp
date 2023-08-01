<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="vo.User6VO" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.sql.DataSource" %>
<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-28
  Time: 오후 12:21
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>


<html>
    <head>
        <meta charset="UTF-8">
        <title>User6::list</title>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script>
            //문서로딩이 끝나고 바로 AJAX 요청

            $(function () {
                $.ajax({
                    url: './listProc.jsp',
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        for (let user of data) {
                            console.log(user);
                            let tr = `<tr>
                                    <td>\${user.uid}</td>
                                    <td>\${user.name}</td>
                                    <td>\${user.hp}</td>
                                    <td>\${user.age}</td>
                                    <td>
                                        <a href='./modify.jsp?uid=\${user.uid}'>수정
                                        <a href='./delete.jsp?uid=\${user.uid}'>삭제
                                    </td>
                                    </tr>`;
                            $('table').append(tr);
                        }
                    }
                })
            })
        </script>
    </head>
    <body>
        <h3>User6 목록</h3>

        <a href="register.jsp">추가</a><br>
        <a href="../1_JDBC.jsp">홈</a><br>
        <table border="1">
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>휴대폰</th>
                <th>나이</th>
                <th>관리</th>
            </tr>
            <tr>
            </tr>
        </table>

    </body>
</html>
