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

    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String age = request.getParameter("age");
    String addr = request.getParameter("addr");


    try {
        Connection conn = ConnSetting.conn();
        PreparedStatement psmt = conn.prepareStatement("INSERT INTO `User4`(name,gender,age,addr) values (?,?,?,?)");
        psmt.setString(1, name);
        psmt.setString(2, gender);
        psmt.setString(3, age);
        psmt.setString(4, addr);
        psmt.executeUpdate();
        conn.close();
        psmt.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect("list.jsp");
%>