<%@ page import="farmstory1.dto.ArticleDTO" %>
<%@ page import="farmstory1.dao.ArticleDAO" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String group   = request.getParameter("group");
    String cate    = request.getParameter("cate");
    String title   = request.getParameter("title");
    String content = request.getParameter("content");
    String no    = request.getParameter("no");

    ArticleDTO dto = new ArticleDTO();
    dto.setCate(cate);
    dto.setTitle(title);
    dto.setContent(content);
    dto.setNo(no);

    ArticleDAO dao = new ArticleDAO();
    dao.updateArticle(dto);

    response.sendRedirect("/Farmstory_war_exploded/board/view.jsp?group="+group+"&cate="+cate+"&no="+no);
%>