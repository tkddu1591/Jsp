<%@ page import="static java.rmi.server.LogStream.log" %>
<%@ page import="java.io.IOError" %><%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-25
  Time: 오전 11:48
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>application</title>
    </head>
    <body>
        <h3>4.application 내장객체</h3>

        <h4>서버 정보</h4>
        <%= application.getServerInfo()%>
        <h4>파라미터 정보</h4>
        <%
            String value1 = application.getInitParameter("PARAM1");
            String value2 = application.getInitParameter("PARAM2");
        %>
        <p>
            value1 : <%= value1%><br>
            value2 : <%= value2%><br>
        </p>



        <h4>로그 정보</h4>
        <%
            application.log("로그기록");
        %>


        <h4>자원 경로</h4>
        <%= application.getRealPath("./4_application.jsp")%>

        <a href="index.jsp">홈</a>
    </body>
</html>
