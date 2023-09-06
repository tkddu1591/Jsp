<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-09-04
  Time: 오전 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<aside>
    <h3>주요기능</h3>
    <ul>

        <li class="${cate eq 1? 'on':'off'}" ><a href="productList.do?cate=1">상품관리</a></li>
        <li class="${cate eq 2? 'on':'off'}" ><a href="orderList.do?cate=2">주문관리</a></li>
        <li class="${cate eq 3? 'on':'off'}" ><a href="userList.do?cate=3">회원관리</a></li>

    </ul>
</aside>
