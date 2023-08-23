<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-08-23
  Time: 오전 9:19
  To change this template use File | Settings | File Templates.

  Servlet 실습

  Servlet
   - 웹 애플리케이션 컨테이너를 감시해서 특정 이벤트나 동작이 실행되는 특수 서블릿
   - WAS의 시작/ 종료를 감시하는 ServeltContextListener, 세션처리를 검사하는 SessionListener
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String success=request.getParameter("success");
%>
<html>
    <head>
        <title>3_Listener</title>
    </head>
    <body>

        <h3>3.리스너</h3>
        <%
            if (success.equals("201")) {
        %>
        <form action="hello.do" method="post">
            <input type="text" name="uid">
            <input type="password" name="pass">
            <input type="submit" name="로그인">
        </form>
        <%
        } else {
        %>
        <a href="logout.do">로그아웃</a>
        <%
            }
        %>

    </body>
</html>
