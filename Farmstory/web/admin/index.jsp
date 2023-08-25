<%@ page import="farmstory1.dto.ProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="farmstory1.dto.OrderDTO" %>
<%@ page import="farmstory1.dao.ProductDAO" %>
<%@ page import="farmstory1.dao.OrderDAO" %>
<%@ page import="farmstory1.dao.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="_header.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");

    List<ProductDTO> productList = new ArrayList<ProductDTO>();
    List<OrderDTO> orderList = new ArrayList<OrderDTO>();
    List<UserDTO> userList = new ArrayList<UserDTO>();

    ProductDAO productDAO = new ProductDAO();
    OrderDAO orderDAO = new OrderDAO();
    UserDAO userDAO = UserDAO.getInstance();

    productList = productDAO.selectProductsAll(0);
    orderList = orderDAO.selectOrdersDesc(0);
    userList = userDAO.selectUsersDesc(0);

%>
<%@include file="_aside.jsp" %>
<section>
    <nav>
        <h3>관리자 메인</h3>
    </nav>

    <article>
        <h3>
            <a href="#">상품현황</a>
            <a href="./productList.jsp" class="more">+ 더보기</a>
        </h3>
        <table border="0">
            <tr>
                <th>상품번호</th>
                <th>상품명</th>
                <th>구분</th>
                <th>가격</th>
                <th>재고</th>
                <th>등록일</th>
            </tr>
            <%
                int count = 0;
                for (ProductDTO product : productList) {
                    count++;
            %>
            <tr>
                <td><%=product.getpNo()%></td>
                <td><%=product.getpName()%></td>
                <td><%switch (product.getType()) {
                    case 1:
                        System.out.println("과일");
                        break;
                    case 2:
                        System.out.println("야채");
                        break;
                    case 3:
                        System.out.println("곡물");
                        break;

                }%></td>
                <td><%=product.getPriceWithComma()%>원</td>
                <td><%=product.getStock()%></td>
                <td><%=product.getrDate()%></td>
            </tr>
            <%
                    if (count > 2 ) {break;}
                }
            %>
        </table>
    </article>

    <article>
        <h3>
            <a href="#">주문현황</a>
            <a href="#" class="more">+ 더보기</a>
        </h3>
        <table border="0">
            <tr>
                <th>주문번호</th>
                <th>상품명</th>
                <th>가격</th>
                <th>수량</th>
                <th>배송비</th>
                <th>총액</th>
                <th>회원</th>
                <th>주문일</th>
            </tr>
            <%
                count = 0;
                for (OrderDTO product : orderList) {
                    count++;
            %>
            <tr>
                <td><%=product.getOrderNo()%></td>
                <td><%=product.getProductName()%></td>
                <td><%=product.getOrderPriceWithComma()%>원</td>
                <td><%=product.getOrderCount()%>개</td>
                <td><%=product.getOrderDeliveryWithComma()%>원</td>
                <td><%=product.getOrderTotalWithComma()%>원</td>
                <td><%=product.getOrderUser()%></td>
                <td><%=product.getOrderDate()%></td>

            </tr>
            <%
                    if (count > 2 ) {break;}
                }
            %>
        </table>
    </article>
    <article>
        <h3>
            <a href="#">회원현황</a>
            <a href="#" class="more">+ 더보기</a>
        </h3>
        <table border="0">
            <tr>
                <th>회원아이디</th>
                <th>이름</th>
                <th>닉네임</th>
                <th>휴대폰</th>
                <th>이메일</th>
                <th>등급</th>
                <th>회원가입일</th>
            </tr>
            <%
                count = 0;
                for (UserDTO product: userList ) {
                    count++;
            %>
            <tr>
                <td><%=product.getUid()%></td>
                <td><%=product.getName()%></td>
                <td><%=product.getNick()%></td>
                <td><%=product.getHp()%></td>
                <td><%=product.getEmail()%></td>
                <td><%=product.()%></td>
                <td><%=product.getRegDate()%></td>

            </tr>
            <%
                    if (count > 2 ) {break;}
                }
            %>
        </table>
    </article>
</section>
<%@ include file="_asdieEnd.jsp" %>
<%@ include file="_footer.jsp" %>