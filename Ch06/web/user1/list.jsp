<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.User1VO" %><%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-28
  Time: 오전 9:41
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String host = "jdbc:mysql://127.0.0.1:3306/userdb";
    String user = "root";
    String pass = "1234";

    List<User1VO> user1s = new ArrayList<>();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(host, user, pass);
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * from user2");
        while (rs.next()) {
            User1VO user1 = new User1VO();
            user1.setUid(rs.getString(1));
            user1.setName(rs.getString(2));
            user1.setHp(rs.getString(3));
            user1.setAge(rs.getString(4));
            user1s.add(user1);
        }
        rs.close();
        conn.close();
        stmt.close();


    } catch (Exception e) {
        throw new RuntimeException(e);
    }
%>

<html>
    <head>
        <meta charset="UTF-8">
        <title>user1::list</title>

    </head>
    <body>
        <h3>User1 목록</h3>

        <a href="register.jsp">추가</a><br>
        <a href="../1_JDBC.jsp">홈</a><br>
        <table border="1">
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>hp</th>
                <th>나이</th>
                <th>관리</th>
            </tr>
            <%
                for (User1VO user1 : user1s) {
            %>
            <tr>
                <td><%=user1.getUid()%>
                </td>
                <td><%=user1.getName()%>
                </td>
                <td><%=user1.getHp()%>
                </td>
                <td><%=user1.getAge()%>
                </td>
                <td>
                    <a href="modify.jsp?uid=<%=user1.getUid()%>">수정</a> |
                    <a href="delete.jsp?uid=<%=user1.getUid()%>">삭제</a>
                </td>
            </tr>
            <% }
            %>
        </table>
    </body>
</html>
