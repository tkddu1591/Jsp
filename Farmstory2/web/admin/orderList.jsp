<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="_header.jsp" %>
<style>
    .orderData:nth-of-type(1) {
        width: 150px;
    }

    #userPopup > section > article > table td:nth-of-type(1) {
        width: 70px;
    }
</style>
<script>
    orderData = (target) => {

        dto = target.getAttribute('data-value');
        /*return getUid()+", "+getName()+", "+getNick()+", "+getEmail()+", "+getHp()+", "+getRole()+", "+getZip()+", "+getAddr1()+", "+ getAddr2()+", "+getRegIp()+", "+ getRegDate() +", "+ getLeaveDate();*/
        console.log(dto);
        user = dto.split('|', 12)

        console.log(user.length)
        console.log(user[1])

        for (let i = 0; i < 12; i++) {
            if (i === 0) {
                document.getElementsByClassName('orderData')[0].src = '../thumb/' + user[i];
                continue;
            }
            document.getElementsByClassName('orderData')[i].innerText = user[i];
        }
    }
    window.onload = function () {
        //전체 선택
        $('.allSelect').click(function () {
            if ($(this).is(':checked')) {
                let check = $('input:checkbox')
                check.prop('checked', true);
            } else {
                let check = $('input:checkbox')
                check.prop('checked', false);
            }
        })

        //삭제
        document.getElementsByClassName('orderDelete')[0].onclick = function (e) {
            if (confirm('삭제하시겠습니까?')) {


                // form 액션 구현하기

                $('#formCheck').submit();

                let check = $('input:checkbox')
                check.prop('checked', false).val(0);
                alert('삭제되었습니다.')
                e.preventDefault();
            }
        }
    }
</script>
<main>
    <%@include file="_aside.jsp" %>
    <section id="orderList">
        <nav>
            <h3>주문목록</h3>
        </nav>

        <article>

            <table border="0">
                <tr>
                    <th><input type="checkbox" name="all" class="allSelect"/></th>
                    <th>주문번호</th>
                    <th>상품명</th>
                    <th>판매가격</th>
                    <th>수량</th>
                    <th>배송비</th>
                    <th>합계</th>
                    <th>주문자</th>
                    <th>주문일</th>
                    <th>확인</th>
                </tr>
                <form action="./orderList.do" method="post" id="formCheck" onclick="checkClick(this)">
                    <c:forEach var="dto" items="${orderDTOS}">
                        <tr>
                            <td><input type="checkbox" name="orderNos" value="${dto.orderNo}"/></td>
                            <td>${dto.orderNo}</td>
                            <td>${dto.orderProductName}</td>
                            <td>${dto.orderPrice}</td>
                            <td>${dto.orderCount}</td>
                            <td>${dto.orderDelivery}</td>
                            <td>${dto.orderTotal}</td>
                            <td>${dto.orderUserName}</td>
                            <td>${dto.orderDate}</td>
                            <td><a href="#" class="showPopup" onclick="orderData(this)" data-value="${dto}">[상세확인]</a>
                        </tr>
                    </c:forEach>
                </form>
            </table>

            <p>
                <a href="#" class="orderDelete">선택삭제</a>
            </p>

            <p class="paging">
                <c:if test="${pageGroupStart > 1}">
                    <a href="/Farmstory2_war_exploded/admin/orderList.do?cate=3&pg=1" class="start">처음으로</a>
                    <a href="/Farmstory2_war_exploded/admin/orderList.do?cate=3&pg=${pageGroupStart - 1}"
                       class="prev">이전</a>
                </c:if>
                <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
                    <a href="/Farmstory2_war_exploded/admin/orderList.do?cate=3&pg=${i}&"
                       class="num ${currentPage == i?'on':'off'}">${i}</a>
                </c:forEach>
                <c:if test="${pageGroupEnd < lastPageNum}">
                    <a href="/Farmstory2_war_exploded/admin/orderList.do?cate=3&pg=${pageGroupEnd + 1}"
                       class="next">다음</a>
                    <a href="/Farmstory2_war_exploded/admin/orderList.do?cate=3&pg=${lastPageNum}" class="last">마지막</a>
                </c:if>
            </p>
        </article>
    </section>
</main>

<div id="userPopup">
    <section>
        <nav>
            <h1>상세주문내역</h1>
            <button class="btnClose">닫기</button>
        </nav>

        <article>
            <h3>기본정보</h3>
            <table border="0">
                <tr>
                    <td rowspan="7" class="thumb"><img src="./images//sample_item1.jpg" alt="사과 500g" class="orderData">
                    </td>
                    <td>상품번호</td>
                    <td class="orderData"></td>
                </tr>
                <tr>
                    <td>상품명</td>
                    <td class="orderData"></td>
                </tr>
                <tr>
                    <td>판매가격</td>
                    <td class="orderData"></td>
                </tr>
                <tr>
                    <td>수량</td>
                    <td class="orderData"></td>
                </tr>
                <tr>
                    <td>배송비</td>
                    <td class="orderData"></td>
                </tr>
                <tr>
                    <td>합계</td>
                    <td class="orderData"></td>
                </tr>
                <tr>
                    <td>주문자</td>
                    <td class="orderData"></td>
                </tr>
            </table>

            <h3>배송지 정보</h3>
            <table border="0">
                <tr>
                    <td>받는분</td>
                    <td class="orderData"></td>
                </tr>
                <tr>
                    <td>배송지</td>
                    <td class="orderData"></td>
                    <td class="orderData"></td>
                    <td class="orderData"></td>
                </tr>
            </table>
        </article>
    </section>
</div>
<%@ include file="_footer.jsp" %>
