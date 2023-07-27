<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-25
  Time: 오전 11:15
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>requestFile</title>
    </head>
    <body>
        <h3>requestFile</h3>
        <%
            //해당 페이지를 파일 다운로드로 응답
            response.setHeader("Content-Type","application/octet-stream");
        %>

    </body>
</html>
