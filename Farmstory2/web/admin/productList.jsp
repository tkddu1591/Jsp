<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="_header.jsp" %>
<script>
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
        document.getElementsByClassName('productDelete')[0].onclick = function (e) {
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
    <%@ include file="_aside.jsp" %>
    <section id="productList">
        <nav>
            <h3>상품목록</h3>
        </nav>

        <article>

            <table border="0">
                <tr>
                    <th><input type="checkbox" name="allSelect"/></th>
                    <th>사진</th>
                    <th>상품번호</th>
                    <th>상품명</th>
                    <th>구분</th>
                    <th>가격</th>
                    <th>재고</th>
                    <th>등록일</th>
                </tr>
                <form action="./productList.do" method="post" id="formCheck" onclick="checkClick(this)">
                    <c:forEach var="dto" items="${productDTOS}">
                        <tr>
                            <td><input type="checkbox" name="productNos" value="${dto.pNo}"/></td>
                            <td><img src="${'../thumb/'+=dto.thumb1}" class="thumb" alt="샘플1"></td>
                            <td>${dto.pNo}</td>
                            <td>${dto.pName}</td>
                            <c:choose>

                                <c:when test="${dto.type eq 1}">
                                    <td>과일</td>
                                </c:when>
                                <c:when test="${dto.type eq 2}">
                                    <td>야채</td>
                                </c:when>
                                <c:when test="${dto.type eq 3}">
                                    <td>곡물</td>
                                </c:when>

                            </c:choose>
                            <td>${dto.priceWithComma} 원</td>
                            <td>${dto.stock}</td>
                            <td>${dto.rDateYMD}</td>
                        </tr>
                    </c:forEach>
                </form>
            </table>

            <p>
                <a href="#" class="productDelete">선택삭제</a>
                <a href="productRegister.do" class="productRegister">상품등록</a>
            </p>

            <p class="paging">
                <c:if test="${pageGroupStart > 1}">
                    <a href="/Farmstory2_war_exploded/admin/productList.do?cate=3&pg=1" class="start">처음으로</a>
                    <a href="/Farmstory2_war_exploded/admin/productList.do?cate=3&pg=${pageGroupStart - 1}"
                       class="prev">이전</a>
                </c:if>
                <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
                    <a href="/Farmstory2_war_exploded/admin/productList.do?cate=3&pg=${i}&"
                       class="num ${currentPage == i?'on':'off'}">${i}</a>
                </c:forEach>
                <c:if test="${pageGroupEnd < lastPageNum}">
                    <a href="/Farmstory2_war_exploded/admin/productList.do?cate=3&pg=${pageGroupEnd + 1}"
                       class="next">다음</a>
                    <a href="/Farmstory2_war_exploded/admin/productList.do?cate=3&pg=${lastPageNum}" class="last">마지막</a>
                </c:if>
            </p>

        </article>


    </section>
</main>
<%@ include file="_footer.jsp" %>