<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-25
  Time: 오전 9:37
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String uid =request.getParameter("uid");
    String name =request.getParameter("name");
    String age =request.getParameter("age");
%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
    </head>
    <body>
        <h3>사용자 데이터 수신</h3>
        <p>
            아이디 : <%=uid%><br>
            이름 : <%=name%><br>
            나이 : <%=age%><br>
        </p>
        <a href="../1_request.jsp">뒤로가기</a>

    </body>
</html>
