<%--
Created by IntelliJ IDEA.
User: Java
Date: 2023-08-02
Time: 오전 9:09
To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>login</title>
        <link rel="stylesheet" href="../css/style.css">
    </head>
    <body>
        <div id="wrapper">
            <header>
                <div>
                    <h3>Board System v1.0</h3>
                </div>
            </header>
            <section id="user" class="login">
                <form action="../list.jsp">
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
</html>