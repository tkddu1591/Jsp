
//아이디 중복 체크
$(function () {


    $('#btnCheckUid').click(function () {

        const uid = $('input[name=uid]').val();
        if (!uid.match(reUid)) {
            idCheck = false;
            $('.resultId').css('color', 'red').text('유효한 아이디가 아닙니다.')
            return false
        } else {
            const jsonData = {
                "uid": uid
            }
            $.ajax({
                url: '/Jboard_war_exploded/user/checkUser.jsp',
                type: 'GET',
                data: jsonData,
                dataType: 'json',
                success: function (data) {
                    if (data.result >= 1) {
                        $('.resultId').css('color', 'red').text('이미 사용중인 아이디입니다.')
                        idCheck = false;
                        return false
                    } else {
                        $('.resultId').css('color', 'green').text('사용 가능한 아이디입니다.')
                        idCheck = true;
                    }
                },
                error: function () {
                }
            })
        }
    })




    //닉네임 중복 체크
    $('input[name=nick]').focusout(function () {
        const nick = $(this).val();
        if (!nick.match(reNick)) {

            $('.resultNick').css('color', 'red').text('유효한 별명이 아닙니다.')
            nickCheck = false;
            return false
        } else {

            const jsonData = {
                "nick": nick
            }
            /*
            $.ajax({
                url:'./checkNick.jsp?nick='+nick+'$key='+key
            })*/
            $.get('/Jboard_war_exploded/user/checkUser.jsp', jsonData, function (data) {
                if (data.result >= 1) {
                    $('.resultNick').css('color', 'red').text('이미 사용중인 별명입니다.')
                    nickCheck = false;
                    return false
                } else {
                    $('.resultNick').css('color', 'green').text('사용 가능한 별명입니다.')
                    nickCheck = true;
                }
            })
        }

    })


    //이메일 중복 체크
    const email = document.getElementsByName('email')
    email[0].focusout = function () {

        const email = this.value;

        console.log(email);
        if (!email.match(reEmail)) {

            $('.resultEmail').css('color', 'red').text('유효한 이메일이 아닙니다.')
            emailCheck = false;
            return false
        } else {

            const xhr = new XMLHttpRequest();
            xhr.open('GET', '/Jboard_war_exploded/user/checkUser.jsp?email=' + email);
            xhr.send()

            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        const data = JSON.parse(xhr.response);
                        console.log(data);


                        if (data.emailResult >= 1) {
                            $('.resultEmail').css('color', 'red').text('이미 사용중인 이메일입니다.')
                            emailCheck = false;
                            return false
                        } else {
                            $('.resultEmail').css('color', 'green').text('사용 가능한 이메일입니다.')
                            emailCheck = true;
                        }
                    }
                }

            };
        }

    }




    //휴대폰 중복체크

    document.getElementsByName('hp')[0].addEventListener('focusout', function () {
        const url = '/Jboard_war_exploded/user/checkUser.jsp?hp=' + this.value

        if (!this.value.match(reHp)) {

            $('.resultHp').css('color', 'red').text('휴대폰 번호를 정확히 입력해주세요.')
            hpCheck = false;
            return false
        } else {
            fetch(url)
                .then(response => response.json())
                .then(data => {
                    if (data.result >= 1) {
                        $('.resultHp').css('color', 'red').text('이미 사용중인 휴대폰번호입니다.')
                        hpCheck = false;
                        return false
                    } else {
                        $('.resultHp').css('color', 'green').text('사용 가능한 휴대폰번호입니다.')
                        hpCheck = true;
                    }
                })
        }
    })

    /*const hp = document.getElementsByName('hp')
    hp[0].focusout = function () {

        const hp = this.value;

        console.log(hp);
        console.log(hp.length);
        if (hp.length !== 13) {

            $('.resultHp').css('color', 'red').text('휴대폰 번호를 정확히 입력해주세요.')
            hpCheck = 0;
        } else {

            const xhr = new XMLHttpRequest();
            xhr.open('GET', '/Jboard_war_exploded/user/checkUser.jsp?hp=' + hp);
            xhr.send()

            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        const data = JSON.parse(xhr.response);
                        console.log(data);


                        if (data.result >= 1) {
                            $('.resultHp').css('color', 'red').text('이미 사용중인 휴대폰번호입니다.')
                            hpCheck = 0;
                        } else {
                            $('.resultHp').css('color', 'green').text('사용 가능한 휴대폰번호입니다.')
                            hpCheck = 1;
                        }
                    }
                }

            };
        }

    }*/


    //주소
    const addr = document.getElementsByName('addr2');
       addr[0].focus = function () {
        const addr = document.getElementsByName('addr1');
        if (addr === '') {
            resultAddr[0].innerText = '주소를 입력해 주세요'
            resultAddr[0].style.color = 'red'
            addrCheck = false;
        } else {
            resultAddr[0].innerText = ''
            addrCheck = true;
        }
    }


/*    $('.btnJoin').click(function () {
        if (idCheck===false) {
            alert("아이디를 확인해 주세요")
            return false;
        } else if (passCheck ===false) {
            alert("비밀번호를 확인해 주세요");
            return false;
        } else if (nameCheck ===false) {
            alert("이름을 확인해 주세요");
            return false;
        } else if (nickCheck ===false) {
            alert("닉네임을 확인해 주세요");
            return false;
        } else if (emailCheck ===false) {
            alert("이메일을 확인해 주세요");
            return false;
        } else if (hpCheck ===false) {
            alert("휴대폰번호를 확인해 주세요");
            return false;
        } else if (addrCheck ===false) {
            alert("주소를 입력해 주세요");
            resultAddr[0].innerText = '주소를 입력해 주세요'
            resultAddr[0].style.color = 'red'
            return false;
        }
    })*/

})