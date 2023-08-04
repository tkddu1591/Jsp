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
        <title>글수정</title>
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
            <section id="board" class="modify">
                <h3>글수정</h3>
                <article>
                    <form action="#">
                        <table>
                            <tr>
                                <td>제목</td>
                                <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td>
                                    <textarea name="content"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>첨부</td>
                                <td><input type="file" name="file"/></td>
                            </tr>
                        </table>
                        <div>
                            <a href="list.jsp" class="btnCancel">취소</a>
                            <input type="submit" class="btnWrite" value="수정완료">
                        </div>
                    </form>
                </article>
            </section>
            <footer>
                <div>
                    ⓒCopyeft by chhak.or.kr
                </div>
            </footer>
        </div>

    </body>
</html>