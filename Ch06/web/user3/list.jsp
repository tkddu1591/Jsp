<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="vo.User3VO" %>
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
    List<User3VO> User3s = new ArrayList<>();

    try {
        Connection conn = ConnSetting.conn();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * from User3");
        while (rs.next()){
            User3VO User3VO = new User3VO();
            User3VO.setUid(rs.getString(1));
            User3VO.setName(rs.getString(2));
            User3VO.setHp(rs.getString(3));
            User3VO.setAge(rs.getString(4));

            User3s.add(User3VO);
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
        <title>User3::list</title>
    </head>
    <body>
        <h3>User3 목록</h3>

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
            <%for(User3VO User3vo : User3s){
            %>
            <tr>
                <td><%=User3vo.getUid()%></td>
                <td><%=User3vo.getName()%></td>
                <td><%=User3vo.getHp()%></td>
                <td><%=User3vo.getAge()%></td>
                <td>
                    <a href="modify.jsp?uid=<%=User3vo.getUid()%>">수정</a>
                    <a id="delete" href="delete.jsp?uid=<%=User3vo.getUid()%>" onclick="work">삭제</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>

    </body>
</html>
