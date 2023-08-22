<%@ page import="farmstory1.dto.ProductDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="farmstory1.dao.ProductDAO" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="_header.jsp" %>
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
<%@ include file="_aside.jsp" %>

<section id="productList">
    <nav>
        <h3>상품목록</h3>
    </nav>

    <article>

        <table border=0>
            <tr>
                <th><input type="checkbox" name="all"/></th>
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
                <td><input type="checkbox" name=""/></td>
                <td><img src="../thumb/<%=dto.getThumb1()%>" class="thumb" alt="샘플1"></td>
                <td><%=dto.getpNo()%></td>
                <td><%=dto.getpName()%></td>
                <td>
                    <%
                        switch (dto.getType()) {
                            case 1: out.print("과일"); break;
                            case 2: out.print("야채"); break;
                            case 3: out.print("곡물"); break;
                        }
                    %>
                </td>
                <td><%=dto.getPriceWithComma()%>원</td>
                <td><%=dto.getStock()%></td>
                <td><%=dto.getrDate()%></td>
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
            <a href="#"><</a>
            <a href="#" class="on">[1]</a>
            <a href="#">[2]</a>
            <a href="#">[3]</a>
            <a href="#">[4]</a>
            <a href="#">[5]</a>
            <a href="#">></a>
        </p>

    </article>


</section>
<%@ include file="_asdieEnd.jsp" %>
<%@ include file="_footer.jsp" %>