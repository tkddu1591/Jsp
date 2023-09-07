<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="_header.jsp" %>
<main>
    <%@include file="_aside.jsp" %>
    <section class="adminIndex">
        <nav>
            <h3>관리자 메인</h3>
        </nav>

        <article>
            <h3>
                <a href="./productList.do?cate=1">상품현황</a>
                <a href="./productList.do?cate=1" class="more">+ 더보기</a>
            </h3>
            <table border="0">
                <tr>
                    <th>상품번호</th>
                    <th>상품명</th>
                    <th>구분</th>
                    <th>가격</th>
                    <th>재고</th>
                    <th>등록일</th>
                </tr>
                <c:forEach var="dto" items="${productDTOS}">
                    <tr>
                        <td>${dto.pNo}</td>
                        <td>${dto.pName}</td>
                        <td>${dto.type}</td>
                        <td>${dto.price}</td>
                        <td>${dto.stock}</td>
                        <td>${dto.rDateYMD}</td>
                    </tr>
                </c:forEach>
            </table>
        </article>

        <article>
            <h3>
                <a href="./orderList.do?cate=2">주문현황</a>
                <a href="./orderList.do?cate=2" class="more">+ 더보기</a>
            </h3>
            <table border="0">
                <tr>
                    <th>주문번호</th>
                    <th>상품명</th>
                    <th>판매가격</th>
                    <th>수량</th>
                    <th>배송비</th>
                    <th>합계</th>
                    <th>주문자</th>
                    <th>주문일</th>
                </tr>
                <c:forEach var="dto" items="${orderDTOS}">
                    <tr>
                        <td>${dto.orderNo}</td>
                        <td>${dto.orderProductName}</td>
                        <td>${dto.orderPrice}</td>
                        <td>${dto.orderCount}</td>
                        <td>${dto.orderDelivery}</td>
                        <td>${dto.orderTotal}</td>
                        <td>${dto.orderUser}</td>
                        <td>${dto.orderDateYMD}</td>
                    </tr>
                </c:forEach>
            </table>
        </article>
        <article>
            <h3>
                <a href="./userList.do?cate=3">회원현황</a>
                <a href="./userList.do?cate=3" class="more">+ 더보기</a>
            </h3>

            <table border="0">
                <tr>
                    <th>회원아이디</th>
                    <th>이름</th>
                    <th>닉네임</th>
                    <th>휴대폰</th>
                    <th>이메일</th>
                    <th>등급</th>
                    <th>회원가입일</th>
                </tr>

                <c:forEach var="dto" items="${userDTOS}">
                    <tr>
                        <td>${dto.uid}</td>
                        <td>${dto.name}</td>
                        <td>${dto.nick}</td>
                        <td>${dto.hp}</td>
                        <td>${dto.email}</td>
                        <td>2</td>
                        <td>${dto.regDateYMD}</td>
                    </tr>
                </c:forEach>
            </table>
        </article>
    </section>
</main>
<%@ include file="_footer.jsp" %>