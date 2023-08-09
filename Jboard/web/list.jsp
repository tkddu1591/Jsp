<%@ page import="kr.co.jboard.dao.ArticleDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="kr.co.jboard.dto.ArticleDTO" %>
<%@ page import="kr.co.jboard.dto.ArticleDTO" %><%--Created by IntelliJ IDEA.
User: Java
Date: 2023-08-02
Time: 오전 9:09
To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="_header.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    String pg = request.getParameter("pg");

    //현재 페이지 관련 변수
    int start;
    int currentPage = 1;
    int total = 0;
    int lasPageNum = 0;
    int pageGroupCurrent = 1;
    int pageGroupStart = 1;
    int pageGroupEnd = 0;
    int pageStartNum = 0;


    //현재 페이지 계산
    if (pg != null) {
        currentPage = Integer.parseInt(pg);
    }
    //Limit 시작값 계산
    start = (currentPage - 1) * 10;

    //전체 게시물 개수 조회
    total = ArticleDAO.getInstance().selectArticleNo();

    //페이지 번호 계산
    if (total % 10 == 0) {
        lasPageNum = (total / 10);
    } else {
        lasPageNum = (total / 10) + 1;
    }

    //페이지 그룹 계산
    pageGroupCurrent = (int) Math.ceil(currentPage / 10.0);
    pageGroupStart = (pageGroupCurrent - 1) * 10 + 1;
    pageGroupEnd = pageGroupCurrent * 10;

    //페이지 시작번호 계산
    pageStartNum = total - start;

    if (pageGroupEnd > lasPageNum) {
        pageGroupEnd = lasPageNum;
    }

    //현재 페이지 게시물 조회
    List<ArticleDTO> vos = ArticleDAO.getInstance().selectsArticle(start);
%>
<script>
    console.log("<%=pageGroupCurrent%>")
</script>
<main>
    <section id="board" class="list">
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

                <%
                    for (ArticleDTO vo : vos) {
                %>
                <tr>
                    <td><%=pageStartNum-- %>
                    </td>
                    <td><a href="view.jsp?no=<%=vo.getNo()%>"><%=vo.getTitle()%>
                    </a> [<%=vo.getComment()%>]
                    </td>
                    <td><%=vo.getNick()%>
                    </td>
                    <td><%=vo.getrDate()%>
                    </td>
                    <td><%=vo.getHit()%>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
        </article>

        <!-- 페이지 네비게이션 -->
        <div class="paging">
            <%
                if (pageGroupStart > 1) {
            %>
            <a href="list.jsp?pg=<%=1%>" class="prev">처음으로</a>
            <a href="list.jsp?pg=<%=pageGroupStart-1%>" class="prev">이전</a>
            <%
                }
            %>
            <%
                for (int i = pageGroupStart; i <= pageGroupEnd; i++) {
            %>
            <a href="list.jsp?pg=<%=i%>" class="num <%=(currentPage==i)?"current":""%>"><%=i%>
            </a>
            <%
                }
            %>

            <%
                if (pageGroupEnd < lasPageNum) {
            %>
            <a href="list.jsp?pg=<%=pageGroupEnd+1%>" class="next">다음</a>
            <a href="list.jsp?pg=<%=lasPageNum%>" class="next">마지막</a>
            <%
                }
            %>
        </div>

        <!-- 글쓰기 버튼 -->
        <a href="write.jsp" class="btnWrite">글쓰기</a>

    </section>
</main>
<%@ include file="_footer.jsp" %>