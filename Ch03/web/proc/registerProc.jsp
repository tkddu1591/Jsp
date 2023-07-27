<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-25
  Time: 오전 10:03
  To change this template use File | Settings | File Templates.
--%>
<%--아이디 패스워드 이름 생년월일 성별 주소 취미--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    String uid = request.getParameter("uid");
    String pass = request.getParameter("pass");
    String name = request.getParameter("name");
    String birth = request.getParameter("birth");
    String gender = request.getParameter("gender");
    String addr = request.getParameter("addr");
    String[] hobbys = request.getParameterValues("hobby");
%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>회원가입</title>
    </head>
    <body>
        <h3>회원가입 데이터</h3>

        <p>

            <%--아이디 패스워드 이름 생년월일 성별 주소 취미--%>
            아이디 : <%= uid%><br>
            패스워드 : <%= pass%><br>
            이름 : <%= name%><br>
            생년월일 : <%= birth%><br>
            성별 : <%= gender.equals("1") ? "남자" : "여자"%><br>
            주소 : <%= addr%><br>
            취미 :<%for (String hobby : hobbys) {%>
            <%= hobby%>
            <%}%>
        </p>
        <a href="../1_request.jsp">뒤로가기</a>

    </body>
</html>
