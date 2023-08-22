<%--
  Created by IntelliJ IDEA.
  User: java
  Date: 2023-08-22
  Time: 오전 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>3_표현언어 연산자</title>
    </head>
    <body>
        <h3>3_표현언어 연산자</h3>

        <%
            int num1  =1;
            int num2  =2;

            String str1 = null;
            String str2 = "";
            String str3 = "hello";

            request.setAttribute("num1",num1);
            request.setAttribute("num2",num2);
            request.setAttribute("str1",str1);
            request.setAttribute("str2",str2);
            request.setAttribute("str3",str3);
        %>

        <p>
            num1 + num2 = ${num1+num2}<br>
            num1 - num2 = ${num1-num2}<br>
            num1 * num2 = ${num1*num2}<br>
            num1 / num2 = ${num1/num2}<br>
            num1 % num2 = ${num1%num2}<br>
            <br>
            num1 > num2 = ${num1>num2}<br>
            num1 < num2 = ${num1<num2}<br>
            num1 >= num2 = ${num1>=num2}<br>
            num1 <= num2 = ${num1<=num2}<br>
            num1 == num2 = ${num1==num2}<br>
            num1 != num2 = ${num1!=num2}<br>
            <br>
            num1 gt num2 = ${num1 gt num2}<br>
            num1 lt num2 = ${num1 lt num2}<br>
            num1 ge num2 = ${num1 ge num2}<br>
            num1 le num2 = ${num1 le num2}<br>
            num1 eq num2 = ${num1 eq num2}<br>
            <br>
            empty str1 = ${empty str1}<br>
            empty str1 = ${empty str2}<br>
            empty str1 = ${empty str3}<br>
            <br>
            str3 eq "hello" = ${str3 eq "hello"}<br>
            str3 eq "" = ${str3 eq ""}<br>

        </p>



    </body>
</html>
