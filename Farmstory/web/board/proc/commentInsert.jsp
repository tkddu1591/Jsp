<%@ page import="farmstory1.dto.ArticleDTO" %>
<%@ page import="farmstory1.dao.ArticleDAO" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String group   = request.getParameter("group");
    String cate    = request.getParameter("cate");
    String parent  = request.getParameter("parent");
    String writer  = request.getParameter("writer");
    String content = request.getParameter("content");
    String regip   = request.getRemoteAddr();

    ArticleDTO dto = new ArticleDTO();
    dto.setParent(parent);
    dto.setWriter(writer);
    dto.setContent(content);
    dto.setRegip(regip);

    ArticleDAO dao = new ArticleDAO();
    dao.insertComment(dto);

    response.sendRedirect("/Farmstory_war_exploded/board/view.jsp?group="+group+"&cate="+cate+"&no="+parent);
%>