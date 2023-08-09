<%@ page import="kr.co.jboard.dto.UserDTO" %>
<%@ page import="kr.co.jboard.dao.UserDAO" %>
<%@ page import="kr.co.jboard.dto.UserDTO" %><%--
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
    UserDTO userDTO = new UserDTO();
    userDTO.setUid(request.getParameter("uid"));
    userDTO.setPass(request.getParameter("pass1"));
    userDTO.setNick( request.getParameter("nick"));
    userDTO.setName( request.getParameter("name"));
    userDTO.setEmail( request.getParameter("email"));
    userDTO.setHp( request.getParameter("hp"));
    userDTO.setZip( request.getParameter("zip"));
    userDTO.setAddr1( request.getParameter("addr1"));
    userDTO.setAddr2( request.getParameter("addr2"));
    userDTO.setRegIp(request.getRemoteAddr());

    int result = 0;
    UserDAO.getInstance().insertUser(userDTO);




    response.sendRedirect("login.jsp");
    /*
    String jsonData = "{\"result\":"+result+"}";
    out.print(jsonData);*/
%>