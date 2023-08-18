<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<div id="sub">
    <div><img src="../images/sub_top_tit2.png" alt="MARKET"></div>
    <section class="market">
        <aside>
            <img src="../images/sub_aside_cate2_tit.png" alt="장보기"/>

            <ul class="lnb">
                <li class="on"><a href="./list.jsp">장보기</a></li>
            </ul>
        </aside>
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
                <img src="../images/market_item_thumb.jpg" alt="딸기 500g">

                <table border="0">                            
                    <tr>
                        <td>상품명</td>
                        <td>딸기 500g</td>
                    </tr>
                    <tr>
                        <td>상품코드</td>
                        <td>01</td>
                    </tr>
                    <tr>
                        <td>배송비</td>
                        <td class="delivery">5,0000원</td>
                    </tr>
                    <tr>
                        <td>판매가격</td>
                        <td>4,000원</td>
                    </tr>
                    <tr>
                        <td>구매수량</td>
                        <td class="count">1개</td>
                    </tr>
                    <tr>
                        <td>합계</td>
                        <td class="total">4,000원</td>
                    </tr>
                </table>
            </div>
            <h3>주문정보 입력</h3>
            <div class="shipping">
                <table>
                    <tr>
                        <td>받는분</td>
                        <td><input type="text" name="receiver"></td>
                    </tr>
                    <tr>
                        <td>휴대폰</td>
                        <td><input type="text" name="hp"></td>
                    </tr>
                    <tr>
                        <td>배송주소</td>
                        <td>
                            <input type="text" name="zip" readonly><button id="btnZip">우편번호 검색</button>
                            <input type="text" name="addr1" placeholder="기본주소 검색">
                            <input type="text" name="addr2" placeholder="상세주소 입력">
                        </td>
                    </tr>
                    <tr>
                        <td>기타</td>
                        <td>
                            <textarea name="etc"></textarea>
                        </td>
                    </tr>
                </table>
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