<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="_header.jsp" %>
<script>
    let dto;
    let user;
    let grade;

    $(document).ready(function () {

        //전체 선택
        $('.allSelect').click(function () {
            if ($(this).is(':checked')) {
                let check = $('input:checkbox')
                check.prop('checked', true).val(1);
            } else {
                let check = $('input:checkbox')
                check.prop('checked', false).val(0);
            }
        })
        //개별 선택
        $('input:checkbox').click(function () {
            if ($(this).is(':checked')) {
                $(this).val(1);
            } else {
                $(this).val(0);
            }
        })

        //수정
        document.getElementsByClassName('userConfirm')[0].onclick = function (e) {
            if (confirm('수정하시겠습니까?')) {

                let tear = document.getElementsByClassName('tear')
                for (let i = 0; i < tear.length; i++) {
                    tear[i].style.background = '#FFFFFF';
                }

                alert('수정되었습니다.')
                // form 액션 구현하기
                e.preventDefault();
            }
        }


    });


    //등급 수정
    gradeChange = (target) => {
        //텍스트 확인
        console.log(target.options[target.selectedIndex].text)
        //밸류 확인
        const type = target.options[target.selectedIndex].value
        //색상 변경
        target.style.background = '#999999';

    }

    //상세정보보기
    userData = (target) => {

        dto = target.getAttribute('data-value');
        /*return getUid()+", "+getName()+", "+getNick()+", "+getEmail()+", "+getHp()+", "+getRole()+", "+getZip()+", "+getAddr1()+", "+ getAddr2()+", "+getRegIp()+", "+ getRegDate() +", "+ getLeaveDate();*/
        user = dto.split(',', 13)


        for (let i = 0; i < user.length - 2; i++) {
            if (i === 5) {
                if (user[i] === (' USER')) {
                    user[i] = "1등급 (일반 유저)";
                } else if (user[i] === ('SILVER')) {
                    user[i] = "2등급 (실버 유저)"
                } else if (user[i] === ('GOLD')) {
                    user[i] = "3등급 (골드 유저)"
                } else if (user[i] === ('DIAMOND')) {
                    user[i] = "4등급 (다이아 유저)"
                } else {
                    user[i] = "관리자";
                }
            }
            document.getElementsByClassName('userData')[i].innerText = user[i];
        }
    }
</script>
<main>
    <%@ include file="_aside.jsp" %>
    <section id="orderList">
        <nav>
            <h3>회원목록</h3>
        </nav>

        <article>


            <table border="0">
                <tr>
                    <th><input type="checkbox" name="all" class="allSelect"/></th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>별명</th>
                    <th>이메일</th>
                    <th>휴대폰</th>
                    <th>등급</th>
                    <th>가입일</th>
                    <th>확인</th>
                </tr>
                <c:forEach var="dto" items="${userDTOS}" varStatus="status">
                    <tr>
                        <td><input type="checkbox" name="chk" value="${dto.uid}"/></td>
                        <td>${dto.uid}</td>
                        <td>${dto.name}</td>
                        <td>${dto.nick}</td>
                        <td>${dto.email}</td>
                        <td>${dto.hp}</td>
                        <td>
                            <select class="tear" onchange="gradeChange(this)">
                                <option ${dto.role eq 'USER'? 'selected':''} value="USER">1</option>
                                <option ${dto.role eq 'SILVER'? 'selected':''} value="SILVER">2</option>
                                <option ${dto.role eq 'GOLD'? 'selected':''} value="GOLD">3</option>
                                <option ${dto.role eq 'DIAMOND'? 'selected':''} value="DIAMOND">4</option>
                                <option ${dto.role eq 'ADMIN'? 'selected':''} value="ADMIN">5</option>
                            </select>
                        </td>
                        <td>${dto.regDate}</td>
                        <td><a href="#" class="showPopup" onclick="userData(this)" data-value="${dto}">[상세확인]</a></td>

                    </tr>
                </c:forEach>
            </table>


            <p>
                <a href="#" class="userConfirm">선택수정</a>
            </p>

            <p class="paging">
                <a href="#"><</a>
                <a href="#" class="on">[1]</a>
                <a href="#">[2]</a>
                <a href="#">[3]</a>
                <a href="#">[4]</a>
                <a href="#">[5]</a>
                <a href="#">></a>
            </p>
        </article>
    </section>
</main>
<div id="userPopup">
    <section>
        <nav>
            <h1>사용자 상세정보</h1>
            <button class="btnClose">닫기</button>
        </nav>

        <article>
            <h3>기본정보</h3>
            <table border="0">
                <tr>
                    <td>아이디</td>
                    <td class="userData">a101</td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td class="userData">김유신</td>
                </tr>
                <tr>
                    <td>별명</td>
                    <td class="userData">유신101</td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td class="userData">yusin101@naver.com</td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td class="userData">010-1234-1001</td>
                </tr>
                <tr>
                    <td>등급</td>
                    <td class="userData">2등급(준회원)</td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>
                        <p class="userData">
                            부산광역시 부산진구 대연동 120
                        </p>
                        <p class="userData">
                            한빛빌딩 10층
                        </p>
                        <p class="userData">
                            한빛빌딩 10층
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>아이피</td>
                    <td class="userData">192.168.10.112</td>
                </tr>
                <tr>
                    <td>회원가입일</td>
                    <td class="userData">2023-01-01 13:06:14</td>
                </tr>
            </table>
        </article>
    </section>
</div>
<%@ include file="_footer.jsp" %>