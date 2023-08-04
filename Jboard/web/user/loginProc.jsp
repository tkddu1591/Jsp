<%@ page import="javax.naming.Context" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="kr.co.jboard.vo.UserVO" %>
<%@ page import="kr.co.jboard.dao.UserDAO" %><%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-08-02
  Time: 오전 11:19
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
/*
아이디 비번 이름 별명 email 휴대폰*/
    String uid = request.getParameter("uid");
    String pass = request.getParameter("pass");

    UserVO userVO = null;


    userVO = UserDAO.getInstance().selectUser(uid, pass);

    if (userVO != null) {
        session.setAttribute("sessUser", userVO);
        response.sendRedirect("../list.jsp");
    } else {

        response.sendRedirect("login.jsp?success=100");
    }

    /*
    String jsonData = "{\"result\":"+result+"}";
    out.print(jsonData);*/
%>