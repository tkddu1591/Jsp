<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ include file="_header.jsp" %>
<main id="board">
    <section class="write">

        <form action="#">
            <table border="0">
                <caption>글쓰기</caption>
                <tr>
                    <th>제목</th>
                    <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea name="content"></textarea>
                    </td>
                </tr>
                <tr>
                    <th>파일</th>
                    <td>
                        <input type="file" name="file"/>
                    </td>
                </tr>
            </table>

            <div>
                <a href="list.do" class="btn btnCancel">취소</a>
                <input type="submit" value="작성완료" class="btn btnComplete"/>
            </div>
        </form>

    </section>
</main>

<%@ include file="_footer.jsp" %>