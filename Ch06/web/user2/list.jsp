<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="vo.User2VO" %>
<%@ page import="setting.ConnSetting" %>
<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-28
  Time: 오후 12:21
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%


    List<User2VO> user2s = new ArrayList<>();

    try {
        Connection conn = ConnSetting.conn();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * from user2");
        while (rs.next()){
            User2VO user2VO = new User2VO();
            user2VO.setUid(rs.getString(1));
            user2VO.setName(rs.getString(2));
            user2VO.setHp(rs.getString(3));
            user2VO.setAge(rs.getString(4));

            user2s.add(user2VO);
        }
        stmt.close();
        conn.close();
        rs.close();

    }catch (Exception e){
        e.printStackTrace();
    }

%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User2::list</title>
    </head>
    <body>
        <h3>User2 목록</h3>

        <a href="register.jsp">추가</a><br>
        <a href="../1_JDBC.jsp">홈</a><br>
        <table border="1">
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>휴대폰</th>
                <th>나이</th>
                <th>관리</th>
            </tr>
            <%for(User2VO user2vo : user2s){
            %>
            <tr>
                <td><%=user2vo.getUid()%></td>
                <td><%=user2vo.getName()%></td>
                <td><%=user2vo.getHp()%></td>
                <td><%=user2vo.getAge()%></td>
                <td>
                    <a href="modify.jsp?uid=<%=user2vo.getUid()%>">수정</a>
                    <a href="delete.jsp?uid=<%=user2vo.getUid()%>">삭제</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>

    </body>
</html>
