<%@ page import="kr.co.jboard.vo.UserVO" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-08-07
  Time: 오전 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserVO userVO= (UserVO) session.getAttribute("sessUser");
    if(userVO==null){
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
                    <h3>Board System v1.0</h3>
                    <p>
                        <%=userVO.getNick()%> 님 반갑습니다.
                        <a href="user/logout.jsp" class="logout">[로그아웃]</a>
                    </p>
                </div>
            </header>
