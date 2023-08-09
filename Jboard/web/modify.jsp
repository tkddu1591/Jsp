<%@ page import="kr.co.jboard.dto.UserDTO" %>
<%@ page import="kr.co.jboard.dao.ArticleDAO" %>
<%@ page import="kr.co.jboard.dto.ArticleDTO" %>
<%@ page import="java.util.Objects" %>
<%@ page import="kr.co.jboard.dto.ArticleDTO" %><%--
Created by IntelliJ IDEA.
User: Java
Date: 2023-08-02
Time: 오전 9:09
To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="_header.jsp" %>
<%
    int no = Integer.parseInt(request.getParameter("no"));
    ArticleDTO vo = new ArticleDTO();
    vo = ArticleDAO.getInstance().selectArticle(no);
    if (!Objects.equals(vo.getWriter(), userDTO.getUid())){
        response.sendRedirect("list.jsp");
    }
%>
<main>
    <section id="board" class="modify">
        <h3>글수정</h3>
        <article>
            <form action="proc/modifyProc.jsp" method="post">
                <input type="hidden" name="no" value=<%=no%>>
                <table>
                    <tr>
                        <td>제목</td>
                        <td><input type="text" name="title" required value=<%=vo.getTitle()%>></td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td>
                            <textarea name="content" required><%=vo.getContent()%></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>첨부</td>
                        <td><input type="file" name="file"/></td>
                    </tr>
                </table>
                <div>
                    <a href="view.jsp?no=<%=vo.getNo()%>" class="btnCancel">취소</a>
                    <input type="submit" class="btnWrite" value="수정완료">
                </div>
            </form>
        </article>
    </section>
</main>
<%@ include file="_footer.jsp" %>