<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="setting.ConnSetting" %><%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-28
  Time: 오후 12:14
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    String uid = request.getParameter("uid");
    String name = request.getParameter("name");
    String hp = request.getParameter("hp");
    String pos = request.getParameter("pos");
    String dep = request.getParameter("dname");


    try {
        Connection conn = ConnSetting.conn();
        PreparedStatement psmt = conn.prepareStatement("INSERT INTO `member` values (?,?,?,?,?,NOW())");
        psmt.setString(1,uid);
        psmt.setString(2,name);
        psmt.setString(3,hp);
        psmt.setString(4,pos);
        psmt.setString(5,dep);
        psmt.executeUpdate();
        conn.close();
        psmt.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect("list.jsp");
%>