<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-24
  Time: 오전 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>2_Condition</title>
        <%--JSP 스크립트릿 조건문 실습--%>
    </head>
    <body>
        <h3>2_Condition</h3>

        <h4>if</h4>
        <%
            int num1 = 1;
            int num2 = 2;
            int num3 = 3;
            int num4 = 4;

            if (num1 > 0)
                out.println("<p>num1은 0보다 크다.</p>");
        %>

        <h4>if ~ else</h4>
        <%
            int var1 = 1;
            int var2 = 2;

            if (var1 > var2) {
        %>
        <p>var1이 var2 보다 크다</p>
        <%
            } else {
        %>
        <p>var1이 var2보다 작다</p>
        <%
            }
        %>
        <h4>if ~ else if ~ else</h4>

        <%
            int n1= 1;
            int n2= 2;
            int n3= 3;
            int n4= 4;
        %>
        <%if(n1 > n2){%>
        <p>n1이 n2보다 크다.</p>
        <%}else if(n2 >n3){%>
        <p>n2이 n3보다 크다.</p>
        <%}else if(n3 >n4){%>
        <p>n3이 n4보다 크다.</p>
        <%}else%>
        <p>n4가 가장 크다.</p>


    </body>
</html>
