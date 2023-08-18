<%@ page import="farmstory1.dao.ArticleDAO" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-08-18
  Time: 오후 2:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("UTF-8");

  String no = request.getParameter("no");
  String cate = request.getParameter("cate");
  String group = request.getParameter("group");

  ArticleDAO dao = new ArticleDAO();

  dao.deleteArticle(no);

  response.sendRedirect("../list.jsp?cate="+cate+"&group="+group);
%>