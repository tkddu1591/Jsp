<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="vo.User2VO" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.sql.DataSource" %><%@ page import="com.google.gson.Gson"%>
<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-28
  Time: 오후 12:21
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8" %>
<%


    List<User2VO> user2s = new ArrayList<>();

    try {
        //JNDI 서비스 객체 생성
        Context initCtx = new InitialContext();
        Context ctx = (Context) initCtx.lookup("java:comp/env"); //JNDI 기본 환경 이름

        //커넥션 풀에서 커넥션 가져오기
        DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
        Connection conn = ds.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * from user6");
        while (rs.next()) {
            User2VO user2VO = new User2VO();
            user2VO.setUid(rs.getString(1));
            user2VO.setName(rs.getString(2));
            user2VO.setHp(rs.getString(3));
            user2VO.setAge(rs.getString(4));

            user2s.add(user2VO);
        }
        stmt.close();
        conn.close();
        rs.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

    Gson gson = new Gson();
    String jsonData = gson.toJson(user2s);

    out.print(jsonData);

%>