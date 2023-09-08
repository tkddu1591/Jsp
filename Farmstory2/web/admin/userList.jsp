<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="_header.jsp" %>
<script>
    let dto;
    let user;
    let grade;

    //체크박스 히든으로 타입 변경


    $(document).ready(function () {

        function CheckboxToHidden(f,ele) {
            var ele_h;
            var val;

            if (typeof(ele.length) != "undefined") {// checkbox가 배열일경우
                for (var i = 0; i < ele.length; i++) {
                    // hidden객체생성, 이름은 checkbox와 같게한다.
                    ele_h = document.createElement("input");
                    ele_h.setAttribute("type","hidden");
                    ele_h.setAttribute("name",ele[i].name);
                    ele[i].checked ? val = "1" : val = "0";
                    ele_h.setAttribute("value",val);
                    f.appendChild(ele_h);
                    let is_checked = ele[i].checked;

                    // 3. 결과를 출력합니다.

                    // 기존 checkbox의 이름을 이름_dummy로 변경한후 checked = false해준다.
                    ele[i].checked = false;
                    ele[i].setAttribute("name",ele[i].name + "_dummy");
                }
            } else {// checkbox가 한개
                ele_h = document.createElement("input");
                ele_h.setAttribute("type","hidden");
                ele_h.setAttribute("name",ele.name);
                ele.checked ? val = "1" : val = "0";
                ele_h.setAttribute("value",val);
                f.appendChild(ele_h);

                ele.checked = false;
                ele.setAttribute("name",ele.name + "_dummy");
            }
        }

        //전체 선택
        $('.allSelect').click(function () {
            if ($(this).is(':checked')) {
                let check = $('input:checkbox')
                check.prop('checked', true);
                $('.chks').val(1);
                console.log(check.eq(2).checked);
            } else {
                let check = $('input:checkbox')
                check.prop('checked', false);
                $('.chks').val(0);
                console.log(check.eq(2).checked);
            }
        })

        //수정
        document.getElementsByClassName('userConfirm')[0].onclick = function (e) {
            if (confirm('수정하시겠습니까?')) {

                let tear = document.getElementsByClassName('tear')
                for (let i = 0; i < tear.length; i++) {
                    tear[i].style.background = '#FFFFFF';
                }

                // form 액션 구현하기

                const form = document.getElementById('formCheck');
                let chks = document.getElementsByClassName('chks');
                CheckboxToHidden(form,chks);

                alert('수정되었습니다.')
                $('#formCheck').submit();
/*                let check = $('input:checkbox')
                check.prop('checked', false).val(0);*/
                e.preventDefault();
            }
        }


    });

    //개별 선택
    checkClick = (target) => {
        console.log(target.value)
        if ($(this).is(':checked')) {
            target.val(1);
        } else {
            target.val(0);
        }
    }


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
                } else if (user[i] === (' SILVER')) {
                    user[i] = "2등급 (실버 유저)"
                } else if (user[i] === (' GOLD')) {
                    user[i] = "3등급 (골드 유저)"
                } else if (user[i] === (' DIAMOND')) {
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
                <form action="./userList.do" method="post" id="formCheck" onclick="checkClick(this)">
                    <c:forEach var="dto" items="${userDTOS}" varStatus="status">
                        <tr class="userDataPreview">
                            <td><input type="checkbox" class="chks" name="chks" value="0"/></td>
                            <input type="hidden" name="uids" value="${dto.uid}"/>
                            <td>${dto.uid}</td>
                            <td>${dto.name}</td>
                            <td>${dto.nick}</td>
                            <td>${dto.email}</td>
                            <td>${dto.hp}</td>
                            <td>
                                <select class="tear" onchange="gradeChange(this)" name="role">
                                    <option ${dto.role eq 'USER'? 'selected':''} value="USER">1</option>
                                    <option ${dto.role eq 'SILVER'? 'selected':''} value="SILVER">2</option>
                                    <option ${dto.role eq 'GOLD'? 'selected':''} value="GOLD">3</option>
                                    <option ${dto.role eq 'DIAMOND'? 'selected':''} value="DIAMOND">4</option>
                                    <option ${dto.role eq 'ADMIN'? 'selected':''} value="ADMIN">5</option>
                                </select>
                            </td>
                            <td>${dto.regDate}</td>
                            <td><a href="#" class="showPopup" onclick="userData(this)" data-value="${dto}">[상세확인]</a>
                            </td>

                        </tr>
                    </c:forEach>
                </form>
            </table>


            <p>
                <a href="#" class="userConfirm">선택수정</a>
            </p>


            <p class="paging">
                <c:if test="${pageGroupStart > 1}">
                    <a href="/Farmstory2_war_exploded/admin/userList.do?cate=3&pg=1" class="start">처음으로</a>
                    <a href="/Farmstory2_war_exploded/admin/userList.do?cate=3&pg=${pageGroupStart - 1}"
                       class="prev">이전</a>
                </c:if>
                <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
                    <a href="/Farmstory2_war_exploded/admin/userList.do?cate=3&pg=${i}&"
                       class="num ${currentPage == i?'on':'off'}">${i}</a>
                </c:forEach>
                <c:if test="${pageGroupEnd < lastPageNum}">
                    <a href="/Farmstory2_war_exploded/admin/userList.do?cate=3&pg=${pageGroupEnd + 1}"
                       class="next">다음</a>
                    <a href="/Farmstory2_war_exploded/admin/userList.do?cate=3&pg=${lastPageNum}" class="last">마지막</a>
                </c:if>
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