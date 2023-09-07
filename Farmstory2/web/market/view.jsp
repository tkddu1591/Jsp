<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../_header.jsp" %>
<style>
    #sub > .market > .view > .basic > img {
        float: left;
        width: 240px;
        height: 240px;
    }

    #sub > .market > .view > .detail > img {
        width: 100%;
    }

</style>
<script>

    const price = ${productDTO.price};
    const delivery = ${productDTO.delivery};

    $(function () {

        $('input[name=count]').change(function () {

            let count = $(this).val();
            let total = price * count;
            let finalPrice = total + delivery;

            $('input[name=count]').val(count);
            $('input[name=total]').val(total);
            $('input[name=final]').val(finalPrice);

            $('.total').text(total.toLocaleString() + ' 원');

        });

        // 주문하기
        $('.btnOrder').click(function (e) {
            e.preventDefault();
            $('#formOrder').submit();
        });
    });
</script>
<div id="sub">
    <div><img src="../images/sub_top_tit2.png" alt="MARKET"></div>
    <section class="market">

        <%@ include file="_aside.jsp" %>
        <article class="view">
            <nav>
                <img src="../images/sub_nav_tit_cate2_tit1.png" alt="장보기"/>
                <p>
                    HOME > 장보기 > <em>장보기</em>
                </p>
            </nav>

            <!-- 내용 시작 -->
            <h3>기본정보</h3>
            <div class="basic">
                <img src="../thumb/${productDTO.thumb2}" alt="${productDTO.pName}">

                <table border="0">
                    <tr>
                        <td>상품명</td>
                        <td>${productDTO.pName}</td>
                    </tr>
                    <tr>
                        <td>상품코드</td>
                        <td>${productDTO.type}</td>
                    </tr>
                    <tr>
                        <td>배송비</td>
                        <td>
                            <span>${productDTO.deliveryWithComma ne '0' ? productDTO.deliveryWithComma+='원'+=' <em>3만원 이상 무료배송</em>': '무료' }</span>
                        </td>
                    </tr>
                    <tr>
                        <td>판매가격</td>
                        <td>${productDTO.priceWithComma}</td>
                    </tr>
                    <tr>
                        <td>구매수량</td>
                        <td>
                            <input type="number" name="count" min="1" value="1">
                        </td>
                    </tr>
                    <tr>
                        <td>합계</td>
                        <td class="total">${productDTO.priceWithComma} 원</td>
                    </tr>
                    <form id="formOrder" action="/Farmstory2_war_exploded/market/order.do" method="post">
                        <input type="hidden" name="thumb2" value="${productDTO.thumb2}">
                        <input type="hidden" name="pName" value="${productDTO.pName}">
                        <input type="hidden" name="pNo" value="${productDTO.pNo}">
                        <input type="hidden" name="delivery" value="${productDTO.delivery}">
                        <input type="hidden" name="price" value="${productDTO.price}">
                        <input type="hidden" name="count" value="1">
                        <input type="hidden" name="total" value="${productDTO.total}">
                        <input type="hidden" name="final" value="${productDTO.price + productDTO.delivery}">
                    </form>
                    <a href="#" class="btnOrder">
                        <img src="../images/market_btn_order.gif" alt="바로 구매하기"/>
                    </a>

                </table>
            </div>
            <h3>상품설명</h3>
            <div class="detail">
                <img src="../thumb/${productDTO.thumb3}" alt="">
            </div>

            <h3>배송정보</h3>
            <div class="delivery">
                <p>
                    입금하신 이후 택배송장번호는 SMS(문자서비스)를 통해 고객님께 안내해드립니다.
                </p>
            </div>

            <h3>교환/반품</h3>
            <div class="exchange">
                <table border="0">
                    <tr>
                        <td>교환 반품이 가능한 경우</td>
                        <td>
                            <ul>
                                <li>팜스토리 상품에 하자가 있거나 불량인 경우</li>
                                <li>채소, 과일, 양곡등의 식품은 만1일 이내</li>
                                <li>기타 상품은 수령일로부터 영업일 기준 일주일 이내</li>
                                <li>받으신 상품이 표시사항과 다른 경우에는 받으신 날로부터 일주일 이내</li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <td>교환 반품이 불가능한 경우</td>
                        <td>
                            <ul>
                                <li>신선 식품의 경우 단순히 마음에 들지 않는 경우</li>
                                <li>단순 변심으로 상품이 가치가 훼손돼서 판매가 어려운 경우</li>
                            </ul>
                        </td>
                    </tr>
                </table>
            </div>
            <!-- 내용 끝 -->
        </article>
    </section>

</div>

<%@ include file="../_footer.jsp" %>