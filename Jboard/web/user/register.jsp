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
        <script>

            $(function () {
                let idCheck = 0;
                $('#btnCheckUid').click(function () {

                    const uid = $('input[name=uid]').val();
                    const jsonData = {
                        "uid": uid
                    }
                    $.ajax({
                        url: '/Jboard_war_exploded/user/checkUid.jsp',
                        type: 'GET',
                        data: jsonData,
                        dataType: 'json',
                        success: function (data) {
                            if (data.result >= 1) {
                                $('.resultId').css('color', 'red').text('이미 사용중인 아이디입니다.')
                            } else {
                                $('.resultId').css('color', 'green').text('사용 가능한 아이디입니다..')
                                idCheck = 1;
                            }
                        },
                        error: function () {
                        }
                    })

                })
                $('.btnJoin').click(function () {
                    const p1 = document.getElementsByName('pass1')[0].value;
                    const p2 = document.getElementsByName('pass2')[0].value;
                    if (idCheck === 0) {
                        alert("아이디를 확인해 주세요")
                        return false;
                    } else if (p1 !== p2) {
                        alert("비밀번호가 일치 하지 않습니다");
                        return false;
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
            <section id="user" class="register">
                <form action="/Jboard_war_exploded/user/registerProc.jsp" method="POST">
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
                            </td>
                        </tr>
                        <tr>
                            <td>휴대폰</td>
                            <td>
                                <input type="text" name="hp" placeholder="- 포함 13자리 입력" minlength="13" maxlength="13"/>
                            </td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>
                                <div>
                                    <input type="text" name="zip" placeholder="우편번호" readonly/>
                                    <button class="btnZip"><img src="../images/chk_post.gif" alt=""></button>
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