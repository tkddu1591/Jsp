<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-25
  Time: 오전 11:25
  To change this template use File | Settings | File Templates.

  pageContext
   - 요청에 대한 최종 대상인 JSP 파일 객체
   - JSP 파일 하나당 하나의 pageContext 객체 생성
   - 주요 기능은 페이지 흐름제어(include, forward) 기능 제공

  forward
   - 서버 자원내에서 페이지 요청기능
   - 최초 요청에 대한 주소 반영 cf(redirect는 최종 요청에 대한 주소 반영)
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>pageContext</title>
    </head>
    <body>
        <h3>pageContext 내장객체</h3>

        <h4>include</h4>
        <%
            pageContext.include("./inc/_header.html");
            pageContext.include("./inc/_footer.html");
        %>

        <h4>forward</h4>
        <a href="proc/forward1.jsp">포워드 페이지1 요청</a><br>
        <a href="proc/forward2.jsp">포워드 페이지2 요청</a>
        <%

        %>

        <a href="index.jsp">홈</a>
    </body>
</html>
