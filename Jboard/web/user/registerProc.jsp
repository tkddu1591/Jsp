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
    UserVO userVO = new UserVO();
    userVO.setUid(request.getParameter("uid"));
    userVO.setPass(request.getParameter("pass1"));
    userVO.setNick( request.getParameter("nick"));
    userVO.setName( request.getParameter("name"));
    userVO.setEmail( request.getParameter("email"));
    userVO.setHp( request.getParameter("hp"));
    userVO.setZip( request.getParameter("zip"));
    userVO.setAddr1( request.getParameter("addr1"));
    userVO.setAddr2( request.getParameter("addr2"));
    userVO.setRegIp(request.getRemoteAddr());

    int result = 0;
    UserDAO.getInstance().insertUser(userVO);




    response.sendRedirect("login.jsp");
    /*
    String jsonData = "{\"result\":"+result+"}";
    out.print(jsonData);*/
%>