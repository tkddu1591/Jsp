<%@ page import="kr.co.jboard.dto.ArticleDTO" %>
<%@ page import="kr.co.jboard.dao.ArticleDAO" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-08-07
  Time: 오후 5:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
/*
아이디 비번 이름 별명 email 휴대폰*/
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    int no = Integer.parseInt(request.getParameter("no"));

    ArticleDTO articleDTO = new ArticleDTO();
    articleDTO.setTitle(title);
    articleDTO.setContent(content);
    articleDTO.setNo(no);

    ArticleDAO.getInstance().updateArticleContent(articleDTO);

    response.sendRedirect("view.jsp?no="+no);
    /*
    String jsonData = "{\"result\":"+result+"}";
    out.print(jsonData);*/
%>