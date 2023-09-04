window.onload = function () {

    const inputUid = document.getElementsByName('uid')[0];
    const btnCheckUid = document.getElementById("btnCheckUid");

    btnCheckUid.onclick = function () {

        if (inputUid.value.match(reUid)) {
            const uidResult = document.getElementsByClassName("resultId")[0]
            const uid = inputUid.value;
            const xhr = new XMLHttpRequest();
            xhr.open("GET", "/Farmstory2_war_exploded/user/checkUser.do?uid=" + uid);
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

    $('input[name=nick]').focusout(function () {
        const nick = $('input[name=nick]').val();
        const nickResult = document.getElementsByClassName("resultNick")[0]

        if (nick.match(reNick)) {
            $.ajax({
                url: "/Farmstory2_war_exploded/user/checkUser.do?nick=" + nick,
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
                url: "/Farmstory2_war_exploded/user/checkUser.do?hp=" + hp,
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

}
