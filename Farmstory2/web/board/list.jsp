<%@ page import="kr.co.farmstory2.dto.ArticleDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../_header.jsp" %>

<jsp:include page="./_${channel}Aside.jsp"/>


<section class="list">
    <h3>글목록</h3>
    <article>
        <table border="0">
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>날짜</th>
                <th>조회</th>
            </tr>
            <c:forEach var="article" items="${articleDTOS}">
                <tr>
                    <td>${pageStartNum = pageStartNum - 1}</td>
                    <td><a href="./view.do?no=${article.no}&channel=${channel}&cate=${cate}">${article.title} [${article.comment}]</a></td>
                    <td>${article.nick}</td>
                    <td>${article.rDate}</td>
                    <td>${article.hit}</td>
                </tr>
            </c:forEach>

        </table>
    </article>

    <!-- 페이지 네비게이션 -->
    <div class="paging">
        <c:if test="${pageGroupStart > 1}">
            <a href="/Farmstory2_war_exploded/board/list.do?channel=${channel}&cate=${cate}&pg=1" class="start">처음으로</a>
            <a href="/Farmstory2_war_exploded/board/list.do?channel=${channel}&cate=${cate}&pg=${pageGroupStart - 1}" class="prev">이전</a>
        </c:if>
        <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
            <a href="/Farmstory2_war_exploded/board/list.do?channel=${channel}&cate=${cate}&pg=${i}&" class="num ${currentPage == i?'current':'off'}">${i}</a>
        </c:forEach>
        <c:if test="${pageGroupEnd < lastPageNum}">
            <a href="/Farmstory2_war_exploded/board/list.do?channel=${channel}&cate=${cate}&pg=${pageGroupEnd + 1}" class="next">다음</a>
            <a href="/Farmstory2_war_exploded/board/list.do?channel=${channel}&cate=${cate}&pg=${lastPageNum}" class="last">마지막</a>
        </c:if>
    </div>

    <!-- 글쓰기 버튼 -->
    <a href="write.do?channel=${channel}&cate=${cate}" class="btnWrite">글쓰기</a>
</section>
<!-- 내용 끝 -->

</article>
</section>
</div>

<%@ include file="../_footer.jsp" %>