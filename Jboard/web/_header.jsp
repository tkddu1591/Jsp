<%@ page import="kr.co.jboard.dto.UserDTO" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-08-07
  Time: 오전 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserDTO userDTO = (UserDTO) session.getAttribute("sessUser");
    if (userDTO == null) {
        response.sendRedirect("user/login.jsp?success=101");
        return;
    }
%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>글수정</title>
        <link rel="stylesheet" href="css/style.css">

    </head>
    <body>
        <div id="wrapper">
            <header>
                <div>
                    <h3><a href="/Jboard_war_exploded">Board System v1.0</a></h3>
                    <p>
                        <%=userDTO.getNick()%> 님 반갑습니다.
                        <a href="user/logout.jsp" class="logout">[로그아웃]</a>
                    </p>
                </div>
            </header>
