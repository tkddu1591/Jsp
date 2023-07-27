<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-27
  Time: 오전 9:18
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Title</title>

    </head>
    <body>
        <h3>쿠키생성</h3>
        <%
            //인코딩 설정
            request.setCharacterEncoding("UTF-8");

            //전송 데이터 수신
            String id = request.getParameter("id");
            String pw = request.getParameter("pw");

            //쿠키 생성
            Cookie c1 = new Cookie("cid", id);
            Cookie c2 = new Cookie("cpw", pw);

            //쿠키 전송
            response.addCookie(c1);
            response.addCookie(c2);
        %>

        <a href="cookieConfirm.jsp">쿠키확인</a>

    </body>
</html>
