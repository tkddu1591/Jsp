<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-31
  Time: 오전 10:10
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<%
//JAVA JSON 데이터 생성
String jsonData="{\"uid\":\"a101\",\"name\":\"홍길동\",\"hp\":\"010-1234-1234\",\"age\":23}";
//JSON 출력
out.print(jsonData);
%>