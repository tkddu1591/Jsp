<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="_header.jsp" %>

<script>
    $((function () {
        $('.showPopup').click(function () {
            let dto = document.getElementsByClassName("showPopup")[${dto.total}].getAttribute('data-value');
            /*return getUid()+", "+getName()+", "+getNick()+", "+getEmail()+", "+getHp()+", "+getRole()+", "+getZip()+", "+getAddr1()+", "+ getAddr2()+", "+getRegIp()+", "+ getRegDate() +", "+ getLeaveDate();*/
            let user = dto.split(',', 11)

            console.log(user);
            for (let i = 0; i < user.length; i++) {
                document.getElementsByClassName('user')[i].innerText = user[i];
            }
        })
    }))
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
                    <th><input type="checkbox" name="all"/></th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>별명</th>
                    <th>이메일</th>
                    <th>휴대폰</th>
                    <th>등급</th>
                    <th>가입일</th>
                    <th>확인</th>
                </tr>
                <c:forEach var="dto" items="${userDTOS}" varStatus="status" >
                    <tr>
                        <td><input type="checkbox" name=""/></td>
                        <td>${dto.uid}</td>
                        <td>${dto.name}</td>
                        <td>${dto.nick}</td>
                        <td>${dto.email}</td>
                        <td>${dto.hp}</td>
                        <td>
                            <select name="grade">
                                <option ${dto.role eq 'USER'? 'selected':''}>1</option>
                                <option ${dto.role eq 'SILVER'? 'selected':''}>2</option>
                                <option ${dto.role eq 'GOLD'? 'selected':''}>3</option>
                                <option ${dto.role eq 'DIAMOND'? 'selected':''}>4</option>
                                <option ${dto.role eq 'ADMIN'? 'selected':''}>5</option>
                            </select>
                        </td>
                        <td>${dto.regDate}</td>
                        <td><a href="#" class="showPopup"  onclick="userData(this)" data-value="${dto}" data-no="${dto.total}">[상세확인]</a></td>
                        <script>
                            const userData = (target) => {
                                let dto = target.getAttribute('data-value');
                                /*return getUid()+", "+getName()+", "+getNick()+", "+getEmail()+", "+getHp()+", "+getRole()+", "+getZip()+", "+getAddr1()+", "+ getAddr2()+", "+getRegIp()+", "+ getRegDate() +", "+ getLeaveDate();*/
                                let user = dto.split(',', 11)

                                console.log(user);
                                for (let i = 0; i < user.length; i++) {
                                    document.getElementsByClassName('user')[i].innerText = user[i];
                                }
                            }
                        </script>

                    </tr>
                </c:forEach>
            </table>

            <p>
                <a href="#" class="orderDelete">선택수정</a>
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
                    <td class="user">a101</td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td class="user">김유신</td>
                </tr>
                <tr>
                    <td>별명</td>
                    <td class="user">유신101</td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td class="user">yusin101@naver.com</td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td class="user">010-1234-1001</td>
                </tr>
                <tr>
                    <td>등급</td>
                    <td class="user">2등급(준회원)</td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>
                        <p class="user">
                            부산광역시 부산진구 대연동 120
                        </p>
                        <p class="user">
                            한빛빌딩 10층
                        </p>
                        <p class="user">
                            한빛빌딩 10층
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>아이피</td>
                    <td class="user">192.168.10.112</td>
                </tr>
                <tr>
                    <td>회원가입일</td>
                    <td class="user">2023-01-01 13:06:14</td>
                </tr>
            </table>
        </article>
    </section>
</div>
<%@ include file="_footer.jsp" %>