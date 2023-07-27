<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-25
  Time: 오전 9:07
  To change this template use File | Settings | File Templates.

  JSP 지시자 실습

  지시자(Directive)
   - JSP 페이지에 추가적인 정보를 설정하는 스크립트 문법
   - 스크립트릿, 표현식과 함께 JSP 기본구성요소
   - page, include, taglib 지시자 등
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page info="copyright tkddu1591@click" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Directive</title>
    </head>
    <body>
        <h3>지시자</h3>
        <h4>page 지시자</h4>

        <p>
            page copyright : <%= getServletInfo()%>
        </p>

        <h4>include 지시자</h4>
        <%@include file="inc/_header.html"%>
        <%@include file="inc/_footer.html"%>

    </body>
</html>
