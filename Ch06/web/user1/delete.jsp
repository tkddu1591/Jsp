<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-28
  Time: 오전 11:32
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    //인코딩 설정
    request.setCharacterEncoding("UTF-8");

    //전송 데이터 수신
    String uid = request.getParameter("uid");

    String host = "jdbc:mysql://127.0.0.1:3306/userdb";
    String user = "root";
    String pass = "1234";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(host, user, pass);
        PreparedStatement psmt = conn.prepareStatement("DELETE from `member` where uid=?");
        psmt.setString(1, uid);
        psmt.executeUpdate();
        psmt.close();
        conn.close();
    }catch(Exception e){
        e.printStackTrace();
    }

    response.sendRedirect("list.jsp");
%>