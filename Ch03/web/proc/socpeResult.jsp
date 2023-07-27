<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-26
  Time: 오전 10:29
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>scopeResult</title>
    </head>
    <body>
        <h4>내장객체 값 확인</h4>

        <p>
            pageContext <%=pageContext.getAttribute("name")%><br>
            request <%=request.getAttribute("name")%><br>
            session <%=session.getAttribute("name")%><br>
            application <%=application.getAttribute("name")%><br>
        </p>

        <a href="/proc/socpeResult.jsp">결과확인</a>
        <a href="../index.jsp">홈</a>
    </body>
</html>
