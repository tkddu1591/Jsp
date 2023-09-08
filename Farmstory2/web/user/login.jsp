<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<link rel="stylesheet" href="../css/style.css"/>
<link rel="stylesheet" href="./css/style.css"/>
<script>

    const success = ${success};

    if(success == 100){
        alert('아이디, 비밀번호를 다시 확인하십시요.');
    }else if(success == 101){
        alert('로그인 후 시도해주십시오.');
    }else if(success == 102){
        alert('관리자 로그인 후 시도해주십시오.');
    }else if(success == 200){
        alert('정상적으로 로그아웃 되었습니다.');
    }else if(success == 300){
        alert('비밀번호가 변경 되었습니다. 다시 로그인 하시기 바랍니다.');
    }
</script>
<div id="user">
    <section class="login">
        <form action="/Farmstory2_war_exploded/user/login.do" method="post">
            <table border="0">
                <tr>
                    <td><img src="/Farmstory2_war_exploded/images/login_ico_id.png" alt="아이디"></td>
                    <td><input type="text" name="uid" placeholder="아이디 입력"></td>
                </tr>
                <tr>
                    <td><img src="/Farmstory2_war_exploded/images/login_ico_pw.png" alt="비밀번호"></td>
                    <td><input type="password" name="pass" placeholder="비밀번호 입력"></td>
                </tr>
            </table>
            <input type="submit" value="로그인" class="btnLogin">
        </form>
        <div>
            <h3>회원 로그인 안내</h3>
            <p>
                아직 회원이 아니시면 회원으로 가입하세요.
            </p>
            <a href="/Farmstory2_war_exploded/user/terms.do">회원가입</a>
        </div>
    </section>
</div>
<%@ include file="../_footer.jsp" %>