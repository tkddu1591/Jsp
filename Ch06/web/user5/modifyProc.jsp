<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    //인코딩 설정
    request.setCharacterEncoding("UTF-8");

    //전송 데이터 수신
    String uid = request.getParameter("uid");
    String name = request.getParameter("name");
    String hp = request.getParameter("hp");
    String pos = request.getParameter("pos");
    String dep = request.getParameter("dname");

    String host = "jdbc:mysql://127.0.0.1:3306/userdb";
    String user = "root";
    String pass = "1234";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(host, user, pass);/*
        PreparedStatement psmt = conn.prepareStatement("UPDATE `Member` set name=?, hp=?, age=? where uid=?");
        psmt.setString(4, uid);
        psmt.setString(1, name);
        psmt.setString(2, hp);
        psmt.setString(3, age);
        psmt.executeUpdate();*/ //수정필요
        psmt.close();
        conn.close();
    }catch(Exception e){
        e.printStackTrace();
    }

    response.sendRedirect("list.jsp");
%>