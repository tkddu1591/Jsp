<%--
  Created by IntelliJ IDEA.
  User: java
  Date: 2023-08-22
  Time: 오전 10:16
  To change this template use File | Settings | File Templates.

  표현언어(Expression Language)
   - MVC 패턴에 따라 JSP를 더욱 효율적으로 처리하기 위한 출력문법
   - JSP 내장객체를 이용해 표현언어로 출력

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>1_EL</title>
    </head>
    <body>

        <h3>표현언어(Expression Language)</h3>
        <%
            int num1 =1;
            int num2 =2;

            String str1 = "hello";
            String str2 = "welcome";

            //표현언어로 출력하기 위해 내장객체영역에 저장
            pageContext.setAttribute("num1",num1);
            request.setAttribute("num2",num2);
            session.setAttribute("str1",str1);
            application.setAttribute("str2",str2);
        %>

        <h4>
            표현식
        </h4>
        <p>
            num1 : <%=num1%>
            num2 : <%=num2%>
            str1 : <%=str1%>
            str2 : <%=str2%>
        </p>

        <h4>표현언어</h4>

        <p>
            num1 : ${num1}
            num2 : ${num2}
            str1 : ${str1}
            str2 : ${str2}
        </p>

    </body>
</html>
