<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="vo.User3VO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="setting.ConnSetting" %><%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-28
  Time: 오후 3:01
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String uid = request.getParameter("uid");

    User3VO User3VO = new User3VO();

    try {
        Connection conn = ConnSetting.conn();
        PreparedStatement psmt = conn.prepareStatement("SELECT * from User3 where uid = ?");
        psmt.setString(1, uid);
        ResultSet rs = psmt.executeQuery();
        rs.next();
        User3VO.setUid(rs.getString(1));
        User3VO.setName(rs.getString(2));
        User3VO.setHp(rs.getString(3));
        User3VO.setAge(rs.getString(4));
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
        <title>User3::modify</title>
    </head>
    <body>

        <h3>User3 수정</h3>
        <form action="modifyProc.jsp" method="post">
            <table border="1">

                <a href="list.jsp">목록으로</a><br>
                <a href="../1_JDBC.jsp">홈</a>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="uid" readonly value=<%=User3VO.getUid()%>></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name" value=<%=User3VO.getName()%>></td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td><input type="text" name="hp" value=<%=User3VO.getHp()%>></td>
                </tr>
                <tr>
                    <td>나이</td>
                    <td><input type="number" name="age" value=<%=User3VO.getAge()%>></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><input type="submit" value="수정"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
