<%@ page import="kr.co.jboard.dto.UserDTO" %>
<%@ page import="kr.co.jboard.dao.UserDAO" %>
<%@ page import="kr.co.jboard.dto.ArticleDTO" %>
<%@ page import="kr.co.jboard.dao.ArticleDAO" %>
<%@ page import="kr.co.jboard.dto.ArticleDTO" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-08-07
  Time: 오전 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
/*
아이디 비번 이름 별명 email 휴대폰*/
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String file = request.getParameter("file");
    String writer = request.getParameter("writer");

    ArticleDTO articleDTO = new ArticleDTO();
    articleDTO.setTitle(title);
    articleDTO.setContent(content);
    articleDTO.setWriter(writer);
    articleDTO.setRegIp(request.getRemoteAddr());

    ArticleDAO.getInstance().insertAriticle(articleDTO);

    response.sendRedirect("list.jsp");
    /*
    String jsonData = "{\"result\":"+result+"}";
    out.print(jsonData);*/
%>