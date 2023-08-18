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
    <style></style>
</head>

<body>
    <div id="container">
        <header>
            <a href="./index.html" class="logo"><img src="./images/admin_logo.jpg" alt="로고"/></a>
            <p>
                <a href="#">HOME |</a>
                <a href="#">로그아웃 |</a>
                <a href="#">고객센터</a>
            </p>
        </header>
        <main>
            <aside>
                <h3>주요기능</h3>
                <ul>
                    <li class="on"><a href="#">상품관리</a></li>
                    <li><a href="#">주문관리</a></li>
                    <li><a href="#">회원관리</a></li>                    
                </ul>
            </aside>
            <section id="productRegister">
                <nav>
                    <h3>상품등록</h3>
                </nav>

                <article>
                    <form action="#" method="post">
                        <table border="0">
                            <tr>
                                <td>상품명</td>
                                <td><input type="text" name="productName"/></td>
                            </tr>
                            <tr>
                                <td>구분</td>
                                <td>
                                    <select name="type">
                                        <option>구분</option>
                                        <option>과일</option>
                                        <option>야채</option>
                                        <option>곡류</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>가격</td>
                                <td><input type="text" name="price"/></td>
                            </tr>
                            <tr>
                                <td>배송비</td>
                                <td>
                                    <label><input type="radio" name="delivery">2,000원</label>                                    
                                    <label><input type="radio" name="delivery">3,000원</label>
                                    <label><input type="radio" name="delivery">5,000원</label>
                                    <label><input type="radio" name="delivery">무료</label>
                                </td>
                            </tr>
                            <tr>
                                <td>재고</td>
                                <td><input type="text" name="stock"/></td>
                            </tr>
                            <tr>
                                <td>상품이미지</td>
                                <td>
                                    <p>
                                        <span>상품목록 이미지(약 120 x 120)</span>
                                        <input type="file" name="thumb120"/>
                                    </p>
                                    <p>
                                        <span>기본정보 이미지(약 240 x 240)</span>
                                        <input type="file" name="thumb240"/>
                                    </p>
                                    <p>
                                        <span>상품설명 이미지(약 750 x Auto)</span>
                                        <input type="file" name="thumb750"/>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td>기타</td>
                                <td>
                                    <textarea name="etc"></textarea>
                                </td>
                            </tr>
                        </table>

                        <p>
                            <a href="./productList.html" class="btnCancel">취소</a>
                            <input type="submit" value="상품등록"/>
                        </p>
                    </form>
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