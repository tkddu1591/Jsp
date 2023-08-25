<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
    session.invalidate();

    response.sendRedirect("/Farmstory_war_exploded/index.jsp");
%>