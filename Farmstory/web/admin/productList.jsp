<%@ page import="farmstory1.dto.ProductDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="farmstory1.dao.ProductDAO" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="_header.jsp" %>
<style>
    #productList .current {
        font-weight: bolder;
    }
</style>
<%
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
    int lastPageNum = 0;
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
        lastPageNum = (total / 10);
    } else {
        lastPageNum = (total / 10) + 1;
    }

    //페이지 그룹 계산
    pageGroupCurrent = (int) Math.ceil(currentPage / 10.0);
    pageGroupStart = (pageGroupCurrent - 1) * 10 + 1;
    pageGroupEnd = pageGroupCurrent * 10;

    //페이지 시작번호 계산
    pageStartNum = total - start;

    if (pageGroupEnd > lastPageNum) {
        pageGroupEnd = lastPageNum;
    }

    dtos = dao.selectProductsAll(start);

%>
<script>
    $(document).ready(function () {

        $('.allSelect').click(function () {
            if ($(this).is(':checked')) {
                $('input:checkbox').prop('checked',true);
            }
            else {
                $('input:checkbox').prop('checked',false);
            }
        })
        $('input:checkbox').click(function () {
            if ($(this).is(':checked')) {
                $(this).val(1);
                const type = $(this).val();
                alert(type)
            }
            else {
                $(this).val(0);
                const type = $(this).val();
                alert(type)
            }
        })
    });
</script>
<%@ include file="_aside.jsp" %>

<section id="productList">
    <nav>
        <h3>상품목록</h3>
    </nav>

    <article>

        <table border=0>
            <tr>
                <th><input type="checkbox" class="allSelect" name="all"/></th>
                <th>사진</th>
                <th>상품번호</th>
                <th>상품명</th>
                <th>구분</th>
                <th>가격</th>
                <th>재고</th>
                <th>등록일</th>
            </tr>
            <%
                for (ProductDTO dto : dtos) {
            %>

            <tr>
                <td><input type="checkbox" class="select" name=check /></td>
                <td><img src="../thumb/<%=dto.getThumb1()%>" class="thumb" alt="샘플1"></td>
                <td><%=dto.getpNo()%>
                </td>
                <td><%=dto.getpName()%>
                </td>
                <td>
                    <%
                        switch (dto.getType()) {
                            case 1:
                                out.print("과일");
                                break;
                            case 2:
                                out.print("야채");
                                break;
                            case 3:
                                out.print("곡물");
                                break;
                        }
                    %>
                </td>
                <td><%=dto.getPriceWithComma()%>원</td>
                <td><%=dto.getStock()%>
                </td>
                <td><%=dto.getrDate()%>
                </td>
            </tr>
            <%
                }
            %>
        </table>

        <p>
            <a href="#" class="productDelete">선택삭제</a>
            <a href="./productRegister.jsp" class="productRegister">상품등록</a>
        </p>

        <p class="paging">
            <% if (pageGroupStart > 1) { %>
            <a href="./productList.jsp?pg=<%= pageGroupStart - 1 %>" class="prev">이전</a>
            <% } %>

            <% for (int i = pageGroupStart; i <= pageGroupEnd; i++) { %>
            <a href="./productList.jsp?pg=<%= i %>" class="num <%= (currentPage == i)?"current":"" %>"><%= i %>
            </a>
            <% } %>

            <% if (pageGroupEnd < lastPageNum) { %>
            <a href="./productList.jsp?pg=<%= pageGroupEnd + 1 %>" class="next">다음</a>
            <% } %>
        </p>


    </article>


</section>
<%@ include file="_asdieEnd.jsp" %>
<%@ include file="_footer.jsp" %>