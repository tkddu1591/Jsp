<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %><%--
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
    String age = request.getParameter("age");


    try {
        //JNDI 서비스 객체 생성
        Context initCtx = new InitialContext();
        Context ctx = (Context) initCtx.lookup("java:comp/env"); //JNDI 기본 환경 이름

        //커넥션 풀에서 커넥션 가져오기
        DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
        Connection conn = ds.getConnection();

        PreparedStatement psmt = conn.prepareStatement("INSERT INTO `user2` values (?,?,?,?)");
        psmt.setString(1, uid);
        psmt.setString(2, name);
        psmt.setString(3, hp);
        psmt.setString(4, age);
        psmt.executeUpdate();
        conn.close();
        psmt.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect("list.jsp");
%>