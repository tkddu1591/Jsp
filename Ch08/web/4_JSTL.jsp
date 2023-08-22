<%--
  Created by IntelliJ IDEA.
  User: java
  Date: 2023-08-22
  Time: 오전 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
    <head>
        <title>4_JSTL</title>
    </head>
    <body>
        <h3>4.JSTL</h3>

        <h4>스크립트릿</h4>

        <%
            //변수선언
            String str = "hello";
            out.print("<p>str : " + str + "</p>");
            int num1 = 1;
            int num2 = 2;
            int num3 = 3;

            //조건문
            
            
            //반복문
            
            for(int i =1 ; i<5; i++){
                out.print(i);
            }
            
            //자주 쓰는 문자열 처리

            String hello = "Hello Korea";
            out.print("<p 문자열 길이: "+hello.length()+"</p>");
            out.print("<p 문자열 자르기: "+hello.substring(6,10)+"</p>");
            out.print("<p 문자열 교체: "+hello.replace("Korea","Busan")+"</p>");
            out.print("<p 문자열 인텍스: "+hello.indexOf("e")+"</p>");

        %>

        <h4>JSTL</h4>
        <%--변수선언--%>
        <c:set var="str" value="hello"></c:set>
        <p>str:${str}</p>
        
        <c:set value="1" var="num1"></c:set>
        <c:set value="2" var="num2"></c:set>
        <c:set value="3" var="num3"></c:set>
        <%--조건문--%>
        <c:if test="${num1 lt num2}" >num1이 num2보다 작다.</c:if>
        
        <c:choose>
            <c:when test="${num1>num2}">num1이 num2보다 크다</c:when>
            <c:otherwise></c:otherwise>
        </c:choose>
        <%--반복문--%>
        <c:set var="set" value="0"></c:set>
        <c:forEach var="i" begin="1" end="10">
        
            <p>i:${sum=i+sum}</p>
        </c:forEach>

        <c:set var="persons">김유신,김춘추,장보고,강감찬,이순신</c:set>

        <c:forEach var="person" items="${persons}">
            <p>person : ${person}</p>
        </c:forEach>


        <%--자주 쓰는 문자열 처리--%>
        <c:set var="hello" value="Hello Korea"></c:set>
        <p>문자열 길이 : ${f:length(hello)}</p>
        <p>문자열 자르기 : ${f:substring(hello,6 ,11 )}</p>
        <p>문자열 교체 : ${f:replace(hello,"Korea","Busan")}</p>
        <p>문자열 인덱스 : ${f:indexOf(hello,"e" )}</p>

    </body>
</html>
