<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ include file="_header.jsp" %>
<main id="user">
    <section class="login">
        <form action="../list.do">
            <table border="0">
                <tr>
                    <td><img src="/Jboard2_war_exploded/img/login_ico_id.png" alt="아이디"/></td>
                    <td><input type="text" name="uid" placeholder="아이디 입력"/></td>
                </tr>
                <tr>
                    <td><img src="/Jboard2_war_exploded/img/login_ico_pw.png" alt="비밀번호"/></td>
                    <td><input type="password" name="pass" placeholder="비밀번호 입력"/></td>
                </tr>
            </table>
            <input type="submit" value="로그인" class="btnLogin"/>

        </form>
        <div>
            <h3>회원 로그인 안내</h3>
            <p>
                아직 회원이 아니시면 회원으로 가입하세요.
            </p>
            <div style="text-align: right;">
                <a href="/Jboard2_war_exploded/user/findId.do">아이디 |</a>
                <a href="/Jboard2_war_exploded/user/findPass.do">비밀번호찾기 |</a>
                <a href="/Jboard2_war_exploded/user/terms.do">회원가입</a>
            </div>
        </div>
    </section>
</main>

<%@ include file="_footer.jsp" %>