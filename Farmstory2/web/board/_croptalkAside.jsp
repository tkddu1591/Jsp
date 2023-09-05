<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-09-04
  Time: 오전 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="sub">
    <div><img src="../images/sub_top_tit3.png" alt=농작물이야기></div>
    <%--<div><img src="../images/sub_top_tit(chaanel).png" alt="CROP TALK"></div>--%>
    <section class="croptalk">
        <aside>
            <img src="../images/sub_aside_cate3_tit.png" alt="농작물이야기"/>

            <ul class="lnb">

                <li  class="${cate eq 'story'? 'on':'off'}"> <a
                        href="/Farmstory2_war_exploded/board/list.do?channel=croptalk&cate=story">농작물이야기</a></li>
                <li  class="${cate eq 'grow'? 'on':'off'}"> <a
                        href="/Farmstory2_war_exploded/board/list.do?channel=croptalk&cate=grow">텃밭가꾸기</a></li>
                <li  class="${cate eq 'school'? 'on':'off'}"><a
                        href="/Farmstory2_war_exploded/board/list.do?channel=croptalk&cate=school">귀농학교</a></li>
            </ul>

        </aside>
        <article>
            <nav>
                <img src="../images/sub_nav_tit_cate3_${cate}.png" alt="텃밭가꾸기"/>
                <p>
                    HOME > 농작물 이야기 >
                    <c:choose>
                        <c:when test="${cate eq 'story'}"> <em>농작물 이야기</em> </c:when>
                        <c:when test="${cate eq 'school'}"> <em>귀농학교</em> </c:when>
                        <c:when test="${cate eq 'grow'}"> <em>텃밭가꾸기</em> </c:when>
                    </c:choose>
                </p>
            </nav>