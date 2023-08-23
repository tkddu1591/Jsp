<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-08-23
  Time: 오전 9:19
  To change this template use File | Settings | File Templates.

  Servlet 실습

  Servlet
   - JSP 이전 JAVA 웹 프로그래밍 기술
   - Servlet은 HTML 처리 및 작성이 불편하여 JSP 기술로 대체
   - Servlet은 MVC(모델2) 컨트롤러 컴포넌트로 활용
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>1_Servlet</title>
    </head>
    <body>

        <h3>1.서블릿</h3>

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
