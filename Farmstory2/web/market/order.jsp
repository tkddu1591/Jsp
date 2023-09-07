<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../_header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/Farmstory2_war_exploded/js/zipCode.js"></script>
<style>

</style>
<script>
    $(function () {

        $('#btnBuy').click(function (e) {
            e.preventDefault();

            if (confirm("구매하시겠습니까?")) {
                $('#formOrder').submit();
            }
        });

        $('#btnShopping').click(function (e) {
            e.preventDefault();

            if (confirm("주문을 취소하시겠습니까?")) {
                location.href = '/Farmstory2_war_exploded/market/view.do?pNo=${productDTO.pNo}';
            }
        });
    });
</script>
<div id="sub">
    <div><img src="../images/sub_top_tit2.png" alt="MARKET"></div>
    <section class="market">
        <%@ include file="_aside.jsp" %>
        <article class="order">
            <nav>
                <img src="../images/sub_nav_tit_cate2_tit1.png" alt="장보기"/>
                <p>
                    HOME > 장보기 > <em>장보기</em>
                </p>
            </nav>

            <!-- 내용 시작 -->
            <h3>주문상품 확인</h3>
            <div class="info">
                <img src="../thumb/${productDTO.thumb2}" alt="${productDTO.pName}">

                <table border="0">
                    <tr>
                        <td>상품명</td>
                        <td>${productDTO.pName}</td>
                    </tr>
                    <tr>
                        <td>상품코드</td>
                        <td>${productDTO.pNo}</td>
                    </tr>
                    <tr>
                        <td>배송비</td>
                        <td class="delivery">${productDTO.deliveryWithComma eq '0' ? '무료':productDTO.deliveryWithComma+=' 원'}</td>
                    </tr>
                    <tr>
                        <td>판매가격</td>
                        <td>${productDTO.priceWithComma} 원</td>
                    </tr>
                    <tr>
                        <td>구매수량</td>
                        <td class="count">${productDTO.count} 개</td>
                    </tr>
                    <tr>
                        <td>합계</td>
                        <td class="total">${productDTO.finalPriceWithComma} 원</td>
                    </tr>
                </table>
            </div>
            <h3>주문정보 입력</h3>
            <div class="shipping">
                <form id="formOrder" action="/Farmstory2_war_exploded/market/order.do" method="post">
                    <input type="hidden" name="orderProduct" value="${productDTO.pNo}"/>
                    <input type="hidden" name="orderCount" value="${productDTO.count}"/>
                    <input type="hidden" name="orderDelivery" value="${productDTO.delivery}"/>
                    <input type="hidden" name="orderPrice" value="${productDTO.price}"/>
                    <input type="hidden" name="orderTotal" value="${productDTO.finalPrice}"/>
                    <input type="hidden" name="orderUser" value="${sessUser.uid}"/>
                    <input type="hidden" name="buy" value="real"/>

                    <table>
                        <tr>
                            <td>받는분</td>
                            <td><input type="text" name="receiver" value="${sessUser.name}"></td>
                        </tr>
                        <tr>
                            <td>휴대폰</td>
                            <td><input type="text" name="hp" value="${sessUser.hp}"></td>
                        </tr>
                        <tr>
                            <td>배송주소</td>
                            <td>
                                <input type="text" name="zip" readonly value="${sessUser.zip}">
                                <button type="button" onclick="zipcode()" id="btnZip">우편번호 검색</button>
                                <input type="text" name="addr1" placeholder="기본주소 검색" value="${sessUser.addr1}">
                                <input type="text" name="addr2" placeholder="상세주소 입력" value="${sessUser.addr2}">
                            </td>
                        </tr>
                        <tr>
                            <td>기타</td>
                            <td>
                                <textarea name="etc"></textarea>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <p>
                <a href="#" id="btnBuy"><img src="../images/market_btn_buy.gif" alt="구매하기"></a>
                <a href="#" id="btnShopping"><img src="../images/market_btn_shopping.gif"></a>
            </p>
            <!-- 내용 끝 -->

        </article>
    </section>

</div>

<%@ include file="../_footer.jsp" %>