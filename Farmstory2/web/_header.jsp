<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-09-04
  Time: 오전 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>팜스토리</title>
        <link rel="stylesheet"
              href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/>
        <link rel="stylesheet" href="/Farmstory2_war_exploded/css/style.css"/>
        <link rel="stylesheet" href="/Farmstory2_war_exploded/user/css/style.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
        <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
        <script>
            $(function () {
                $('.slider > ul').bxSlider({
                    slideWidth: 980,
                    pager: false,
                    controls: false,
                    auto: true
                });

                $('#tabs').tabs();
            });
        </script>

    </head>
    <body>
        <div id="container">
            <header>
                <a href="/Farmstory2_war_exploded/index.do" class="logo"><img
                        src="/Farmstory2_war_exploded/images/logo.png" alt="로고"/></a>
                <p>
                    <c:if test="${sessUser.role eq 'USER'}">
                        회원 ${sessUser.nick} |
                    </c:if>
                    <c:if test="${sessUser.role eq 'ADMIN'}">
                        관리자 ${sessUser.nick} |
                    </c:if>
                    <a href="#">HOME |</a>
                    <c:if test="${sessUser.nick eq null}">
                        <a href="/Farmstory2_war_exploded/user/login.do">로그인 |</a>
                        <a href="/Farmstory2_war_exploded/user/terms.do">회원가입 |</a>
                    </c:if>
                    <c:if test="${sessUser.nick ne null}">
                        <a href="/Farmstory2_war_exploded/user/logout.do">로그아웃 |</a>
                    </c:if>
                    <c:if test="${sessUser.role eq 'ADMIN'}">
                        <a href="/Farmstory2_war_exploded/admin/index.do">관리페이지 |</a>
                    </c:if>
                    <a href="#">고객센터</a>
                </p>
                <img src="/Farmstory2_war_exploded/images/head_txt_img.png" alt="3만원 이상 무료배송"/>

                <ul class="gnb">
                    <li><a href="/Farmstory2_war_exploded/introduction/hello.do">팜스토리소개</a></li>
                    <li><a href="/Farmstory2_war_exploded/market/list.do"><img
                            src="/Farmstory2_war_exploded/images/head_menu_badge.png" alt="30%"/>장보기</a></li>
                    <li><a href="/Farmstory2_war_exploded/board/list.do?channel=0&cate=0">농작물이야기</a></li>
                    <li><a href="/Farmstory2_war_exploded/board/list.do?channel=1&cate=0">이벤트</a></li>
                    <li><a href="/Farmstory2_war_exploded/board/list.do?channel=2&cate=0">커뮤니티</a></li>
                </ul>
            </header>
