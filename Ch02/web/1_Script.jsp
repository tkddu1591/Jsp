<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-24
  Time: 오전 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Script Let</title>
        <%--JSP 기본문법

        스크립트릿(Scriptlet)
         - 정적문서(HTML)에 프로그래밍 코드를 기술하기 위한 코드영역
         - 동적문서(JSP) 스크립트릿을 실행해서 정적문서(HTML)로 변환

        표현식(Expression)
         - 변수 값을 출력하는 스크립트
         - 간단한 값, 식 결과를 출력
        --%>
    </head>
    <body>
        <h3>1.스크립트릿</h3>
        <h4>스크립트릿(Scriptlet)</h4>
        <%
            //스크립트릿(Java Programming Section)
            int var1 = 1;
            boolean var2 = true;
            double var3 = 3.14;
            String var4 = "Hello";

            out.println("<p>var1 : "+var1+"</p>");
            out.println("<p>var1 : "+var2+"</p>");


        %>

        <h4>표현식(Expression)</h4>
        <p>var3 : <%=var3%></p>
        <p>var3 : <%=var4%></p>



    </body>
</html>
