<%@ page import="kr.co.jboard.dto.UserDTO" %>
<%@ page import="kr.co.jboard.dao.ArticleDAO" %>
<%@ page import="kr.co.jboard.dto.ArticleDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Objects" %><%--
Created by IntelliJ IDEA.
User: Java
Date: 2023-08-02
Time: 오전 9:09
To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="_header.jsp" %>
<style>

</style>
<%
    int no = Integer.parseInt(request.getParameter("no"));
    ArticleDTO vo = ArticleDAO.getInstance().selectArticle(no);
    ArticleDAO.getInstance().updateArticleHit(no);
    List<ArticleDTO> dtos = ArticleDAO.getInstance().selectArticleComments(no);
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
    /*    $(function () {
            $('.comment>div>a:nth-of-type(1)').click(function () {
                let check = confirm('삭제하시겠습니까?')

                if (check === false) {
                    return false;
                }

            })
        })*/
    window.onload = function () {
        console.log("<%=vo.getWriter()%>")
        console.log("<%=userDTO.getUid()%>")
        const deleteBtn = document.querySelector("#board>div>a:nth-of-type(1)");
        const deleteComment = document.querySelector(".comment>div>a:nth-of-type(1)");
        const idCheck = function (e) {
            let check = confirm('삭제하시겠습니까?')
            if (check === false) {
                e.preventDefault();
            }
        };
        ['click'].forEach(event => deleteComment.addEventListener(event, idCheck));
        deleteBtn.addEventListener('click', idCheck)

    }
</script>
<main>
    <section id="board" class="view">
        <h3>글보기</h3>
        <table>
            <tr>
                <td>제목</td>
                <td><input type="text" name="title" value=<%=vo.getTitle()%> readonly/></td>
            </tr>
            <tr>
                <td>작성자</td>
                <td><input type="text" name="title" value=<%=vo.getNick()%> readonly/></td>
            </tr>
            <%
                if (vo.getFile() > 0) {
            %>
            <tr>
                <td>첨부파일</td>
                <td>
                    <a href="#">2020년 상반기 매출자료.xls</a>
                    <span>7회 다운로드</span>
                </td>
            </tr>
            <%
                }
            %>
            <tr>
                <td>내용</td>
                <td>
                    <textarea name="content" readonly><%=vo.getContent()%></textarea>
                </td>
            </tr>
        </table>
        <div>
            <%
                if (Objects.equals(userDTO.getUid(), vo.getWriter())) {
            %>
            <a href="proc/deleteProc.jsp?no=<%=vo.getNo()%>" class="btnDelete">삭제</a>
            <a href="modify.jsp?no=<%=vo.getNo()%>" class="btnModify">수정</a>
            <%
                }
            %>
            <a href="list.jsp" class="btnList">목록</a>
        </div>

        <!-- 댓글리스트 -->
        <section class="commentList">
            <h3>댓글목록</h3>
            <%
                for (ArticleDTO dto : dtos) {
            %>
            <article class="comment">
                    <span>
                        <span><%=dto.getNick()%></span>
                        <span><%=dto.getrDate()%></span>
                    </span>
                <textarea name="comment" readonly><%=dto.getContent()%></textarea>
                <%
                    if (Objects.equals(dto.getWriter(), userDTO.getUid())) {
                %>
                <div>
                    <a href="proc/contentDeleteProc.jsp?no=<%=dto.getNo()%>&parent=<%=dto.getParent()%>">삭제</a>
                    <a href="#">수정</a>
                </div>
                <%
                    }
                %>
            </article>
            <%
                }
            %>
            <%
                if (dtos.isEmpty()) {
            %>
            <p class="empty">
                등록된 댓글이 없습니다.
            </p>
            <%
                }
            %>
        </section>

        <!-- 댓글입력폼 -->
        <section class="commentForm">
            <h3>댓글쓰기</h3>
            <form action="proc/contentProc.jsp" method="post">
                <input type="hidden" name="writer" value=<%=userDTO.getUid()%>>
                <input type="hidden" name="parent" value=<%=no%>>
                <textarea name="content"></textarea>
                <div>
                    <a href="#" class="btnCancel">취소</a>
                    <input type="submit" class="btnWrite" value="작성완료"/>
                </div>
            </form>
        </section>

    </section>
</main>
<%@ include file="_footer.jsp" %>