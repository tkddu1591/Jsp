<%@ page import="java.sql.PreparedStatement"%><%@ page import="java.sql.ResultSet"%><%@ page import="setting.ConnSetting"%><%@ page import="vo.User6VO"%><%@ page import="java.sql.Connection"%><%@ page import="com.google.gson.Gson"%><%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-08-01
  Time: 오후 4:26
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8" %>
<% 
request.setCharacterEncoding("UTF-8");
    String uid = request.getParameter("uid");

    User6VO user6VO = new User6VO();

    try {
        Connection conn = ConnSetting.conn();
        PreparedStatement psmt = conn.prepareStatement("SELECT * from user6 where uid = ?");
        psmt.setString(1, uid);
        ResultSet rs = psmt.executeQuery();
        rs.next();
        user6VO.setUid(rs.getString(1));
        user6VO.setName(rs.getString(2));
        user6VO.setHp(rs.getString(3));
        user6VO.setAge(rs.getString(4));
        psmt.close();
        rs.close();
        conn.close();
    } catch (Exception e) {

        e.printStackTrace();
    }

    Gson gson = new Gson();
    String jsonData =gson.toJson(user6VO);

    out.print(jsonData);

%>