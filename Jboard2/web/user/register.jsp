<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%--uid
pass1
pass2
name
nick
email
auth
hp
zip
addr1
addr2
--%>
<%@ include file="_header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/zipCode.js"></script>
<script type="text/javascript" src="../js/validation.js"></script>
<script>
    window.onload = function () {

        const inputUid = document.getElementsByName('uid')[0];
        const btnCheckUid = document.getElementById("btnCheckUid");

        btnCheckUid.onclick = function () {

            if (inputUid.value.match(reUid)) {
                const uidResult = document.getElementsByClassName("uidResult")[0]
                const uid = inputUid.value;
                const xhr = new XMLHttpRequest();
                xhr.open("GET", "/Jboard2_war_exploded/user/checkUid.do?uid=" + uid);
                xhr.send();

                xhr.onreadystatechange = function () {
                    if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
                        const result = JSON.parse(xhr.responseText);
                        if (result.result >= 1) {
                            uidResult.innerText = '이미 사용중인 아이디입니다.'
                            uidResult.style.color = 'red';
                            isUidOk = false;
                        } else {
                            uidResult.innerText = '사용 가능한 아이디입니다.'
                            uidResult.style.color = 'green';
                            isUidOk = true;
                        }
                    }

                }
            } else {
                $('.uidResult').css('color', 'red').text('유효하지 않은 아이디 입니다.');
                isPassOk = false;
            }


        }

        $('#btnCheckNick').click(function () {
            const nick = $('input[name="nick"]').val();
            const nickResult = document.getElementsByClassName("nickResult")[0]

            if (nick.match(reNick)) {
                $.ajax({
                    url: "/Jboard2_war_exploded/user/checkNick.do?nick=" + nick,
                    type: "GET",
                    dataType: "json",
                    success: function (result) {
                        if (result.result >= 1) {
                            nickResult.innerText = '이미 사용중인 닉네임입니다.'
                            nickResult.style.color = 'red';
                            isNickOk = false;
                        } else {
                            nickResult.innerText = '사용 가능한 닉네임입니다.'
                            nickResult.style.color = 'green';
                            isNickOk = true;
                        }
                    }
                })
            } else {
                nickResult.innerText = '유효하지 않은 닉네임입니다.'
                nickResult.style.color = 'red';
                isNickOk = false;
            }
        })

        $('input[name=hp]').focusout(function () {
            const hp = $('input[name=hp]').val();
            const hpResult = document.getElementsByClassName("resultHp")[0]


            if (hp.match(reHp)) {
                $.ajax({
                    url: "/Jboard2_war_exploded/user/checkHp.do?hp=" + hp,
                    type: "GET",
                    dataType: "json",
                    success: function (result) {
                        if (result.result >= 1) {
                            hpResult.innerText = '이미 사용중인 휴대폰번호 입니다.'
                            hpResult.style.color = 'red';
                            isHpOk = false;
                        } else {
                            hpResult.innerText = '사용 가능한 휴대폰번호 입니다.'
                            hpResult.style.color = 'green';
                            isHpOk = true;
                        }

                    }
                })

            } else {
                hpResult.innerText = '유효하지 않은 번호입니다.'
                hpResult.style.color = 'red';
                isHpOk = false;

            }

        })

        //이메일 인증
        $(function () {


            let preventDoubleClick = false;
            let receivedCode = 0;
            let re = false;
            $('#btnEmailCode').click(function () {

                const email = $('input[name="email"]').val();
                const jsonData = {email: email};

                if (re) {
                    let com = confirm('인증코드를 재전송 하시겠습니까?')
                    if (!com) {
                        return false;
                    }
                }

                if (preventDoubleClick) {
                    return;
                } else {
                    preventDoubleClick = true;
                }

                setTimeout(function () {
                    $.ajax({
                        url: '/Jboard2_war_exploded/user/authEmail.do',
                        type: 'GET',
                        dataType: 'json',
                        data: jsonData,
                        success: function (result) {
                            receivedCode = result.status;
                            if (result.status >= 1) {
                                re=true;
                                $('.auth').show();
                                $('.resultEmail').css('color', 'green').text('인증코드 전송 완료.')
                                console.log(receivedCode)
                            } else {
                                $('.auth').show();
                                $('.resultEmail').css('color', 'red').text('인증코드 전송 실패.');
                            }
                            preventDoubleClick = false;


                        }
                    })
                }, 1000)

            })


            $('#btnEmailAuth').click(function () {

                const code = $('input[name=auth]').val();

                $.ajax({
                    url: '/Jboard2_war_exploded/user/authEmail.do',
                    type: 'POST',
                    dataType: 'json',
                    data: {code:code},
                    success: function (result) {
                        if (result.result >= 1) {
                            $('.resultAuth').css('color', 'green').text('인증코드 확인 완료.')
                        } else {
                            $('.resultAuth').css('color', 'red').text('인증코드가 다릅니다.');
                        }
                    }
                })

            })



        })

    }
</script>
<main id="user">
    <section class="register">

        <form action="/Jboard2_war_exploded/user/register.do" method="post" id="formUser">
            <table border="1">
                <caption>사이트 이용정보 입력</caption>
                <tr>
                    <td>아이디</td>
                    <td>
                        <input type="text" name="uid" placeholder="아이디 입력"/>
                        <button type="button" id="btnCheckUid"><img src="../img/chk_id.gif" alt="중복확인"/></button>
                        <span class="uidResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="pass1" placeholder="비밀번호 입력"/></td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" name="pass2" placeholder="비밀번호 입력 확인"/>
                        <span class="passResult"></span></td>
                </tr>
            </table>

            <table border="1">
                <caption>개인정보 입력</caption>
                <tr>
                    <td>이름</td>
                    <td>
                        <input type="text" name="name" placeholder="이름 입력"/>
                        <span class="nameResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>별명</td>
                    <td>
                        <p class="nickInfo">공백없는 한글, 영문, 숫자 입력</p>
                        <input type="text" name="nick" placeholder="별명 입력"/>
                        <button type="button" id="btnCheckNick"><img src="../img/chk_id.gif" alt="중복확인"/></button>
                        <span class="nickResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        <input type="email" name="email" placeholder="이메일 입력"/>
                        <button type="button" id="btnEmailCode"><img src="../img/chk_auth.gif" alt="인증번호 받기"/></button>

                        <span class="resultEmail"></span>
                        <div class="auth">
                            <input type="text" name="auth" placeholder="인증번호 입력"/>
                            <button type="button" id="btnEmailAuth"><img src="../img/chk_confirm.gif" alt="확인"/>
                            </button>

                            <span class="resultAuth"></span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td><input type="text" name="hp" placeholder="휴대폰 입력"/>
                        <span class="resultHp"></span></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>
                        <input type="text" name="zip" placeholder="우편번호" readonly/>
                        <button type="button" class="btnZip" onclick="zipcode()"><img src="../img/chk_post.gif"
                                                                                      alt="우편번호찾기"/></button>
                        <input type="text" name="addr1" placeholder="주소를 검색하세요." readonly/>
                        <input type="text" name="addr2" placeholder="상세주소를 입력하세요."/>
                        <%--                        <input type="text" name="zip" placeholder="우편번호"/>
                                                <button type="button"><img src="../img/chk_post.gif" alt="우편번호찾기"/></button>
                                                <input type="text" name="addr1" placeholder="주소 검색"/>
                                                <input type="text" name="addr2" placeholder="상세주소 입력"/>--%>
                    </td>
                </tr>
            </table>

            <div>
                <a href="login.do" class="btn btnCancel">취소</a>
                <input type="submit" value="회원가입" class="btn btnRegister"/>
            </div>

        </form>

    </section>
</main>

<%@ include file="_footer.jsp" %>