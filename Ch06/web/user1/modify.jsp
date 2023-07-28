<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="vo.User1VO" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-28
  Time: 오전 9:16
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String uid = request.getParameter("uid");

    String host = "jdbc:mysql://127.0.0.1:3306/userdb";
    String user = "root";
    String pass = "1234";
    User1VO user1VO = new User1VO();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(host, user, pass);
        PreparedStatement psmt = conn.prepareStatement("SELECT * from user1 where uid = ?");
        psmt.setString(1, uid);
        ResultSet rs = psmt.executeQuery();
        rs.next();
        user1VO.setUid(rs.getString(1));
        user1VO.setName(rs.getString(2));
        user1VO.setHp(rs.getString(3));
        user1VO.setAge(rs.getString(4));
        psmt.close();
        rs.close();
        conn.close();
    } catch (Exception e) {

        e.printStackTrace();
    }

%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>user1::modify</title>
    </head>
    <body>
        <h3>user1 수정</h3>

        <form action="modifyProc.jsp" method="post">
            <table border="1">

                <a href="list.jsp">목록으로</a><br>
                <a href="../1_JDBC.jsp">홈</a>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="uid" readonly value=<%=user1VO.getUid()%>></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name" value=<%=user1VO.getName()%>></td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td><input type="text" name="hp" value=<%=user1VO.getHp()%>></td>
                </tr>
                <tr>
                    <td>나이</td>
                    <td><input type="number" name="age" value=<%=user1VO.getAge()%>></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><input type="submit" value="수정"></td>
                </tr>
            </table>
        </form>

    </body>
</html>