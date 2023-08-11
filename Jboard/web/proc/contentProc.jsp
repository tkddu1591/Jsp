<%@ page import="kr.co.jboard.dto.ArticleDTO" %>
<%@ page import="kr.co.jboard.dao.ArticleDAO" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-08-09
  Time: 오전 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String content = request.getParameter("content");
    String parent = request.getParameter("parent");
    String writer = request.getParameter("writer");

    ArticleDTO dto = new ArticleDTO();
    dto.setParent(parent);
    dto.setWriter(writer);
    dto.setRegIp(request.getRemoteAddr());
    dto.setContent(content);

    ArticleDAO.getInstance().insertComment(dto);
    ArticleDAO.getInstance().updateArticleCommentPlus(Integer.parseInt(parent));

    response.sendRedirect("../view.jsp?no="+parent);
%>