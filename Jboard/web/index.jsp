<%@ page import="kr.co.jboard.dto.UserDTO" %><%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-08-02
  Time: 오전 9:09
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%
    UserDTO sessUser = (UserDTO) session.getAttribute("sessUser");
    if(sessUser==null){
        response.sendRedirect("user/login.jsp");
//        pageContext.forward("user/login.jsp");
    }else {
        response.sendRedirect("list.jsp");
//        pageContext.forward("list.jsp");
    }
%>
