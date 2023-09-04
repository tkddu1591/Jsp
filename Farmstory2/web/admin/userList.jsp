<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="_header.jsp" %>
<main>
    <%@ include file="_aside.jsp"%>
    <section id="orderList">
        <nav>
            <h3>회원목록</h3>
        </nav>

        <article>

            <table border="0">
                <tr>
                    <th><input type="checkbox" name="all"/></th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>별명</th>
                    <th>이메일</th>
                    <th>휴대폰</th>
                    <th>등급</th>
                    <th>가입일</th>
                    <th>확인</th>
                </tr>
                <tr>
                    <td><input type="checkbox" name=""/></td>
                    <td>a101</td>
                    <td>김유신</td>
                    <td>유신101</td>
                    <td>yusin101@naver.com</td>
                    <td>010-1234-1001</td>
                    <td>
                        <select name="grade">
                            <option>1</option>
                            <option selected>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </td>
                    <td>2023-01-01 13:06:14</td>
                    <td><a href="#" class="showPopup">[상세확인]</a></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name=""/></td>
                    <td>a102</td>
                    <td>김춘추</td>
                    <td>춘추102</td>
                    <td>chunchu102@naver.com</td>
                    <td>010-1234-1002</td>
                    <td>
                        <select name="grade">
                            <option>1</option>
                            <option selected>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </td>
                    <td>2023-01-02 13:06:14</td>
                    <td><a href="#" class="showPopup">[상세확인]</a></td>
                </tr>
                <tr>
                    <td><input type="checkbox" name=""/></td>
                    <td>a103</td>
                    <td>장보고</td>
                    <td>보고103</td>
                    <td>bogo103@naver.com</td>
                    <td>010-1234-1003</td>
                    <td>
                        <select name="grade">
                            <option>1</option>
                            <option selected>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </td>
                    <td>2023-01-03 13:06:14</td>
                    <td><a href="#" class="showPopup">[상세확인]</a></td>
                </tr>
            </table>

            <p>
                <a href="#" class="orderDelete">선택수정</a>
            </p>

            <p class="paging">
                <a href="#"><</a>
                <a href="#" class="on">[1]</a>
                <a href="#">[2]</a>
                <a href="#">[3]</a>
                <a href="#">[4]</a>
                <a href="#">[5]</a>
                <a href="#">></a>
            </p>
        </article>
    </section>
</main>
<div id="userPopup">
    <section>
        <nav>
            <h1>사용자 상세정보</h1>
            <button class="btnClose">닫기</button>
        </nav>

        <article>
            <h3>기본정보</h3>
            <table border="0">
                <tr>
                    <td>아이디</td>
                    <td>a101</td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td>김유신</td>
                </tr>
                <tr>
                    <td>별명</td>
                    <td>유신101</td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>yusin101@naver.com</td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td>010-1234-1001</td>
                </tr>
                <tr>
                    <td>등급</td>
                    <td>2등급(준회원)</td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>
                        <p>
                            부산광역시 부산진구 대연동 120
                        </p>
                        <p>
                            한빛빌딩 10층
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>아이피</td>
                    <td>192.168.10.112</td>
                </tr>
                <tr>
                    <td>회원가입일</td>
                    <td>2023-01-01 13:06:14</td>
                </tr>
            </table>
        </article>
    </section>
</div>
<%@ include file="_footer.jsp" %>