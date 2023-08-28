<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ include file="_header.jsp" %>
<main id="user">
    <section class="find findPassChange">
        <form action="#">
            <table border="0">
                <caption>비밀번호 변경</caption>
                <tr>
                    <td>아이디</td>
                    <td>honggildong</td>
                </tr>
                <tr>
                    <td>새 비밀번호</td>
                    <td>
                        <input type="email" name="pass1" placeholder="새 비밀번호 입력"/>
                    </td>
                </tr>
                <tr>
                    <td>새 비밀번호 확인</td>
                    <td>
                        <input type="email" name="pass1" placeholder="새 비밀번호 입력"/>
                    </td>
                </tr>
            </table>
        </form>

        <p>
            비밀번호를 변경해 주세요.<br>
            영문, 숫자, 특수문자를 사용하여 8자 이상 입력해 주세요.
        </p>

        <div>
            <a href="login.do" class="btn btnCancel">취소</a>
            <a href="login.do" class="btn btnNext">다음</a>
        </div>
    </section>
</main>

<%@ include file="_footer.jsp" %>