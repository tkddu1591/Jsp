<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="vo.User4VO" %>
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
    List<User4VO> User4s = new ArrayList<>();

    try {
        Connection conn = ConnSetting.conn();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * from User4");
        while (rs.next()) {
            User4VO User4VO = new User4VO();
            User4VO.setSeq(rs.getString(1));
            User4VO.setName(rs.getString(2));
            User4VO.setGender(rs.getString(3));
            User4VO.setAge(rs.getString(4));
            User4VO.setAddr(rs.getString(5));

            User4s.add(User4VO);
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
        <title>User4::list</title>
    </head>
    <body>
        <h3>User4 목록</h3>

        <a href="register.jsp">추가</a><br>
        <a href="../1_JDBC.jsp">홈</a><br>
        <table border="1">
            <tr>
                <th>이름</th>
                <th>성별</th>
                <th>나이</th>
                <th>주소</th>
                <th>관리</th>
            </tr>
            <%
                for (User4VO User4vo : User4s) {
            %>
            <tr>
                <td><%=User4vo.getName()%>
                </td>
                <td><%
                    if (User4vo.getGender().equals("1")) {
                        out.println("남자");
                    } else
                        out.println("여자");
                %></td>
                <td><%=User4vo.getAge()%>
                </td>
                <td><%=User4vo.getAddr()%>
                </td>
                <td>
                    <a href="modify.jsp?uid=<%=User4vo.getSeq()%>">수정</a>
                    <a id="delete" href="delete.jsp?uid=<%=User4vo.getSeq()%>">삭제</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>

    </body>
</html>
