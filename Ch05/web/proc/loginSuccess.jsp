<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-27
  Time: 오전 10:17
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String sessid = (String) session.getAttribute("sessid");
    if(sessid==null){
        response.sendRedirect("../2_Session.jsp");
        return;
    }
%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>loginSuccess</title>
    </head>
    <body>
        <h3>로그인 성공</h3>
        <p>
            <%=sessid%>님 반갑습니다.<br>
            <a href="./logout.jsp">로그아웃</a><br>
            <a href="../index.jsp">홈</a>
        </p>


    </body>
</html>
