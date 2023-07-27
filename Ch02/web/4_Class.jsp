<%@ page import="sub1.Account" %><%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-24
  Time: 오전 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page info="copyright tkddu1591.click" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>4_Class</title>
    </head>
    <body>
        <h3>4.클래스</h3>

        <%
            Account kb = new Account("국민은행", "101-12-1001","김유신",10000);
            kb.without(1000);
            kb.deposit(10000);
            kb.show(out);
        %>

    </body>
</html>
