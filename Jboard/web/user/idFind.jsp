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

        <style>
            * {
                margin: 0;
                padding: 0;
                font-style: normal;
                font-size: 12px;
                font-family: "돋움";
                font-weight: normal;
            }

            ul, ol {
                list-style: none;
            }

            a {
                text-decoration: none;
                color: #111;
            }

            input, textarea {
                outline: none;
            }

            body {
            }

            #wrapper {
                width: 100%;
                height: auto;
                margin: 0 auto;
            }

            header {
                width: 100%;
                height: auto;
                padding: 10px 0 10px 0;
                box-sizing: border-box;
                background: #f7f7f7;
                border-bottom: 1px solid #ebebeb;
                overflow: hidden;
            }

            header > div {
                width: 800px;
                height: auto;
                margin: 0 auto;
            }

            header > div > h3 {
                float: left;
                color: #777;
                font-weight: bold;
            }

            header > div > p {
                float: right;

            }

            footer {
                width: 100%;
                height: auto;
                padding: 10px;
                box-sizing: border-box;
                background: #f7f7f7;
                border-top: 1px solid #ebebeb;
                color: #777;
                text-align: right;

            }

            footer > div {
                width: 800px;
                height: auto;
                margin: 0 auto;
            }


            #user.register {
                width: 600px;
                height: auto;
                margin: 60px auto;
            }

            #user.register > form {
            }

            #user.register table {
                width: 100%;
                border-top: 2px solid #111;
                border-collapse: collapse;
                border-spacing: 0;
                margin-bottom: 10px;
            }

            #user.register table>span {
                padding: 10px 0;
                font-weight: bold;
                text-align: left;
            }

            #user.register table tr {
            }

            #user.register table td {
                padding: 6px 12px;
                border: 1px solid #e9e9e9;
            }

            #user.register table td:nth-child(1) {
                width: 80px;
                background: #f5f8f9;
            }

            #user.register table input {
                width: 160px;
                height: 22px;
                background: #f7f7f7;
                border: 1px solid #e4eaec;
                text-indent: 6px;
            }


            #user.register  label {
                display: inline-block;
                font-weight: bold;
                font-size: 15px;
                margin-bottom: 5px;
            }

            #user.register  label:hover {
                color: black;
                cursor: pointer;
            }

            #user.register  label > input[type=radio] {
            }

            #user.register table div {
                margin-bottom: 2px;
            }

            #user.register table div:nth-child(1) > input {
                width: 80px;
            }

            #user.register table div:nth-child(2) > input {
                width: 320px;
            }

            #user.register table div:nth-child(3) > input {
                width: 320px;
            }

            #user.register button {
                border: none;
                vertical-align: middle;
            }

            #user.register > form > div {
                text-align: right;
            }

            #user.register > form > div > .btnCancel {
                padding: 8px;
                border: 1px solid #bebebe;
                background: #fdfdfd;
                color: #111;
            }

            #user.register > form > div > .btnJoin {
                padding: 7px;
                border: 1px solid #bebebe;
                background: #e9e9e9;
                color: #111;
            }

        </style>
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

                    <label class="on"><input type="radio" name="tabs" id="tab1" checked>공지사항</label>

                    <table border="0">
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
                    <label><input type="radio" name="tabs" id="tab2">갤러리</label>
                    <table border="0">
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