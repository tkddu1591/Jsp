<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../_header.jsp" %>
<style>
</style>
<div id="sub">
    <div><img src="../images/sub_top_tit2.png" alt="MARKET"></div>
    <section class="market">
        <%@ include file="_aside.jsp" %>
        <article class="list">
            <nav>
                <img src="../images/sub_nav_tit_cate2_tit1.png" alt="장보기"/>
                <p>
                    HOME > 장보기 > <em>장보기</em>
                </p>
            </nav>

            <!-- 내용 시작 -->
            <p class="sort">
                    <a href="./list.do" class="${type eq 0 ? 'on': 'off'}">전체${type eq 0 ? ('('+=total+=')'): ''} |</a>
                    <a href="./list.do?type=1" class="${type eq 1 ? 'on': 'off'}">과일${type eq 1 ? ('('+=total+=')'): ''} |</a>
                    <a href="./list.do?type=2" class="${type eq 2 ? 'on': 'off'}">야채${type eq 2 ? ('('+=total+=')'): ''} |</a>
                    <a href="./list.do?type=3" class="${type eq 3 ? 'on': 'off'}">곡류${type eq 3 ? ('('+=total+=')'): ''}</a>

            </p>
            <table border="0">
                <c:forEach items="${productDTOS}" var="productDTO">
                    <tr>
                        <td>
                            <a href="view.do?pNo=${productDTO.pNo}"><img src="../thumb/${productDTO.thumb1}" alt="${productDTO.pName}"
                                                    class="thumb1s"></a>
                        </td>

                        <td>
                            <c:choose>
                                <c:when test="${productDTO.type eq 1}">과일</c:when>
                                <c:when test="${productDTO.type eq 2}">야채</c:when>
                                <c:when test="${productDTO.type eq 3}">곡물</c:when>
                            </c:choose>
                        </td>
                        <td><a href="view.do?pNo=${productDTO.pNo}">${productDTO.pName}</a></td>
                        <td><strong>${productDTO.priceWithComma}</strong>원</td>
                    </tr>
                </c:forEach>
            </table>

            <!-- 페이지 네비게이션 -->
            <div class="paging">
                <c:if test="${pageGroupStart > 1}">
                    <a href="/Farmstory2_war_exploded/market/list.do?pg=1" class="start">처음으로</a>
                    <a href="/Farmstory2_war_exploded/market/list.do?pg=${pageGroupStart - 1}" class="prev">이전</a>
                </c:if>
                <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
                    <a href="/Farmstory2_war_exploded/market/list.do?pg=${i}&" class="num ${currentPage == i?'current':'off'}">${i}</a>
                </c:forEach>
                <c:if test="${pageGroupEnd < lastPageNum}">
                    <a href="/Farmstory2_war_exploded/market/list.do?pg=${pageGroupEnd + 1}" class="next">다음</a>
                    <a href="/Farmstory2_war_exploded/market/list.do?pg=${lastPageNum}" class="last">마지막</a>
                </c:if>
            </div>

            <!-- 내용 끝 -->

        </article>
    </section>

</div>

<%@ include file="../_footer.jsp" %>