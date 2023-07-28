<%@ page import="java.sql.Connection" %>
<%@ page import="setting.ConnSetting" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-28
  Time: 오후 2:57
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String uid = request.getParameter("uid");

    try{
        Connection conn = ConnSetting.conn();
        PreparedStatement psmt = conn.prepareStatement("DELETE from userdb.member where uid=?");
        psmt.setString(1,uid);
        psmt.executeUpdate();

        psmt.close();
        conn.close();
    }catch (Exception e){
        e.printStackTrace();
    }
    response.sendRedirect("list.jsp");
%>