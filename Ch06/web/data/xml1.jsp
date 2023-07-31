<%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-31
  Time: 오전 10:41
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/xml;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    //XML 생성
    String xmldata = "<user>";
    xmldata += "<uid>a101</uid>";
    xmldata += "<name>a101</name>";
    xmldata += "<hp>a101</hp>";
    xmldata += "<age>a101</age>";
    xmldata += "</user>";

    //XML 출력
    out.print(xmldata);
%>