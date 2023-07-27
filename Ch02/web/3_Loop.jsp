<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-24
  Time: 오전 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <title>3_Loop</title>
        <%--JSP Scriptlet 반복문 실습--%>
    </head>
    <body>
        <h3>3.반복문</h3>

        <h4>for</h4>
        <%
            for (int i = 0; i < 3; i++) {
                out.println("<p>i : " + i + "</p>");
            }
        %>

        <%for (int i = 0; i < 3; i++) {%>
        <p>i : <%=i%>
        </p>
        <%}%>
        <h4>while</h4>
        <%
            int j = 1;
            while (j <= 3) {
        %>
        <p>j : <%=j%>
        </p>
        <%
                j++;
            }
        %>

        <h4>구구단</h4>
        <table border="1">
            <tr>
                <%
                    for (int i = 2; i < 10; i++) {
                %>
                <th><%=i%>단</th>
                <%}%>
            </tr>

            <%
                for (int i = 2; i < 10; i++) {
            %>
            <tr>
                <%for (int k = 2; k < 10; k++) {%>
                <td><%=k%> X <%=i%> = <%=i * k%>
                </td>
                <%}%>
            </tr>
            <%}%>

        </table>

    </body>
</html>
