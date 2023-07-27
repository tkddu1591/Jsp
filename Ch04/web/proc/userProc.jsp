<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-26
  Time: 오전 11:42
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    //데이터 수신

%>
<jsp:useBean id="ub"  class="sub1/UserBean">
    <jsp:setProperty name="user" property="ub"></jsp:setProperty>
    <jsp:setProperty name="name" property="ub"></jsp:setProperty>
    <jsp:setProperty name="hp" property="ub"></jsp:setProperty>
    <jsp:setProperty name="age" property="ub"></jsp:setProperty>
</jsp:useBean>
<html>
    <head>
        <meta charset="UTF-8">
        <title>userProc</title>
    </head>
    <body>
        <h3>전송 데이터 출력</h3>
        <p>
        </p>


    </body>
</html>
