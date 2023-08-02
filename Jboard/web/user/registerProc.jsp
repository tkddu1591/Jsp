<%@ page import="javax.naming.Context" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-08-02
  Time: 오전 11:19
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
/*
아이디 비번 이름 별명 email 휴대폰*/
    String uid = request.getParameter("uid");
    String pass = request.getParameter("pass1");
    String nick = request.getParameter("nick");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String hp = request.getParameter("hp");
    String zip = request.getParameter("zip");
    String addr1 = request.getParameter("addr1");
    String addr2 = request.getParameter("addr2");

    int result = 0;

    try {
        //JNDI 서비스 객체 생성
        Context initCtx = new InitialContext();
        Context ctx = (Context) initCtx.lookup("java:comp/env"); //JNDI 기본 환경 이름

        //커넥션 풀에서 커넥션 가져오기
        DataSource ds = (DataSource) ctx.lookup("jdbc/Jboard");
        Connection conn = ds.getConnection();

        PreparedStatement psmt = conn.prepareStatement("INSERT INTO `user`(uid,pass,name,nick,email,hp,zip,addr1,addr2,regIp,regDate) values (?,?,?,?,?,?,?,?,?,?,NOW())");
        psmt.setString(1, uid);
        psmt.setString(2, pass);
        psmt.setString(3, name);
        psmt.setString(4, nick);
        psmt.setString(5, email);
        psmt.setString(6, hp);
        psmt.setString(7, zip);
        psmt.setString(8, addr1);
        psmt.setString(9, addr2);
        psmt.setString(10, request.getRemoteAddr());

        result = psmt.executeUpdate();
        conn.close();
        psmt.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    response.sendRedirect("login.jsp");
    /*
    String jsonData = "{\"result\":"+result+"}";
    out.print(jsonData);*/
%>