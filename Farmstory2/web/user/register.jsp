<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../_header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/Farmstory2_war_exploded/js/zipCode.js"></script>
<script src="/Farmstory2_war_exploded/js/validation.js"></script>
<script src="/Farmstory2_war_exploded/js/checkUser.js"></script>
<style>

</style>
<%--uid
pass1
name
nick
email
hp
zip
addr1
addr2--%>
<script>

</script>
<div id="user">
    <section class="register">
        <form id="formUser" action="/Farmstory2_war_exploded/user/register.do" method="post">
            <table border="1">
                <caption>사이트 이용정보 입력</caption>
                <tr>
                    <td>아이디</td>
                    <td>
                        <input type="text" name="uid" placeholder="아이디 입력"/>
                        <button type="button" id="btnCheckUid"><img src="../images/chk_id.gif" alt=""></button>
                        <span class="resultId"></span>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td>
                        <input type="password" name="pass1" placeholder="비밀번호 입력"/>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td>
                        <input type="password" name="pass2" placeholder="비밀번호 확인 입력"/>
                        <span class="resultPass"></span>
                    </td>
                </tr>
            </table>
            <table border="1">
                <caption>개인정보 입력</caption>
                <tr>
                    <td>이름</td>
                    <td>
                        <input type="text" name="name" placeholder="이름 입력"/>
                        <span class="resultName"></span>
                    </td>
                </tr>
                <tr>
                    <td>별명</td>
                    <td>
                        <p>공백없이 한글, 영문, 숫자만 입력가능</p>
                        <input type="text" name="nick" placeholder="별명 입력"/>
                        <span class="resultNick"></span>
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        <input type="email" name="email" placeholder="이메일 입력"/>
                        <button type="button" id="btnEmailCode"><img src="../images/chk_auth.gif" alt="인증번호 받기"/></button>

                        <span class="resultEmail"></span>
                        <div class="auth">
                            <input type="text" name="auth" placeholder="인증번호 입력"/>
                            <button type="button" id="btnEmailAuth"><img src="../images/chk_confirm.gif" alt="확인"/>
                            </button>

                            <span class="resultAuth"></span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td>
                        <script>
                            const hypenTel = (target) => {
                                target.value = target.value
                                    .replace(/[^0-9]/g, '')
                                    .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
                            }

                        </script>
                        <input type="tel" oninput="hypenTel(this)" name="hp" placeholder="휴대폰 번호 입력"
                               minlength="13" maxlength="13"/>
                        <span class="resultHp"></span>
                    </td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>
                        <div>
                            <input type="text" name="zip" placeholder="우편번호" readonly/>
                            <button type="button" class="btnZip" onclick="zipcode()"><img src="../images/chk_post.gif"
                                                                                          alt=""></button>
                        </div>
                        <div>
                            <input type="text" name="addr1" placeholder="주소를 검색하세요." readonly/>
                        </div>
                        <div>
                            <input type="text" name="addr2" placeholder="상세주소를 입력하세요."/>
                        </div>
                    </td>
                </tr>
            </table>

            <div>
                <a href="/Farmstory2_war_exploded/user/login.do" class="btnCancel">취소</a>
                <input type="submit" class="btnSubmit" value="회원가입"/>
            </div>
        </form>
    </section>
</div>
<%@ include file="../_footer.jsp" %>