<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<div id="sub">
    <div><img src="../images/sub_top_tit3.png" alt="CROP TALK"></div>
    <section class="croptalk">
        <aside>
            <img src="../images/sub_aside_cate3_tit.png" alt="농작물이야기"/>

            <ul class="lnb">
                <li class="on"><a href="/Farmstory1/croptalk/story.jsp">농작물이야기</a></li>
                <li><a href="/Farmstory1/croptalk/grow.jsp">텃밭가꾸기</a></li>
                <li><a href="/Farmstory1/croptalk/school.jsp">귀농학교</a></li>
            </ul>

        </aside>
        <article>
            <nav>
                <img src="../images/sub_nav_tit_cate3_tit1.png" alt="농작물이야기"/>
                <p>
                    HOME > 농작물이야기 > <em>농작물이야기</em>
                </p>
            </nav>

            <!-- 내용 시작 -->
            
            <!-- 게시물 목록 -->
            <%-- 
            <section class="list">
		        <h3>글목록</h3>
		        <article>
		            <table border="0">
		                <tr>
		                    <th>번호</th>
		                    <th>제목</th>
		                    <th>글쓴이</th>
		                    <th>날짜</th>
		                    <th>조회</th>
		                </tr>
		                <tr>
		                    <td>1</td>
		                    <td><a href="#">제목입니다.</a>&nbsp;[3]</td>
		                    <td>별명</td>
		                    <td>23-08-17</td>
		                    <td>12</td>
		                </tr>
		            </table>
		        </article>
		
		        <!-- 페이지 네비게이션 -->
		        <div class="paging">
		            <a href="#" class="prev">이전</a>
		            <a href="#" class="num current">1</a>
		            <a href="#" class="next">다음</a>
		        </div>
		
		        <!-- 글쓰기 버튼 -->
		        <a href="#" class="btnWrite">글쓰기</a>
		    </section>
            --%>
            
            <section class="write">
		        <h3>글쓰기</h3>
		        <article>
		            <form action="#" method="post">
		            	<input type="hidden" name="writer" readonly value="">
		                <table>
		                    <tr>
		                        <td>제목</td>
		                        <td><input type="text" name="title" required placeholder="제목을 입력하세요."/></td>
		                    </tr>
		                    <tr>
		                        <td>내용</td>
		                        <td>
		                            <textarea name="content" required></textarea>                                
		                        </td>
		                    </tr>
		                    <tr>
		                        <td>첨부</td>
		                        <td><input type="file" name="file"/></td>
		                    </tr>
		                </table>
		                <div>
		                    <a href="#" class="btnCancel">취소</a>
		                    <input type="submit"  class="btnWrite" value="작성완료">
		                </div>
		            </form>
		        </article>
		    </section>

            <!-- 내용 끝 -->

        </article>
    </section>
</div>
<%@ include file="../_footer.jsp" %>