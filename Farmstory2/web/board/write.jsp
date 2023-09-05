<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../_header.jsp" %>

<jsp:include page="./_${channel}Aside.jsp"/>

<section class="write">
    <h3>글쓰기</h3>
    <article>
        <form action="write.do" method="post" enctype="multipart/form-data">
            <input type="hidden" name="writer" value="${sessUser.uid}"/>
            <input type="hidden" name="channel" value="${channel}"/>
            <input type="hidden" name="cate" value="${cate}"/>
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" required placeholder="제목을 입력하세요."/></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content" required></textarea>
                    </td>
                </tr>
                <tr>
                    <td>첨부</td>
                    <td><input type="file" name="file"/></td>
                </tr>
            </table>
            <div>
                <a href="./list.do?channel=${channel}&cate=${cate}" class="btnCancel">취소</a>
                <input type="submit" class="btnWrite" value="작성완료">
            </div>
        </form>
    </article>
</section>
<!-- 내용 끝 -->
</article>
</section>
</div>
<%@ include file="../_footer.jsp" %>