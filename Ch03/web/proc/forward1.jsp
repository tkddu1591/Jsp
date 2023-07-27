<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-25
  Time: 오전 11:33
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>forward1</title>
    </head>
    <body>
        <h3>forward1 페이지</h3>
        <%
            pageContext.forward("../1_request.jsp");
        %>

    </body>
</html>
