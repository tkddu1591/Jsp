<%--
Created by IntelliJ IDEA.
User: Java
Date: 2023-08-02
Time: 오전 9:09
To change this template use File | Settings | File Templates.
--%>
<%--아이디 비번 이름 별명 email 휴대폰--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<html>

    <head>
        <meta charset="UTF-8">
        <title>회원가입</title>

        <link href="../css/style.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script src="../js/zipCode.js"></script>
        <script>
            const resultAddr = document.getElementsByClassName('resultAddr');

            //유효성 검증(Validation)

            //폼 데이터 검증 결과 상태변수 생성
            let idCheck = false;
            let passCheck = false;
            let nameCheck = false;
            let nickCheck = false;
            let emailCheck = false;
            let hpCheck = false;
            let addrCheck = false;

            //데이터 검증에 사용하는 정규표현식
            let reUid = /^[a-z]+[a-z0-9]{4,19}$/g;
            let rePass = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{4,16}$/;
            let reName = /^[가-힣]{2,10}$/
            let reNick = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]*$/;
            let reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
            let reHp = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;


            $(function () {


                //아이디 검사 (중복확인 후 변경)

                $('input[name=uid]').focusout(function () {
                    $('.resultId').text('')
                    idCheck = false
                    return false
                })


                //비밀번호 검사
                $('input[name=pass2]').focusout(function () {
                    let pass1 = document.getElementsByName('pass1')[0];
                    let pass2 = document.getElementsByName('pass2')[0];

                    const p1 = pass1.value;
                    const p2 = pass2.value;

                    if (p1 !== p2) {
                        $('.resultPass').css('color', 'red').text('비밀번호가 일치하지 않습니다.')
                        passCheck = false;
                        return false
                    } else if (!p2.match(rePass)) {

                        $('.resultPass').css('color', 'red').text('5~16자의 영문자, 숫자, 특수문자를 사용해 주세요.')
                        passCheck = false;
                        return false
                    } else if (p1 === p2) {
                        $('.resultPass').css('color', 'green').text('사용 가능한 비밀번호 입니다.')
                        passCheck = true;
                    }
                })

                //이름 검사
                const name = document.getElementsByName('name');
                name[0].focusout = function () {
                    const name = this.value;
                    const resultName = document.getElementsByClassName('resultName');
                    if (!name.match(reName)) {
                        resultName[0].innerText = '유효한 이름이 아닙니다.'
                        resultName[0].style.color = 'red'
                        nameCheck = false;
                        return false
                    } else {
                        resultName[0].innerText = ''
                        nameCheck = true;
                    }
                }

                //별명 검사
                //이메일 검사
                //휴대폰 검사


                //최종 전송
                $('.btnJoin').click(function () {
                    if (idCheck === false) {
                        alert("아이디를 확인해 주세요")
                        $('.resultId').css('color', 'red').text('아이디를 확인해 주세요.')
                        return false;
                    } else if (passCheck === false) {
                        alert("비밀번호를 확인해 주세요");
                        $('.resultPass').css('color', 'red').text('비밀번호를 확인해 주세요.')
                        return false;
                    } else if (nameCheck === false) {
                        alert("이름을 확인해 주세요");
                        $('.resultName').css('color', 'red').text('이름을 확인해 주세요.')
                        return false;
                    } else if (nickCheck === false) {
                        alert("별명을 확인해 주세요");
                        $('.resultNick').css('color', 'red').text('별명을 확인해 주세요.')
                        return false;
                    } else if (emailCheck === false) {
                        alert("이메일을 확인해 주세요");
                        $('.resultEmail').css('color', 'red').text('이메일을 확인해 주세요.')
                        return false;
                    } else if (hpCheck === false) {
                        alert("휴대폰번호를 확인해 주세요");
                        $('.resultHp').css('color', 'red').text('휴대폰번호를 확인해 주세요.')
                        return false;
                    } else if (addrCheck === false) {
                        alert("주소를 입력해 주세요");
                        resultAddr[0].innerText = '주소를 입력해 주세요'
                        resultAddr[0].style.color = 'red'
                        return false;
                    }
                })
            })
        </script>
        <script src="../js/checkUser.js"></script>
    </head>


    <body>
        <div id="wrapper">
            <header>
                <div>
                    <h3>Board System v1.0</h3>
                </div>
            </header>
            <section id="user" class="register">
                <form id="formUser" action="/Jboard_war_exploded/user/registerProc.jsp" method="POST">
                    <table border="0">
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
                    <table border="0">
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
                            <td>E-Mail</td>
                            <td>
                                <input type="email" name="email" placeholder="이메일 입력"/>
                                <span class="resultEmail"></span>
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
                                    <button type="button" onclick="zipCode()" class="btnZip"><img
                                            src="../images/chk_post.gif" alt="">
                                    </button>
                                    <span class="resultAddr"></span>
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
                        <a href="login.jsp" class="btnCancel">취소</a>
                        <input type="submit" class="btnJoin" value="회원가입"/>
                    </div>

                </form>

            </section>

            <footer>
                <div>
                    ⓒCopyleft by chhak.or.kr
                </div>
            </footer>
        </div>

    </body>

</html>