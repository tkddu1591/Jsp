<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-08-23
  Time: 오전 9:19
  To change this template use File | Settings | File Templates.

  Servlet 실습

  Servlet
   - JAVA 웹 애플리케이션에서 부가적인 기능을 지원하기 위해 사용
   - 클라이언트 요청에 해당 자원이 수행되기 전 먼저 수행되는 서블릿
   - 인증, 로깅, 인코딩 처리에 사용
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>2_Filter</title>
    </head>
    <body>

        <h3>2.필터</h3>

        <h3>hello.do</h3>
        <form action="hello.do" method="post">
            <input type="submit" value="POST">
        </form>
        <form action="hello.do" method="GET">
            <input type="submit" value="GET">
        </form>
        
        <h3>welcome.do</h3>
        <form action="welcome.do" method="post">
            <input type="submit" value="POST">
        </form>
        <form action="welcome.do" method="GET">
            <input type="submit" value="GET">
        </form>

        <h3>greeting.do</h3>
        <form action="greeting.do" method="post">
            <input type="submit" value="POST">
        </form>
        <form action="greeting.do" method="GET">
            <input type="submit" value="GET">
        </form>

        
    </body>
</html>
