<%--
  Created by IntelliJ IDEA.
  User: java
  Date: 2023-08-22
  Time: 오전 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>2_표현언어 내장객체</title>
    </head>
    <body>
        <h3>2_표현언어 내장객체</h3>
        <%
            pageContext.setAttribute("name","김유신");
            request.setAttribute("name","김춘추");
            session.setAttribute("name","장보고");
            application.setAttribute("name","강감찬");
        %>

        <P>
            pageScope name : ${name} <br>
            requestScope name : ${requestScope.name} <br>
            sessionScope name : ${sessionScope.name} <br>
            applicationScope name : ${applicationScope.name} <br>
        </P>



    </body>
</html>
