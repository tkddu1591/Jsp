<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-26
  Time: 오전 11:20
  To change this template use File | Settings | File Templates.

  include 지시자
   - 일반적으로 UI모듈, 공통 전역 파일을 삽입할 때 사용하는 ㅣㅈ시자
   - 정적타임에 삽입
  include 태그
   - UI모듈 위주로 삽입하는
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>include 액션태그</title>
    </head>
    <body>
        <h4>include 지시자</h4>
        <%@include file="inc/_header.html" %>
        <%@include file="inc/_footer.html" %>
        <%@include file="inc/_conpig.jsp" %>
        <p>
            num1 : <%=num1%><br>
            num2 : <%=num2%><br>
            num3 : <%=num3%><br>
        </p>


        <h4>include 태그</h4>
        <jsp:include page="inc/_header.html"></jsp:include>
        <jsp:include page="inc/_footer.html"></jsp:include>
        <jsp:include page="inc/_conpig2.jsp"></jsp:include>
        <%--
        <p>
            var1 : <%=var1%><br>
            var2 : <%=var2%><br>
            var3 : <%=var3%><br>
        </p>
        --%>
        <h4>include 메서드</h4>
        <%
            pageContext.include("inc/_header.html");
            pageContext.include("inc/_footer.html");
        %>

    </body>
</html>
