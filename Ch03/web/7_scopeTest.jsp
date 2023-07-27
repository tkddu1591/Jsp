<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-26
  Time: 오전 10:20
  To change this template use File | Settings | File Templates.


--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>7.scopeTest</title>
    </head>
    <body>
        <h3>7.내장객체 영역</h3>
        <%
            //내장객체 값 설정
            pageContext.setAttribute("name","김유신");
            request.setAttribute("name","김춘추");
            session.setAttribute("name","장보고");
            application.setAttribute("name","강감찬");
        %>

        <h4>내장객체 값 확인</h4>
        <p>
            pageContext <%=pageContext.getAttribute("name")%><br>
            request <%=request.getAttribute("name")%><br>
            session <%=session.getAttribute("name")%><br>
            application <%=application.getAttribute("name")%><br>
        </p>
        <%pageContext.forward("./proc/socpeResult.jsp");%>

        <a href="index.jsp">홈</a>
    </body>
</html>
