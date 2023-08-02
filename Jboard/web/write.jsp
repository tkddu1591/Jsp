<%--
Created by IntelliJ IDEA.
User: Java
Date: 2023-08-02
Time: 오전 9:09
To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>글작성</title>
    </head>

    <link rel="stylesheet" href="css/style.css">


    </style>
    <body>
        <div id="wrapper">
            <header>
                <div>
                    <h3>Board System v1.0</h3>
                    <p>
                        OOO님 반갑습니다.
                        <a href="web/user/login.jsp" class="logout">[로그아웃]</a>
                    </p>
                </div>
            </header>
            <section id="board" class="write">
                <h3>글쓰기</h3>
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
                                    <textarea name="content" ></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>첨부</td>
                                <td><input type="file" name="file"/></td>
                            </tr>
                        </table>
                        <div>
                            <a href="list.jsp" class="btnCancel">취소</a>
                            <input type="submit" class="btnWrite" value="작성완료">
                        </div>
                    </form>
                </article>
            </section>
            <footer>
                <div>
                    ⓒCopyleft by chhak.or.kr
                </div>
            </footer>
        </div>
    </body>
</html>