<%@ page import="kr.co.jboard.vo.UserVO" %><%--
Created by IntelliJ IDEA.
User: Java
Date: 2023-08-02
Time: 오전 9:09
To change this template use File | Settings | File Templates.
--%>
<%--title, content, writer, regip, rdate 입력하기--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="_header.jsp" %>
<main>
<section id="board" class="write">
    <h3>글쓰기</h3>
    <article>
        <form action="writeProc.jsp">
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
                <input type="hidden" name=writer readonly value=<%=userVO.getUid()%>>
            </table>
            <div>
                <a href="list.jsp" class="btnCancel">취소</a>
                <input type="submit" class="btnWrite" value="작성완료">
            </div>
        </form>
    </article>
</section>
</main>
<%@ include file="_footer.jsp" %>