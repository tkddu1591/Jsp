<%@ page import="farmstory1.dto.ArticleDTO" %>
<%@ page import="farmstory1.dao.ArticleDAO" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String group   = request.getParameter("group");
    String cate    = request.getParameter("cate");
    String writer  = request.getParameter("writer");
    String title   = request.getParameter("title");
    String content = request.getParameter("content");
    String file    = request.getParameter("file");
    String regip   = request.getRemoteAddr();

    ArticleDTO dto = new ArticleDTO();
    dto.setCate(cate);
    dto.setTitle(title);
    dto.setContent(content);
    dto.setWriter(writer);
    dto.setRegip(regip);

    ArticleDAO dao = new ArticleDAO();
    dao.insertArticle(dto);

    response.sendRedirect("/Farmstory_war_exploded/board/list.jsp?group="+group+"&cate="+cate);
%>