<%@ page import="javax.naming.Context" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.nio.charset.CharsetEncoder" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.google.gson.JsonObject" %><%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-08-02
  Time: 오후 12:19
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String uid = request.getParameter("uid");
    int result=0;

    try {
        //JNDI 서비스 객체 생성
        Context initCtx = new InitialContext();
        Context ctx = (Context) initCtx.lookup("java:comp/env"); //JNDI 기본 환경 이름

        //커넥션 풀에서 커넥션 가져오기
        DataSource ds = (DataSource) ctx.lookup("jdbc/Jboard");
        Connection conn = ds.getConnection();

        PreparedStatement psmt = conn.prepareStatement("select exists(select * from jboard.user where uid=?)");
        psmt.setString(1, uid);
        ResultSet rs  = psmt.executeQuery();

        if(rs.next()) {
            result = rs.getInt(1);
        }

        conn.close();
        psmt.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    JsonObject json = new JsonObject();
    json.addProperty("result",result);

    String jsonData= json.toString();
    out.print(jsonData);
%>