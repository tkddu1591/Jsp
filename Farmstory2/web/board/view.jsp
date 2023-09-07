<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../_header.jsp" %>
<script>
    window.onload = function () {
        if (${sessUser.uid eq articleDTO.writer}) {


            const del = document.querySelector('.btnDelete');

            del.addEventListener('click', function (e) {
                let check = confirm('삭제하시겠습니까?')

                if (check === false) {
                    e.preventDefault();
                }
            })
        }

        const commentURL = "/Farmstory2_war_exploded/board/comment.do";
        const formComment = document.getElementById('formComment');
        const commentList = document.getElementsByClassName('commentList')[0];

        console.log(commentURL);
        console.log(formComment);
        console.log(commentList);

        ////////////////////////////////////////////////////////////////////////
        // 댓글입력(최신 Javascript(ES6) 문법 적용)
        ////////////////////////////////////////////////////////////////////////
        formComment.onsubmit = async (e) => {
            e.preventDefault();

            // 개별 데이터 취합
            const parent = formComment.parent.value;
            const writer = formComment.writer.value;
            const content = formComment.content.value;

            // 전송 데이터 생성(폼데이터)
            // 이건 왜 안될까요??? formData로 전송하고 싶음...
            /*
            const formData = new FormData();
            formData.append('parent', parent);
            formData.append('writer', writer);
            formData.append('content', content);
            */
            const paramsData = new URLSearchParams({
                'parent': parent,
                'writer': writer,
                'content': content
            });

            // 데이터 서버 전송
            const response = await fetch(commentURL, {
                method: 'POST',
                body: paramsData // <-- formData로 전송하고 싶은데 컨트롤러에서 수신(getParameter) 못함...
            });

            // 서버 응답 데이터 수신
            const data = await response.json();
            console.log('data : ' + JSON.stringify(data));

            if (data != null) {
                // 댓글목록 동적 처리
                let article = "<article>";
                article += "<span class='nick'>" + data.Nick + "</span>";
                article += "<span class='rDate'>" + data.rDate + "</span>";
                article += "<textarea readonly class='content' data-value='" + data.content + "'>" + data.content + "</textarea>";
                article += "<div>";
                article += "<a href='#' class='remove' data-no='" + data.no + "'>삭제 </a>";
                article += "<a href='#' class='cancel' data-no='" + data.no + "'>취소 </a>";
                article += "<a href='#' class='modify' data-no='" + data.no + "'>수정 </a>";
                article += "</div>";
                article += "</article>";

                commentList.insertAdjacentHTML('beforeend', article);
                alert('댓글이 등록 되었습니다.');

                $('.empty').text('');
                $('form > textarea[name=content]').val('');
            } else {
                alert('댓글이 등록이 실패 했습니다.');
            }
        }; // 댓글 입력 끝
        //댓글 쓰기 취소
        $('.btnCancel').click(function (e) {
            e.preventDefault();
            $('form > textarea[name=content]').val('');
        });
        ////////////////////////////////////////////////////////////////////////
        // 댓글삭제(동적 이벤트 바인딩 처리 -> 동적 생성되는 새로운 댓글목록 삭제링크가 동작함)
        ////////////////////////////////////////////////////////////////////////
        document.addEventListener('click', function (e) {
            if (e.target && e.target.classList.value === 'remove') {
                e.preventDefault();

                if (!confirm('정말 삭제 하시겠습니까?')) {
                    return;
                }

                const no = e.target.dataset['no'];
                //console.log('no : ' + no);

                const params = new URLSearchParams({
                    'type': 'REMOVE',
                    'no': no,
                    'parent': ${articleDTO.no},
                });

                fetch(commentURL + '?' + params, {
                    method: 'GET'
                })
                    .then(res => res.json())
                    .then(data => {
                        console.log('data : ' + data);

                        if (data.result > 0) {

                            alert('댓글을 삭제했습니다.');

                            // 댓글 동적 삭제
                            const article = e.target.parentNode.closest('article');
                            commentList.removeChild(article);

                            console.log($('.remove').length === 0)
                            if ($('.remove').length === 0) {
                                $('.empty').text('등록된 댓글이 없습니다.');
                            }
                        } else {
                            alert('댓글 삭제가 실패 했습니다.');
                        }
                    });
            }
        });

        ////////////////////////////////////////////////////////////////////////
        // 댓글수정(동적 이벤트 바인딩 처리 -> 동적 생성되는 새로운 댓글목록 삭제링크가 동작함)
        ////////////////////////////////////////////////////////////////////////
        document.addEventListener('click', async function (e) {

            const article = e.target.parentNode.closest('article');
            const textarea = article.getElementsByTagName('textarea')[0];
            const remove = article.getElementsByClassName('remove')[0];
            const cancel = article.getElementsByClassName('cancel')[0];
            const modify = article.getElementsByClassName('modify')[0];

            // 수정&수정완료
            if (e.target && e.target.classList.value === 'modify') {
                e.preventDefault();

                const txt = e.target.innerText;

                if (txt === '수정') {
                    // 수정모드
                    const value = textarea.value;
                    textarea.style.border = '1px solid #e4eaec';
                    textarea.style.background = '#fff';
                    textarea.readOnly = false;
                    textarea.focus();

                    remove.style.display = 'none';
                    cancel.style.display = 'inline';
                    modify.innerText = '수정완료';

                } else if (txt === '수정완료') {

                    const text = textarea.value;
                    if (text === '') {
                        alert('내용을 입력해 주세요')
                        return false;
                    }
                    else if (!confirm('정말 수정 하시겠습니까?')) {

                        return;
                    }

                    const no = e.target.dataset['no'];
                    const content = textarea.value;

                    const params = new URLSearchParams({
                        'type': 'MODIFY',
                        'no': no,
                        'content': content
                    });

                    // 데이터 서버 전송
                    const response = await fetch(commentURL + "?" + params, {
                        method: 'GET'
                    });

                    // 서버 응답 데이터 수신
                    const data = await response.json();
                    console.log('data : ' + JSON.stringify(data));

                    if (data.result > 0) {
                        alert('수정완료 했습니다.');

                        // 수정모드 해제
                        textarea.style.border = 'none';
                        textarea.style.background = 'none';
                        textarea.readOnly = true;

                        remove.style.display = 'inline';
                        cancel.style.display = 'none';
                        modify.innerText = '수정';

                    } else {
                        alert('수정실패 했습니다.');
                    }
                }
            }

            // 수정취소
            if (e.target && e.target.classList.value == 'cancel') {
                e.preventDefault();

                const value = textarea.dataset['value'];
                console.log('value : ' + value);

                // 수정모드 해제
                textarea.style.border = 'none';
                textarea.style.background = 'none';
                textarea.readOnly = true;
                textarea.value = value;

                remove.style.display = 'inline';
                cancel.style.display = 'none';
                modify.innerText = '수정';
            }
        });// 댓글수정 addEventListener end

    }
</script>
<jsp:include page="./_${channel}Aside.jsp"/>
<section class="view">
    <h3>글보기</h3>
    <table>
        <tr>
            <td>제목</td>
            <td><input type="text" name="title" value="${articleDTO.title}" readonly/></td>
        </tr>
        <tr>
            <td>글쓴이</td>
            <td><input type="text" name="title" value="${articleDTO.nick}" readonly/></td>
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
            <a href="./delete.do?&no=${articleDTO.no}&cate=${cate}&channel=${channel}" class="btnDelete">삭제</a>
            <a href="./modify.do?channel=${channel}&cate=${cate}&no=${articleDTO.no}" class="btnModify">수정</a>
            <a href="./list.do?channel=${channel}&cate=${cate}" class="btnList">목록</a>
        </c:if>
    </div>

    <!-- 댓글리스트 -->
    <section class="commentForm">
        <h3>댓글쓰기</h3>
        <form id="formComment" action="#" method="post">
            <input type="hidden" name="parent" value="${articleDTO.no}"/>
            <input type="hidden" name="writer" value="${sessUser.uid}"/>
            <textarea name="content" required></textarea>
            <div>
                <a href="#" class="btnCancel">취소</a>
                <input type="submit" id="btnComment" class="btnWrite" value="작성완료"/>
            </div>
        </form>
    </section>

    <!-- 댓글입력폼 -->
    <section class="commentList">
        <h3>댓글목록</h3>
        <c:forEach var="comment" items="${comments}">
            <article class="comment">
                <input type="hidden" name="no" value="">
                <input type="hidden" name="parent" value="">
                <span>${comment.nick}</span>
                <span>${comment.rDate}</span>
                <textarea readonly class="content" data-value="${comment.content}">${comment.content}</textarea>
                <c:if test="${comment.writer eq sessUser.uid}">
                    <div>
                        <a href="#" class="remove" data-no="${comment.no}">삭제</a>
                        <a href="#" class="cancel" data-no="${comment.no}">취소</a>
                        <!-- style.css 858라인 display:none 처리 -->
                        <a href="#" class="modify" data-no="${comment.no}">수정</a>
                    </div>
                </c:if>
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