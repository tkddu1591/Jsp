<%@ page import="kr.co.jboard.dto.UserDTO" %>
<%@ page import="kr.co.jboard.dto.UserDTO" %><%--
Created by IntelliJ IDEA.
User: Java
Date: 2023-08-02
Time: 오전 9:09
To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%
    //스크립트릿 -> 서버
    request.setCharacterEncoding("UTF-8");
    String success = request.getParameter("success");

    UserDTO sessUser = (UserDTO) session.getAttribute("sessUser");
    if (sessUser != null) {
        response.sendRedirect("../list.jsp");
        return;
    }
%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>login</title>
        <link rel="stylesheet" href="../css/style.css">
        <script>
            //javascript -> 브라우저
            window.onload = function () {


                const success = <%=success%>;
                document.querySelector('form').addEventListener('submit', function (e) {

                    const uid = document.getElementsByName('uid')[0].value;
                    const pass = document.getElementsByName('pass')[0].value;

                    if (uid === '') {
                        alert('아이디를 입력해 주세요.')
                        e.preventDefault();
                    } else if (pass === '') {
                        alert('비밀번호를 입력해 주세요.')
                        e.preventDefault();
                    }
                })


                if (100 === success) {
                    alert('아이디 또는 비밀번호가 일치하지 않습니다.')
                    return;
                } else if (101 === success) {
                    alert('정상적이지 않은 접근입니다. 로그인을 해주세요')
                    return;
                }


            }
        </script>
    </head>
    <body>
        <div id="wrapper">
            <header>
                <div>
                    <h3>Board System v1.0</h3>
                </div>
            </header>
            <section id="user" class="login">
                <form action="./loginProc.jsp" method="post">
                    <table border="0">
                        <tr>
                            <td><img src="../images/login_ico_id.png" alt="아이디"/></td>
                            <td><input type="text" name="uid" placeholder="아이디를 입력"/></td>
                        </tr>
                        <tr>
                            <td><img src="../images/login_ico_pw.png" alt="비밀번호"/></td>
                            <td><input type="password" name="pass" placeholder="비밀번호 입력"/></td>
                        </tr>
                    </table>
                    <input type="submit" class="btnLogin" value="로그인"/>
                    <div id="find">
                        <a href="idFind.jsp">아이디 찾기</a> |
                        <a href="#">비밀번호 찾기</a>
                    </div>
                </form>

                <div class="info">
                    회원로그인 안내
                    <p>
                        아직 회원이 아니시면 회원으로 가입하세요.
                    </p>
                    <a href="/Jboard_war_exploded/user/terms.jsp">회원가입</a>
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