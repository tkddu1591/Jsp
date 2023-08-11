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

    #board.view > .commentList > article textarea {
        width: 100%;
        height: 60px;
        padding: 6px;
        box-sizing: border-box;
        resize: none;
        border: 0;
        background: transparent;
    }

    #board.view > .commentList > article textarea.modi {
        border: 1px solid #bbb;
        background: white;
    }

    #board.view > .commentList > article div {
        text-align: right;
    }

    #board.view > .commentList > article div > .can {
        display: none;
    }

    #board.view > .commentList > table {

    }


    #board.view > .commentList > article > form > div {
        text-align: right;
    }

</style>
<%
    int no = Integer.parseInt(request.getParameter("no"));
    ArticleDTO vo = ArticleDAO.getInstance().selectArticle(no);
    List<ArticleDTO> dtos = ArticleDAO.getInstance().selectArticleComments(no);
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
    $(function () {
        $('.comment>div>a:nth-of-type(1)').click(function () {
            let check = confirm('삭제하시겠습니까?')

            if (check === false) {
                return false;
            }

        })
    })
    /*  window.onload = function () {
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

    }*/
</script>
<script>
    // 댓글 수정
    $(function () {
        let comment = '';
        // 댓글 수정
        $('.mod').click(function (e) {
            e.preventDefault();

            const txt = $(this).text();

            if (txt == '수정') {
                comment = $(this).parent().prev().val();
                $(this).parent().prev().addClass('modi');
                $(this).parent().prev().attr('readonly', false);
                $(this).parent().prev().focus();
                $(this).text('수정완료');
                $(this).prev().show();
            } else {
                // 수정완료 클릭
                // 수정 데이터 전송
                let check = confirm('수정하시겠습니까?')
                if (check === false) {

                    $(this).parent().prev().removeClass('modi');
                    $(this).parent().prev().attr('readonly', true);
                    $(this).text('수정');
                    $(this).prev().hide();
                    $(this).parent().prev().val(comment);
                    return false;
                }
                $(this).closest('form').submit();
                // 수정모드 해제
            }

            $('.can').click(function (e) {

                $(this).parent().prev().removeClass('modi');
                $(this).parent().prev().attr('readonly', true);
                $(this).hide();
                $(this).next().text('수정')
                $(this).parent().prev().val(comment);
                e.preventDefault();
            })

        })

        // 댓글쓰기 취소
        // Javascript 방식
        // jQuery 방식
        $('.btnCancel').click(function (e) {
            e.preventDefault();
            $('form > textarea[name=content]').val('');
        });

        /*    // jQuery 방식
            $('.btnCancel').click(function(e){
                e.preventDefault();
                $('form > textarea[name=content]').val('');
            });
    */


    })
    ;

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
                <form action="proc/contentUpdate.jsp" method="post">
                    <input type="hidden" name="no" value=<%=dto.getNo()%>>
                    <input type="hidden" name="parent" value=<%=vo.getNo()%>>
                    <span>
	                    <span><%= dto.getNick() %></span>
	                    <span><%= dto.getrDate() %></span>
	                </span>
                    <textarea name="comment" readonly><%= dto.getContent() %></textarea>

                    <% if (userDTO.getUid().equals(dto.getWriter())) { %>
                    <div>
                        <a href="proc/contentDeleteProc.jsp?no=<%= dto.getNo() %>&parent=<%= dto.getParent() %>"
                           class="del">삭제</a>
                        <a href="#" class="can">취소</a>
                        <a href="#" class="mod">수정</a>
                    </div>
                    <% } %>
                </form>
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