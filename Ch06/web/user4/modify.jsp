<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="vo.User4VO" %>
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

    User4VO User4VO = new User4VO();

    try {
        Connection conn = ConnSetting.conn();
        PreparedStatement psmt = conn.prepareStatement("SELECT * from User4 where seq = ?");
        psmt.setString(1, uid);
        ResultSet rs = psmt.executeQuery();
        rs.next();
        User4VO.setSeq(rs.getString(1));
        User4VO.setName(rs.getString(2));
        User4VO.setGender(rs.getString(3));
        User4VO.setAge(rs.getString(4));
        User4VO.setAddr(rs.getString(5));
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
        <title>User4::modify</title>
    </head>
    <body>

        <h3>User4 수정</h3>
        <form action="modifyProc.jsp" method="post">
            <table border="1">
                <a href="list.jsp">목록으로</a><br>
                <a href="../1_JDBC.jsp">홈</a>
                <tr>
                    <td>이름</td>
                    <td><input type="text" name="name" readonly value=<%=User4VO.getName()%>></td>
                </tr>
                <tr>
                    <td>성별</td>
                    <td>
                        <%
                           if(User4VO.getGender().equals("1")){
                        %>
                        <input type="radio" name="gender" value="1" checked>남자
                        <input type="radio" name="gender" value="2">여자
                        <%
                            }else{
                        %>

                        <input type="radio" name="gender" value="1">남자
                        <input type="radio" name="gender" value="2" checked>여자
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td>나이</td>
                    <td><input type="text" name="age" value=<%=User4VO.getAge()%>></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td><input type="text" name="addr" value=<%=User4VO.getAddr()%>></td>
                </tr>
                <tr>
                    <td colspan="2" align="right"><input type="submit" value="수정"></td>
                </tr>
            </table>
            <input type="hidden" name="seq" value=<%=User4VO.getSeq()%>>
        </form>
    </body>
</html>
