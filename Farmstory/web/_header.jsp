<%@ page import="farmstory1.dto.UserDTO" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String success = request.getParameter("success");
    UserDTO sessUser = (UserDTO) session.getAttribute("sessUser");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리</title>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/>
    <link rel="stylesheet" href="/Farmstory_war_exploded/css/style.css"/>
    <link rel="stylesheet" href="/Farmstory_war_exploded/css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>    
    <script>
        $(function(){
            const success = <%= success %>;

            if(success == 100){
                alert('로그인에 실패 했습니다. 아이디, 비번을 다시 확인하시기 바랍니다.');
            }else if(success == 101){
                alert('로그인을 먼저 하셔야 합니다.');
            }

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
            <a href="/Farmstory_war_exploded" class="logo"><img src="/Farmstory_war_exploded/images/logo.png" alt="로고"/></a>
            <p>
                <a href="/Farmstory_war_exploded/index.jsp">HOME |</a>
                <% if(sessUser == null){ %>
                <a href="/Farmstory_war_exploded/user/login.jsp">로그인 |</a>
                <a href="/Farmstory_war_exploded/user/terms.jsp">회원가입 |</a>
                <% }else{ %>
                <a href="/Farmstory_war_exploded/user/logout.jsp">로그아웃 |</a>
                	<% if(!sessUser.getRole().equals("USER")){ %>
                	<a href="/Farmstory_war_exploded/admin/">관리자 |</a>
                	<% } %>
                <% } %>
                <a href="#">고객센터</a>
            </p>
            <img src="/Farmstory_war_exploded/images/head_txt_img.png" alt="3만원 이상 무료배송"/>
            
            <ul class="gnb">
                <li><a href="/Farmstory_war_exploded/introduction/hello.jsp">팜스토리소개</a></li>
                <li><a href="/Farmstory_war_exploded/market/list.jsp"><img src="/Farmstory_war_exploded/images/head_menu_badge.png" alt="30%"/>장보기</a></li>
                <li><a href="/Farmstory_war_exploded/board/list.jsp?group=Croptalk&cate=story">농작물이야기</a></li>
                <li><a href="/Farmstory_war_exploded/board/list.jsp?group=Event&cate=event">이벤트</a></li>
                <li><a href="/Farmstory_war_exploded/board/list.jsp?group=Community&cate=notice">커뮤니티</a></li>
            </ul>
        </header>
