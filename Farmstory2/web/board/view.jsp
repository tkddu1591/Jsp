<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../_header.jsp" %>
<script>
    window.onload = function () {
        const del = document.querySelector('.btnDelete');

        del.addEventListener('click', function (e) {
            let check = confirm('삭제하시겠습니까?')

            if (check === false) {
                e.preventDefault();
            }
        })
    }
</script>
<jsp:include page="./_${channel}Aside.jsp"/>
<section class="view">
    <h3>글보기</h3>
    <table>
        <tr>
            <td>글쓴이</td>
            <td><input type="text" name="title" value="${articleDTO.writer}" readonly/></td>
        </tr>
        <tr>
            <td>제목</td>
            <td><input type="text" name="title" value="${articleDTO.title}" readonly/></td>
        </tr>
        <%--있을시--%>
        <c:if test="${not empty articleDTO.file}">
            <tr>
                <td>첨부파일</td>
                <td>
                        <a href="./fileDownload.do?fNo=${articleDTO.fNo}">${articleDTO.file}</a>
                        <span>[${articleDTO.download}회 다운로드]</span>
                </td>
            </tr>
        </c:if>
        <%--다운로드하기--%>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" readonly>${articleDTO.content}</textarea>
            </td>
        </tr>
    </table>
    <div>
        <c:if test="${articleDTO.writer eq sessUser.uid}">
            <a href="./delete.do?&no=${no}" class="btnDelete">삭제</a>
            <a href="./modify.do?channel=${channel}&cate=${cate}&no=${articleDTO.no}" class="btnModify">수정</a>
            <a href="./list.do?channel=${channel}&cate=${cate}" class="btnList">목록</a>
        </c:if>
    </div>

    <!-- 댓글리스트 -->
    <section class="commentForm">
        <h3>댓글쓰기</h3>
        <form action="./commentInsert.do" method="post">
            <input type="hidden" name="channel" value="${channel}"/>
            <input type="hidden" name="cate" value="${cate}"/>
            <input type="hidden" name="parent" value="${articleDTO.no}"/>
            <input type="hidden" name="writer" value="${sessUser.uid}"/>
            <textarea name="content"></textarea>
            <div>
                <a href="#" class="btnCancel">취소</a>
                <input type="submit" class="btnWrite" value="작성완료"/>
            </div>
        </form>
    </section>

    <!-- 댓글입력폼 -->
    <section class="commentList">
        <h3>댓글목록</h3>
        <c:forEach var="comment" items="${comments}">
            <article class="comment">
                <form action="#" method="post">
                    <input type="hidden" name="no" value="">
                    <input type="hidden" name="parent" value="">
                    <span>
                        <span>${comment.nick}</span>
                        <span>${comment.rDate}</span>
                    </span>
                    <textarea name="comment" readonly>${comment.content}</textarea>
                    <c:if test="${comment.writer eq sessUser.uid}">
                        <div>
                            <a href="#" class="del">삭제</a>
                            <a href="#" class="can">취소</a>
                            <a href="#" class="mod">수정</a>
                        </div>
                    </c:if>
                </form>
            </article>

        </c:forEach>
        <c:if test="${empty comments}">
            <p class="empty">등록된 댓글이 없습니다.</p>
        </c:if>
    </section>
</section>
<!-- 내용 끝 -->
</article>
</section>
</div>
<%@ include file="../_footer.jsp" %>