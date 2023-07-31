<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-31
  Time: 오전 10:06
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>3.AJAX</title>
        <script>

            window.onload = function () {
                const bt1 = document.getElementById('btn1');

                const spans = document.getElementsByTagName('span');


                bt1.addEventListener('click', function () {
                    const xhr = new XMLHttpRequest();
                    xhr.open('GET', 'data/json1.jsp');
                    xhr.send();
                    xhr.onreadystatechange = function () {

                        if (xhr.readyState === XMLHttpRequest.DONE) {
                            if (xhr.status === 200) {
                                const data = JSON.parse(xhr.response);
                                console.log(data)

                                spans[0].innerText = data.uid;
                                spans[1].innerText = data.name;
                                spans[2].innerText = data.hp;
                                spans[3].innerText = data.age;
                            }
                        }

                    }
                })

                const bt2 = document.getElementById('btn2');


                bt2.addEventListener('click', function () {

                    fetch('data/json2.jsp')
                        .then((response) => {
                            console.log(response)
                            return response.json();
                        })
                        .then((data) => {
                            console.log(data);
                            const table = document.getElementsByTagName('table')[0];
                            for (let us of data) {
                                const tr = document.createElement('tr');
                                const td1 = document.createElement('td');
                                const td2 = document.createElement('td');
                                const td3 = document.createElement('td');
                                const td4 = document.createElement('td');
                                td1.innerText = us.uid;
                                td2.innerText = us.name;
                                td3.innerText = us.hp;
                                td4.innerText = us.age;

                                tr.appendChild(td1);
                                tr.appendChild(td2);
                                tr.appendChild(td3);
                                tr.appendChild(td4);

                                table.appendChild(tr);
                            }

                        })
                        .catch(() =>
                            console.log('요청실패...'))

                })
            }

        </script>
    </head>
    <body>
        <h3>AJAX</h3>

        <h4>JSON/XML 실습</h4>
        <a href="data/json1.jsp">json1</a><br>
        <a href="data/json2.jsp">json2</a><br>
        <a href="data/xml1.jsp">xml1</a><br>
        <a href="data/xml2.jsp">xml2</a><br><br>

        <h3>AJAX 실습</h3>
        <button id="btn1">데이터 요청</button>
        <p>
            아이디 : <span></span><br>
            이름 : <span></span><br>
            휴대폰 : <span></span><br>
            나이 : <span></span><br>
        </p>
        <button id="btn2">데이터2 요청</button>
        <table border="1">
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>휴대폰</th>
                <th>나이</th>
            </tr>
        </table>
    </body>
</html>
