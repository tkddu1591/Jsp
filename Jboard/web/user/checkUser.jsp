<%@ page import="javax.naming.Context" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="kr.co.jboard.dto.UserDTO" %>
<%@ page import="kr.co.jboard.dao.UserDAO" %>
<%@ page import="com.google.gson.JsonObject" %><%--
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
    UserDTO userDTO = new UserDTO();
    String uid = request.getParameter("uid");
    String nick = request.getParameter("nick");
    String hp = request.getParameter("hp");
    String email = request.getParameter("email");

    JsonObject json = new JsonObject();
    if (uid != null) {
        int uidResult = UserDAO.getInstance().selectCountUid(uid);
        json.addProperty("uidResult", uidResult);
        out.print(json);
    } else if (nick != null) {
        int nickResult = UserDAO.getInstance().selectCountUid(nick);
        json.addProperty("hpResult", nickResult);
        out.print(json);
    } else if (hp != null) {
        int hpResult = UserDAO.getInstance().selectCountUid(hp);
        json.addProperty("nickResult", hpResult);
        out.print(json);
    } else if (email != null) {
        int emailResult = UserDAO.getInstance().selectCountEmail(email);
        json.addProperty("emailResult", emailResult);
        out.print(json);
    }


/*
    response.sendRedirect("login.jsp");*/
    /*
    String jsonData = "{\"result\":"+result+"}";
    out.print(jsonData);*/
%>