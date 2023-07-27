<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-27
  Time: 오전 10:07
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    //인코딩 설정
    request.setCharacterEncoding("UTF-8");

    //전송 데이터 수신
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String auto = request.getParameter("auto");
    //회원여부 확인
    if(pw.equals("1234")){
        //자동 로그인 처리(자동로그인 체크했으면
        if(auto!=null){
            Cookie autoCookie = new Cookie("cid",id);
            autoCookie.setMaxAge(60*3);
            response.addCookie(autoCookie);
        }
        //회원일 경우 -> 세션 기록
        session.setAttribute("sessid",id);
        response.sendRedirect("./loginSuccess.jsp");

    }else{
        response.sendRedirect("loginForm.jsp");
        //아닐 경우
    }
%>
