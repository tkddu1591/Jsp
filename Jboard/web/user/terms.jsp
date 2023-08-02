<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="kr.co.Jboard.vo.TermsVO" %><%--
Created by IntelliJ IDEA.
User: Java
Date: 2023-08-02
Time: 오전 9:09
To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%

    TermsVO termsVo = new TermsVO();
    try {
        Context initCtx = new InitialContext();
        Context ctx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) ctx.lookup("jdbc/Jboard");

        Connection conn = ds.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * from jboard.terms");
        if (rs.next()) {
            termsVo.setTerms(rs.getString(1));
            termsVo.setPrivacy(rs.getString(2));
        }

        stmt.close();
        rs.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>약관</title>
        <link rel="stylesheet" href="../css/style.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script>
            $(function () {

                $('div>a:eq(1)').click(function (e) {
                    const chk1 = document.getElementsByName('chk1')[0].checked;
                    const chk2 = document.getElementsByName('chk2')[0].checked;
                    e.preventDefault();
                    if (chk1 === false ) {
                        alert('약관을 확인 후 체크해 주세요')
                        return
                    }else if(chk2 === false){
                        alert('개인정보 취급방침을 확인 후 체크해 주세요')
                        return;
                    }else{
                        location.href='/Jboard_war_exploded/user/register.jsp';
                    }
                })
            })

        </script>
    </head>
    <body>
        <div id="wrapper">
            <header>
                <div>
                    <h3>Board System v1.0</h3>
                </div>
            </header>
            <section id="user" class="terms">
                <table>
                    <caption>사이트 이용약관</caption>
                    <tr>
                        <td>
                            <textarea readonly><%=termsVo.getTerms()%></textarea>
                            <p>
                                <label><input type="checkbox" name="chk1"/>동의합니다.</label>
                            </p>
                        </td>
                    </tr>
                </table>
                <table>
                    <caption>개인정보 취급방침</caption>
                    <tr>
                        <td>
                            <textarea readonly><%=termsVo.getPrivacy()%></textarea>
                            <p>
                                <label><input type="checkbox" name="chk2"/>동의합니다.</label>
                            </p>
                        </td>
                    </tr>
                </table>
                <div>
                    <a href="/Jboard_war_exploded/user/login.jsp">취소</a>
                    <a href="#">다음</a>
                </div>
            </section>

            <footer>
                <div>
                    ⓒCopyleft by chhak.or.kr
                </div>
            </footer>
        </div>


    </body>
</html>