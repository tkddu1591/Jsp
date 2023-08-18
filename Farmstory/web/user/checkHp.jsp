<%@ page import="farmstory1.dao.UserDAO"%><%@ page import="com.google.gson.JsonObject"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터 수신
	request.setCharacterEncoding("UTF-8");
	String hp = request.getParameter("hp");
	
	// DB 조회
	int result = UserDAO.getInstance().selectCountHp(hp);
	
	// Json 생성
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	// Json 출력
	String jsonData = json.toString();
	out.print(jsonData);
%>