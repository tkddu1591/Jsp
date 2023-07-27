<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-26
  Time: 오전 9:45
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>내부 서버 오류</title>
    </head>
    <body>
        <h3>내부 서버 오류 발생. 고객센터로 문의 바랍니다..</h3>

        <p>
            에러 종류 : <%= exception.getClass().getName()%><br>
            에러 내용 : <%= exception.getMessage()%><br>
        </p>
        <a href="../6_exception.jsp">뒤로가기</a>
    </body>
</html>
