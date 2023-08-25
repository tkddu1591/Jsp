<%@ page import="farmstory1.dto.OrderDTO" %>
<%@ page import="farmstory1.dao.OrderDAO" %>
<%@ page import="farmstory1.dao.ProductDAO" %><%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-08-24
  Time: 오후 3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    OrderDTO dto = new OrderDTO();


    dto.setReceiver(request.getParameter("receiver"));
    dto.setHp(request.getParameter("hp"));
    dto.setZip(request.getParameter("zip"));
    dto.setAddr1(request.getParameter("addr1"));
    dto.setAddr2(request.getParameter("addr2"));
    dto.setOrderEtc(request.getParameter("etc"));
    dto.setOrderProduct(request.getParameter("orderProduct"));
    dto.setOrderDelivery(request.getParameter("orderDelivery"));
    dto.setOrderCount(request.getParameter("orderCount"));
    dto.setOrderPrice(request.getParameter("orderPrice"));
    dto.setOrderTotal(request.getParameter("orderTotal"));
    dto.setOrderUser(request.getParameter("orderUser"));

    ProductDAO productDAO = new ProductDAO();
    OrderDAO dao = new OrderDAO();
    dao.insertOrder(dto);
    productDAO.updateProductMinus(dto.getOrderCount(),dto.getOrderProduct());
    response.sendRedirect("/Farmstory_war_exploded/market/list.jsp");
%>
<%--
<input type="hidden" name="orderProduct" value="<%= pNo %>"/>
 <input type="hidden" name="orderCount" value="<%= count %>"/>
 <input type="hidden" name="orderDelivery" value="<%= delivery %>"/>
 <input type="hidden" name="orderPrice" value="<%= price %>"/>
 <input type="hidden" name="orderTotal" value="<%= finalPrice %>"/>
 <input type="hidden" name="orderUser" value="<%= sessUser.getUid() %>"/>
 <input type="hidden" name="orderProduct" value="<%= pNo %>"/>

<td><input type="text" name="receiver" value="<%= sessUser.getName() %>"></td>
<td><input type="text" name="hp" value="<%= sessUser.getHp() %>"></td>
    <input type="text" name="zip" readonly value="<%= sessUser.getZip() %>"><button id="btnZip">우편번호 검색</button>
    <input type="text" name="addr1" placeholder="기본주소 검색" value="<%= sessUser.getAddr1() %>">
    <input type="text" name="addr2" placeholder="상세주소 입력" value="<%= sessUser.getAddr2() %>">
    <textarea name="etc"></textarea>
--%>