<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리</title>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <div id="container">
        <header>
            <a href="./index.html" class="logo"><img src="./images/admin_logo.jpg" alt="로고"/></a>
            <p>
                <a href="/">HOME |</a>
                <a href="#">로그아웃 |</a>
                <a href="#">고객센터</a>
            </p>
        </header>
        <main>
            <aside>
                <h3>주요기능</h3>
                <ul>
                    <li><a href="./productList.html">상품관리</a></li>
                    <li><a href="./orderList.html">주문관리</a></li>
                    <li><a href="./userList.html">회원관리</a></li>                    
                </ul>
            </aside>
            <section>
                <nav>
                    <h3>관리자 메인</h3>
                </nav>

                <article>
                    <h3>
                        <a href="#">상품현황</a>
                        <a href="#" class="more">+ 더보기</a>
                    </h3>
                    <table border="0">
                        <tr>
                            <th>상품번호</th>
                            <th>상품명</th>
                            <th>구분</th>
                            <th>가격</th>
                            <th>재고</th>
                            <th>등록일</th>
                        </tr>
                        <tr>
                            <td>1011</td>
                            <td>사과 500g</td>
                            <td>과일</td>
                            <td>4,000원</td>
                            <td>100</td>
                            <td>2023-01-01</td>
                        </tr>
                        <tr>
                            <td>1011</td>
                            <td>사과 500g</td>
                            <td>과일</td>
                            <td>4,000원</td>
                            <td>100</td>
                            <td>2023-01-01</td>
                        </tr>
                        <tr>
                            <td>1011</td>
                            <td>사과 500g</td>
                            <td>과일</td>
                            <td>4,000원</td>
                            <td>100</td>
                            <td>2023-01-01</td>
                        </tr>                        
                    </table>
                </article>

                <article>
                    <h3>
                        <a href="#">주문현황</a>
                        <a href="#" class="more">+ 더보기</a>
                    </h3>
                    <table border="0">
                        <tr>
                            <th>주문번호</th>
                            <th>상품명</th>
                            <th>판매가격</th>
                            <th>수량</th>
                            <th>배송비</th>
                            <th>합계</th>
                            <th>주문자</th>
                            <th>주문일</th>
                        </tr>
                        <tr>
                            <td>1011</td>
                            <td>사과 500g</td>
                            <td>4,000원</td>
                            <td>2개</td>
                            <td>3,000원</td>
                            <td>8,000원</td>
                            <td>홍길동</td>
                            <td>2023-01-01</td>
                        </tr>
                        <tr>
                            <td>1011</td>
                            <td>사과 500g</td>
                            <td>4,000원</td>
                            <td>2개</td>
                            <td>3,000원</td>
                            <td>8,000원</td>
                            <td>홍길동</td>
                            <td>2023-01-01</td>
                        </tr>
                        <tr>
                            <td>1011</td>
                            <td>사과 500g</td>
                            <td>4,000원</td>
                            <td>2개</td>
                            <td>3,000원</td>
                            <td>8,000원</td>
                            <td>홍길동</td>
                            <td>2023-01-01</td>
                        </tr>
                    </table>
                </article>
                <article>
                    <h3>
                        <a href="#">회원현황</a>
                        <a href="#" class="more">+ 더보기</a>
                    </h3>
                    <table border="0">
                        <tr>
                            <th>회원아이디</th>
                            <th>이름</th>
                            <th>닉네임</th>
                            <th>휴대폰</th>
                            <th>이메일</th>
                            <th>등급</th>
                            <th>회원가입일</th>
                        </tr>
                        <tr>
                            <td>a101</td>
                            <td>김유신</td>
                            <td>유신123</td>
                            <td>010-1234-1001</td>
                            <td>yusin123@naver.com</td>
                            <td>2</td>
                            <td>2023-01-01</td>
                        </tr>
                        <tr>
                            <td>a101</td>
                            <td>김유신</td>
                            <td>유신123</td>
                            <td>010-1234-1001</td>
                            <td>yusin123@naver.com</td>
                            <td>2</td>
                            <td>2023-01-01</td>
                        </tr>
                        <tr>
                            <td>a101</td>
                            <td>김유신</td>
                            <td>유신123</td>
                            <td>010-1234-1001</td>
                            <td>yusin123@naver.com</td>
                            <td>2</td>
                            <td>2023-01-01</td>
                        </tr>                        
                    </table>
                </article>
            </section>
        </main>
        <footer>            
            <p>                
                Copyright(C)Farmstory All rights reserved. FARMSTORY ADMINISTRATOR Version 1.0.1
            </p>
        </footer>
    </div>
    
</body>
</html>