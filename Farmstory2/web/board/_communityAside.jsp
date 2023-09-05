<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-09-04
  Time: 오전 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="sub">
    <div><img src="../images/sub_top_tit5.png" alt="커뮤니티"></div>
    <%--<div><img src="../images/sub_top_tit(chaanel).png" alt="CROP TALK"></div>--%>
    <section class="community">
        <aside>
            <img src="../images/sub_aside_cate5_tit.png" alt="커뮤니티"/>

            <ul class="lnb">
                <li
                        class="${cate eq 'notice'? 'on':'off'}"><a
                        href="/Farmstory2_war_exploded/board/list.do?channel=community&cate=notice">공지사항</a></li>
                <li
                        class="${cate eq 'menu'? 'on':'off'}"><a
                        href="/Farmstory2_war_exploded/board/list.do?channel=community&cate=menu">오늘의식단</a></li>
                <li
                        class="${cate eq 'chef'? 'on':'off'}"><a
                        href="/Farmstory2_war_exploded/board/list.do?channel=community&cate=chef">나도요리사</a></li>
                <li
                        class="${cate eq 'qna'? 'on':'off'}"><a
                        href="/Farmstory2_war_exploded/board/list.do?channel=community&cate=qna">1:1고객문의</a></li>
                <li
                        class="${cate eq 'faq'? 'on':'off'}"><a
                        href="/Farmstory2_war_exploded/board/list.do?channel=community&cate=faq">자주묻는질문</a></li>
            </ul>

        </aside>
        <article>
            <nav>
                <img src="../images/sub_nav_tit_cate5_${cate}.png" alt="커뮤니티"/>
                <p>
                    HOME > 커뮤니티 >
                    <c:choose>
                        <c:when test="${cate eq 'notice'}"> <em>공지사항</em> </c:when>
                        <c:when test="${cate eq 'menu'}"> <em>오늘의식단</em> </c:when>
                        <c:when test="${cate eq 'chef'}"> <em>나도요리사</em> </c:when>
                        <c:when test="${cate eq 'qna'}"> <em>고객문의</em> </c:when>
                        <c:when test="${cate eq 'faq'}"> <em>자주묻는질문</em> </c:when>
                    </c:choose>
                </p>
            </nav>