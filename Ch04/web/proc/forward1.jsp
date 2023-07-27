<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-26
  Time: 오전 11:14
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>forward1</title>
    </head>
    <body>
        <h3>forward1 페이지 입니다.</h3>

        <%
            pageContext.forward("./target.jsp");
        %>
    </body>
</html>
