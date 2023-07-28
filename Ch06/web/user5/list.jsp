<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="vo.User5VO" %>
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


    List<User5VO> user5s = new ArrayList<>();

    try {
        Connection conn = ConnSetting.conn();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * from `member` as a join department u on a.dep=u.depNo");
        while (rs.next()) {
            User5VO user5VO = new User5VO();
            user5VO.setUid(rs.getString(1));
            user5VO.setName(rs.getString(2));
            user5VO.setHp(rs.getString(3));
            user5VO.setPos(rs.getString(4));
            user5VO.setDname(rs.getString(8));
            user5s.add(user5VO);
        }
        stmt.close();
        conn.close();
        rs.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User5::list</title>
    </head>
    <body>
        <h3>User5 목록</h3>

        <a href="register.jsp">추가</a><br>
        <a href="../1_JDBC.jsp">홈</a><br>
        <table border="1">
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>휴대폰</th>
                <th>직급</th>
                <th>부서</th>
                <th>관리</th>
            </tr>
            <%
                for (User5VO user5vo : user5s) {
            %>
            <tr>
                <td>
                    <%=user5vo.getUid()%>
                </td>
                <td>
                    <%=user5vo.getName()%>
                </td>
                <td>
                    <%=user5vo.getHp()%>
                </td>
                <td>
                    <%=user5vo.getPos()%>
                </td>
                <td>
                    <%=user5vo.getDname()%>
                </td>
                <td>
                    <a href="modify.jsp?uid=<%=user5vo.getUid()%>">수정</a>
                    <a href="delete.jsp?uid=<%=user5vo.getUid()%>">삭제</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>

    </body>
</html>
