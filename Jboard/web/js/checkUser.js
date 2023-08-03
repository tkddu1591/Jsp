
//아이디 중복 체크
$(function () {


    let idCheck = 0;
    $('#btnCheckUid').click(function () {

        const uid = $('input[name=uid]').val();
        if (uid === '') {

            $('.resultId').css('color', 'red').text('아이디를 입력해주세요.')
            idCheck = 0;
        } else {
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
                        idCheck = 0;
                    } else {
                        $('.resultId').css('color', 'green').text('사용 가능한 아이디입니다.')
                        idCheck = 1;
                    }
                },
                error: function () {
                }
            })
        }
    })


    //비밀번호 중복 체크
    let passCheck = 0;
    $('input[name=pass2]').focusout(function () {
        let pass1 = document.getElementsByName('pass1')[0];
        let pass2 = document.getElementsByName('pass2')[0];

        const p1 = pass1.value;
        const p2 = pass2.value;

        if (p1 === '' || p2 === '') {

            $('.resultPass').css('color', 'red').text('비밀번호를 입력해주세요.')
            passCheck = 0;
        } else if (p1 === p2) {
            $('.resultPass').css('color', 'green').text('사용 가능한 비밀번호 입니다.')
            passCheck = 1;
        } else {
            $('.resultPass').css('color', 'red').text('비밀번호를 확인해 주세요')
            passCheck = 0;
        }
    })


    //이름체크
    let nameCheck = 0;
    const name = document.getElementsByName('name');
    name[0].focusout = function () {
        const name = this.value;
        const resultName = document.getElementsByClassName('resultName');
        if (name === '') {
            resultName[0].innerText = '이름을 입력해 주세요'
            resultName[0].style.color = 'red'
            nameCheck = 0;
        } else {
            resultName[0].innerText = ''
            nameCheck = 1;
        }
    }


    let nickCheck = 0
    //닉네임 중복 체크
    $('input[name=nick]').focusout(function () {
        const nick = $(this).val();
        if (nick === '') {

            $('.resultNick').css('color', 'red').text('별명을 입력해주세요.')
            nickCheck = 0;
        } else {

            const jsonData = {
                "nick": nick
            }
            console.log(jsonData)
            console.log(nick)
            /*
            $.ajax({
                url:'./checkNick.jsp?nick='+nick+'$key='+key
            })*/
            $.get('/Jboard_war_exploded/user/checkNick.jsp', jsonData, function (data) {
                if (data.result >= 1) {
                    $('.resultNick').css('color', 'red').text('이미 사용중인 별명입니다.')
                    nickCheck = 0;
                } else {
                    $('.resultNick').css('color', 'green').text('사용 가능한 별명입니다.')
                    nickCheck = 1;
                }
            })
        }

    })


    //이메일 중복 체크
    let emailCheck = 0;
    const email = document.getElementsByName('email')
    email[0].focusout = function () {

        const email = this.value;

        console.log(email);
        if (email === '') {

            $('.resultEmail').css('color', 'red').text('이메일을 입력해주세요.')
            emailCheck = 0;
        } else {

            const xhr = new XMLHttpRequest();
            xhr.open('GET', '/Jboard_war_exploded/user/checkEmail.jsp?email=' + email);
            xhr.send()

            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        const data = JSON.parse(xhr.response);
                        console.log(data);


                        if (data.result >= 1) {
                            $('.resultEmail').css('color', 'red').text('이미 사용중인 이메일입니다.')
                            emailCheck = 0;
                        } else {
                            $('.resultEmail').css('color', 'green').text('사용 가능한 이메일입니다.')
                            emailCheck = 1;
                        }
                    }
                }

            };
        }

    }
    let hpCheck = 0;


    //휴대폰 중복체크

    document.getElementsByName('hp')[0].addEventListener('focusout', function () {
        const url = '/Jboard_war_exploded/user/checkHp.jsp?hp=' + this.value

        if (this.value.length !== 13) {

            $('.resultHp').css('color', 'red').text('휴대폰 번호를 정확히 입력해주세요.')
            hpCheck = 0;
        } else {
            fetch(url)
                .then(response => response.json())
                .then(data => {
                    if (data.result >= 1) {
                        $('.resultHp').css('color', 'red').text('이미 사용중인 휴대폰번호입니다.')
                        hpCheck = 0;
                    } else {
                        $('.resultHp').css('color', 'green').text('사용 가능한 휴대폰번호입니다.')
                        hpCheck = 1;
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
            xhr.open('GET', '/Jboard_war_exploded/user/checkHp.jsp?hp=' + hp);
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
    let addrCheck = 0;
    const addr = document.getElementsByName('addr2');
    const resultAddr = document.getElementsByClassName('resultAddr');
    addr[0].focus = function () {
        console.log(this.value);
        const addr = document.getElementsByName('addr1');
        if (addr === '') {
            resultAddr[0].innerText = '주소를 입력해 주세요'
            resultAddr[0].style.color = 'red'
            addrCheck = 0;
        } else {
            resultAddr[0].innerText = ''
            addrCheck = 1;
        }
    }


  /*  $('.btnJoin').click(function () {
        if (idCheck === 0) {
            alert("아이디를 확인해 주세요")
            return false;
        } else if (passCheck === 0) {
            alert("비밀번호를 확인해 주세요");
            return false;
        } else if (nameCheck === 0) {
            alert("이름을 확인해 주세요");
            return false;
        } else if (nickCheck === 0) {
            alert("닉네임을 확인해 주세요");
            return false;
        } else if (emailCheck === 0) {
            alert("이메일을 확인해 주세요");
            return false;
        } else if (hpCheck === 0) {
            alert("휴대폰번호를 확인해 주세요");
            return false;
        } else if (addrCheck === 0) {
            alert("주소를 입력해 주세요");
            resultAddr[0].innerText = '주소를 입력해 주세요'
            resultAddr[0].style.color = 'red'
            return false;
        }
    })*/

})