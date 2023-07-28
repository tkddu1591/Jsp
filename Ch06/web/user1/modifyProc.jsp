<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-28
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    //인코딩 설정
    request.setCharacterEncoding("UTF-8");

    //전송 데이터 수신
    String uid = request.getParameter("uid");
    String name = request.getParameter("name");
    String hp = request.getParameter("hp");
    String age = request.getParameter("age");

    String host = "jdbc:mysql://127.0.0.1:3306/userdb";
    String user = "root";
    String pass = "1234";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(host, user, pass);
        PreparedStatement psmt = conn.prepareStatement("UPDATE `user1` set name=?, hp=?, age=? where uid=?");
        psmt.setString(4, uid);
        psmt.setString(1, name);
        psmt.setString(2, hp);
        psmt.setString(3, age);
        psmt.executeUpdate();
        psmt.close();
        conn.close();
    }catch(Exception e){
        e.printStackTrace();
    }

    response.sendRedirect("list.jsp");
%>