<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="_header.jsp" %>
<%@ include file="_aside.jsp" %>

<section id="productList">
    <nav>
        <h3>상품목록</h3>
    </nav>

    <article>

        <table border="0">
            <tr>
                <th><input type="checkbox" name="all"/></th>
                <th>사진</th>
                <th>상품번호</th>
                <th>상품명</th>
                <th>구분</th>
                <th>가격</th>
                <th>재고</th>
                <th>등록일</th>
            </tr>
            <tr>
                <td><input type="checkbox" name=""/></td>
                <td><img src="./images/sample_item1.jpg" class="thumb" alt="샘플1"></td>
                <td>1011</td>
                <td>사과 500g</td>
                <td>과일</td>
                <td>4,000원</td>
                <td>100</td>
                <td>2023-01-01</td>
            </tr>
        </table>

        <p>
            <a href="#" class="productDelete">선택삭제</a>
            <a href="./productRegister.jsp" class="productRegister">상품등록</a>
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
<%@ include file="_asdieEnd.jsp" %>
<%@ include file="_footer.jsp" %>