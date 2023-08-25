<%@ page import="farmstory1.dto.ProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="farmstory1.dao.ProductDAO" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../_header.jsp" %>
<%
    /*

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
        List<ArticleDTO> vos = ArticleDAO.getInstance().selectsArticle(start);*/

    //시작
    request.setCharacterEncoding("UTF-8");
    String type = request.getParameter("type");

    String pg = request.getParameter("pg");
    if (type == null) {
        type = "0";
    }
    List<ProductDTO> dtos = new ArrayList<>();
    ProductDAO dao = new ProductDAO();

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

    //Totla 계산 (타입에 따라 다름)
    total = dao.selectProductsTypeTotal(Integer.parseInt(type));

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

    if (Integer.parseInt(type) == 0) {
        dtos = dao.selectProductsAll(start);
    } else {
        dtos = dao.selectProductsType(Integer.parseInt(type), start);
    }

%>
<style>
    #sub > .market > .list .thumb1s{
        width: 100%  ;
    }
</style>
<div id="sub">
    <div><img src="../images/sub_top_tit2.png" alt="MARKET"></div>
    <section class="market">

        <%@include file="_aside.jsp" %>
        <article class="list">
            <nav>
                <img src="../images/sub_nav_tit_cate2_tit1.png" alt="장보기"/>
                <p>
                    HOME > 장보기 > <em>장보기</em>
                </p>
            </nav>

            <!-- 내용 시작 -->
            <p class="sort">
                <a href="./list.jsp"
                   class=<%=type.equals("0") ? "on" : ""%>>전체<%= type.equals("0") ? "(" + total + ")" : ""%> |</a>
                <a href="./list.jsp?type=1"
                   class=<%=type.equals("1") ? "on" : ""%>>과일<%= type.equals("1") ? "(" + total + ")" : ""%> |</a>
                <a href="./list.jsp?type=2"
                   class=<%=type.equals("2") ? "on" : ""%>>야채<%= type.equals("2") ? "(" + total + ")" : ""%> |</a>
                <a href="./list.jsp?type=3"
                   class=<%=type.equals("3") ? "on" : ""%>>곡물<%= type.equals("3") ? "(" + total + ")" : ""%>
                </a>
            </p>
            <table border="0">

                <%
                    for (ProductDTO dto : dtos) {
                %>
                <%
                    if (dto.getType() == Integer.parseInt(type) || 0 == Integer.parseInt(type)) {
                %>
                <tr>
                    <td>
                        <a href="./view.jsp?pNo=<%=dto.getpNo()%>"><img class="thumb1s"  src="../thumb/<%=dto.getThumb1()%>" alt=<%=dto.getpName()%> ></a>
                    </td>
                    <td>
                        <%
                            switch (dto.getType()) {
                                case 1: out.print("과일"); break;
                                case 2: out.print("야채"); break;
                                case 3: out.print("곡물"); break;
                            }
                        %>
                    </td>
                    <td><a href="./view.jsp?pNo=<%=dto.getpNo()%>"><%=dto.getpName()%>
                    </a></td>
                    <td><strong><%=dto.getPriceWithComma()%>
                    </strong>원
                    </td>
                </tr>
                <%
                    }
                %>
                <%
                    }
                %>
            </table>

            <p class="paging">
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
            </p>

            <!-- 내용 끝 -->

        </article>
    </section>
</div>
<%@ include file="../_footer.jsp" %>