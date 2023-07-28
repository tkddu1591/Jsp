<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="vo.User5VO" %>
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

    User5VO user5VO = new User5VO();

    try {
        Connection conn = ConnSetting.conn();
        PreparedStatement psmt = conn.prepareStatement("SELECT `uid`, a.name, a.hp, a.pos, b.name from member a join department b on a.dep = b.depNo where uid = ?");
        psmt.setString(1, uid);
        ResultSet rs = psmt.executeQuery();
        rs.next();
        user5VO.setUid(rs.getString(1));
        user5VO.setName(rs.getString(2));
        user5VO.setHp(rs.getString(3));
        user5VO.setPos(rs.getString(4));
        user5VO.setDname(rs.getString(5));
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
        <title>User5::modify</title>
    </head>
    <body>

        <h3>User5 수정</h3>
        <form action="modifyProc.jsp" method="post">
            <table border="1">

                <a href="list.jsp">목록으로</a><br>
                <a href="../1_JDBC.jsp">홈</a>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="uid" value=<%=user5VO.getUid()%>></td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name"value=<%=user5VO.getName()%>></td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td><input type="text" name="hp"value=<%=user5VO.getHp()%>></td>
                </tr>
                <tr>
                    <td>직급</td>
                    <td>
                        <select name="pos">
                            <option value="사원">사원</option>
                            <option value="대리">대리</option>
                            <option value="과장">과장</option>
                            <option value="차장">차장</option>
                            <option value="부장">부장</option>
                            <option value="사장">사장</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>부서</td>
                    <td>
                        <select name="dname">
                            <option value="101">영업1부</option>
                            <option value="102">영업2부</option>
                            <option value="103">영업3부</option>
                            <option value="104">영업4부</option>
                            <option value="105">영업5부</option>
                            <option value="106">영업지원부</option>
                            <option value="107">인사부</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><input type="submit" value="등록"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
