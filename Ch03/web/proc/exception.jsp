<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-26
  Time: 오전 10:08
  To change this template use File | Settings | File Templates.

  exception
   - JSP 예외가 발생했을 때 에외를 처리하기 위한 내장객체
   - 간접적으로 exception 객체를 통해 에러코드별 에러 페이지 작성

  주요 응답코드
   - 200 : 요청 성공
   - 3xx : 리다이렉트
   - 404 : 페이지 없음
   - 500 : 서버 내부 에러
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>exception</title>
    </head>
    <body>
        <h3>예외 발생 페이지</h3>
        <%
            int a =5/0;
        %>

    </body>
</html>
