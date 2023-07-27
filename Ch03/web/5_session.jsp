<%@ page import="sub1.UserVo" %><%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-26
  Time: 오전 9:08
  To change this template use File | Settings | File Templates.

  session
   - session은 최초 요청부터 마지막 요청까지의 전체 시간 경과
   - 클라이언트에 대응되는 객체, 서버에 기록되는 클라이언트 고유번호(Session Table)
   - 서버(WAS)는 각 클라이언트에 대한 고유식별번호(SID)를 자동으로 발급
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>session</title>
    </head>
    <body>
        <h3>5.session</h3>

        <h4>session ID 확인</h4>
        <%= session.getId()%>

        <h4>session 설정</h4>
        <%
            UserVo user =new UserVo("a101","김유신","010-1234-1001",23);

            // session table에 user 컬럼명으로 user객체 저장
            session.setAttribute("userColumn",user);

            UserVo userVo =(UserVo)session.getAttribute("userColumn");
        %>
        <p>
            아이디 : <%=userVo.getUid()%><br>
            비밀번호 : <%=userVo.getName()%><br>
            전화번호 : <%=userVo.getHp()%><br>
            나이 : <%=userVo.getAge()%>
        </p>
        <a href="index.jsp">홈</a>
    </body>
</html>
