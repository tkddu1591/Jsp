<%@ page import="farmstory1.dto.ProductDTO" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../_header.jsp" %>
<script src="../js/zipcode.js"></script>
<style>
    #sub > .market > .order > .info > img {
        float: left;
        width: 240px;
    }
</style>
<%
    if(sessUser == null){
        response.sendRedirect("/Farmstory_war_exploded/user/login.jsp?success=101");
        return;
    }

    String thumb2 = request.getParameter("thumb2");
    String pName = request.getParameter("pName");
    String pNo = request.getParameter("pNo");
    String price = request.getParameter("price");
    String delivery = request.getParameter("delivery");
    String count = request.getParameter("count");
    String total = request.getParameter("total");
    String finalPrice = request.getParameter("final");

%>
<script>
    $(function(){

        $('#btnBuy').click(function(e){
            e.preventDefault();
            $('#formOrder').submit();
        });

        $('#btnShopping').click(function(e){
            e.preventDefault();

            if(confirm("주문을 취소하시겠습니까?")){
                location.href='/Farmstory_war_exploded/market/view.jsp?pNo=<%=pNo%>.jsp';
            }
        });
    });
</script>
<div id="sub">
    <div><img src="../images/sub_top_tit2.png" alt="MARKET"></div>
    <section class="market">

        <%@include file="_aside.jsp" %>
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
                <img src="../thumb/<%=thumb2%>" alt="딸기 500g">

                <table border="0">
                    <tr>
                        <td>상품명</td>
                        <td><%=pName%></td>
                    </tr>
                    <tr>
                        <td>상품코드</td>
                        <td><%=pNo%></td>
                    </tr>
                    <tr>
                        <td>배송비</td>
                        <td class="delivery"><%=delivery%>원</td>
                    </tr>
                    <tr>
                        <td>판매가격</td>
                        <td><%=price%>원</td>
                    </tr>
                    <tr>
                        <td>구매수량</td>
                        <td class="count"><%=count%>개</td>
                    </tr>
                    <tr>
                        <td>합계</td>
                        <td class="total"><%=total%> 원</td>
                    </tr>
                </table>
            </div>
            <h3>주문정보 입력</h3>
            <div class="shipping">
                <form id="formOrder" action="/Farmstory_war_exploded/market/proc/orderProc.jsp" method="post">
                    <input type="hidden" name="orderProduct" value="<%= pNo %>"/>
                    <input type="hidden" name="orderCount" value="<%= count %>"/>
                    <input type="hidden" name="orderDelivery" value="<%= delivery %>"/>
                    <input type="hidden" name="orderPrice" value="<%= price %>"/>
                    <input type="hidden" name="orderTotal" value="<%= finalPrice %>"/>
                    <input type="hidden" name="orderUser" value="<%= sessUser.getUid() %>"/>

                    <table>
                        <tr>
                            <td>받는분</td>
                            <td><input type="text" name="receiver" value="<%= sessUser.getName() %>"></td>
                        </tr>
                        <tr>
                            <td>휴대폰</td>
                            <td><input type="text" name="hp" value="<%= sessUser.getHp() %>"></td>
                        </tr>
                        <tr>
                            <td>배송주소</td>
                            <td>
                                <input type="text" name="zip"  readonly value="<%= sessUser.getZip() %> "><button type="button" onclick="zipcode()" id="btnZip">우편번호 검색</button>
                                <input type="text" name="addr1" placeholder="기본주소 검색" value="<%= sessUser.getAddr1() %>">
                                <input type="text" name="addr2" placeholder="상세주소 입력" value="<%= sessUser.getAddr2() %>">
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