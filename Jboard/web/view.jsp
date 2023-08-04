<%@ page import="kr.co.jboard.vo.UserVO" %><%--
Created by IntelliJ IDEA.
User: Java
Date: 2023-08-02
Time: 오전 9:09
To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    UserVO userVO= (UserVO) session.getAttribute("sessUser");
    if(userVO==null){
        response.sendRedirect("user/login.jsp?success=101");
        return;
    }
%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>글보기</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>

        <div id="wrapper">
            <header>
                <div>
                    <h3>Board System v1.0</h3>
                    <p>
                        <%=userVO.getNick()%> 님 반갑습니다.
                        <a href="user/login.jsp" class="logout">[로그아웃]</a>
                    </p>
                </div>
            </header>
            <section id="board" class="view">
                <h3>글보기</h3>
                <table>
                    <tr>
                        <td>제목</td>
                        <td><input type="text" name="title" value="제목입니다." readonly/></td>
                    </tr>
                    <tr>
                        <td>첨부파일</td>
                        <td>
                            <a href="#">2020년 상반기 매출자료.xls</a>
                            <span>7회 다운로드</span>
                        </td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td>
                            <textarea name="content" readonly>내용 샘플입니다.</textarea>
                        </td>
                    </tr>
                </table>
                <div>
                    <a href="#" class="btnDelete">삭제</a>
                    <a href="modify.jsp" class="btnModify">수정</a>
                    <a href="list.jsp" class="btnList">목록</a>
                </div>

                <!-- 댓글리스트 -->
                <section class="commentList">
                    <h3>댓글목록</h3>
                    <article class="comment">
                    <span>
                        <span>길동이</span>
                        <span>20-05-13</span>
                    </span>
                        <textarea name="comment" readonly>댓글 샘플입니다.</textarea>
                        <div>
                            <a href="#">삭제</a>
                            <a href="#">수정</a>
                        </div>
                    </article>
                    <p class="empty">
                        등록된 댓글이 없습니다.
                    </p>
                </section>

                <!-- 댓글입력폼 -->
                <section class="commentForm">
                    <h3>댓글쓰기</h3>
                    <form action="#">
                        <textarea name="comment"></textarea>
                        <div>
                            <a href="#" class="btnCancel">취소</a>
                            <input type="submit" class="btnWrite" value="작성완료"/>
                        </div>
                    </form>
                </section>

            </section>
            <footer>
                <div>
                    ⓒCopyleft by chhak.or.kr
                </div>
            </footer>
        </div>

    </body>
</html>