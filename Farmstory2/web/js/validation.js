/**
 * 회원가입 유효성 검사
 */
    // 폼 데이터 검증결과 상태변수
let isUidOk = false;
let isPassOk = false;
let isNameOk = false;
let isNickOk = false;
let isEmailOk = true; //2차 개발에 이메일 코드 전송 구현필요
let isHpOk = false;

// 데이터 검증에 사용하는 정규표현식
let reUid = /^[a-z]+[a-z0-9]{4,19}$/g;
let rePass = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{5,16}$/;
let reName = /^[가-힣]{2,10}$/
let reNick = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]{3,19},*$/;
let reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
let reHp = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;

// 유효성 검증(Validation)
$(function () {


    let re = false;

    // 아이디 검사
    $('input[name=uid]').keydown(function () {
        $('.resultId').text('');
        isUidOk = false;
    });
    // 이메일 검사
/*    $('input[name=email]').keydown(function () {
            $('.resultEmail').text('');
            isEmailOk = false;
            re=false;
    });*/
    // 별명 검사
    $('input[name=nick]').keydown(function () {
        $('.resultNick').text('');
        isNickOk = false;
    });

    // 비밀번호 검사
    $('input[name=pass2]').focusout(function () {

        const pass1 = $('input[name=pass1]').val();
        const pass2 = $('input[name=pass2]').val();
        $('.resultPass').css('color', 'green').text('사용할 수 있는 비밀번호 입니다.');

        if (pass1 == pass2) {

            if (pass1.match(rePass)) {
                $('.resultPass').css('color', 'green').text('사용할 수 있는 비밀번호 입니다.');
                isPassOk = true;
            } else {
                $('.resultPass').css('color', 'red').text('비밀번호는 숫자, 영문, 특수문자 조합 5자리 이상이어야 합니다.');
                isPassOk = false;
            }
        } else {
            $('.resultPass').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
            isPassOk = false;
        }
    });

    // 이름 검사
    $('input[name=name]').focusout(function () {

        const name = $(this).val();

        if (name.match(reName)) {
            $('.resultName').text('');
            isNameOk = true;
        } else {
            $('.resultName').css('color', 'red').text('유효하지 않은 이름입니다.');
            isNameOk = false;
        }
    });

    // 최종 전송
    $('#formUser').submit(function () {

        if (!isUidOk) {
            alert('아이디를 확인 해주세요.');
            return false; // 폼 전송 취소
        }

        if (!isPassOk) {
            alert('비밀번호를 확인 해주세요.');
            return false; // 폼 전송 취소
        }

        if (!isNameOk) {
            alert('이름를 확인 해주세요.');
            return false; // 폼 전송 취소
        }

        if (!isNickOk) {
            alert('별명을 확인 해주세요.');
            return false; // 폼 전송 취소
        }

        if (!isEmailOk) {
            alert('이메일을 확인 해주세요.');
            return false; // 폼 전송 취소
        }

        if (!isHpOk) {
            alert('휴대폰을 확인 해주세요.');
            return false; // 폼 전송 취소
        }

        return true; // 폼 전송 시작
    });

}); // 유효성 검증 끝