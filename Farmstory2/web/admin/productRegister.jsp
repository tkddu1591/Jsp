<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="_header.jsp" %>
<main>
    <%@ include file="_aside.jsp" %>
    <section id="productRegister">
        <nav>
            <h3>상품등록</h3>
        </nav>

        <article>
            <form action="#" method="post">
                <table border="0">
                    <tr>
                        <td>상품명</td>
                        <td><input type="text" name="productName"/></td>
                    </tr>
                    <tr>
                        <td>구분</td>
                        <td>
                            <select name="type">
                                <option>구분</option>
                                <option>과일</option>
                                <option>야채</option>
                                <option>곡류</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>가격</td>
                        <td><input type="text" name="price"/></td>
                    </tr>
                    <tr>
                        <td>배송비</td>
                        <td>
                            <label><input type="radio" name="delivery">2,000원</label>
                            <label><input type="radio" name="delivery">3,000원</label>
                            <label><input type="radio" name="delivery">5,000원</label>
                            <label><input type="radio" name="delivery">무료</label>
                        </td>
                    </tr>
                    <tr>
                        <td>재고</td>
                        <td><input type="text" name="stock"/></td>
                    </tr>
                    <tr>
                        <td>상품이미지</td>
                        <td>
                            <p>
                                <span>상품목록 이미지(약 120 x 120)</span>
                                <input type="file" name="thumb120"/>
                            </p>
                            <p>
                                <span>기본정보 이미지(약 240 x 240)</span>
                                <input type="file" name="thumb240"/>
                            </p>
                            <p>
                                <span>상품설명 이미지(약 750 x Auto)</span>
                                <input type="file" name="thumb750"/>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>기타</td>
                        <td>
                            <textarea name="etc"></textarea>
                        </td>
                    </tr>
                </table>

                <p>
                    <a href="productList.jsp" class="btnCancel">취소</a>
                    <input type="submit" value="상품등록"/>
                </p>
            </form>
        </article>
    </section>
</main>
<%@ include file="_footer.jsp" %>