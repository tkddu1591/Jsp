<%@ page import="kr.co.jboard.dao.ArticleDAO" %>
<%@ page import="kr.co.jboard.dto.ArticleDTO" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-08-09
  Time: 오전 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    String no = request.getParameter("no");
    String parent = request.getParameter("parent");


    ArticleDAO.getInstance().deleteArticle(Integer.parseInt(no));
    ArticleDAO.getInstance().updateArticleCommentMinus(Integer.parseInt(no));

    response.sendRedirect("../view.jsp?no="+parent);
%>
