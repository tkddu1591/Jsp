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
        } /*else if (addrCheck === false) {
            alert("주소를 입력해 주세요");
            resultAddr[0].innerText = '주소를 입력해 주세요'
            resultAddr[0].style.color = 'red'
            return false;
        }*/
    })
})