<%@ page import="kr.co.jboard.dao.ArticleDAO" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-08-11
  Time: 오전 9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("UTF-8");
  String comment = request.getParameter("comment");
  String no = request.getParameter("no");
  String parent = request.getParameter("parent");

  ArticleDAO.getInstance().updateArticleComment(comment,no);
  response.sendRedirect("../view.jsp?no="+parent);
%>
