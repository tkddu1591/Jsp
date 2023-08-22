<%@ page import="farmstory1.dto.ProductDTO" %>
<%@ page import="farmstory1.dao.ProductDAO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.UUID" %>
<%@ page import="java.io.File" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2023-08-21
  Time: 오후 3:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%



    ProductDAO dao = new ProductDAO();
    // 파일 폼 데이터 수신
    String path = application.getRealPath("/thumb");
    int maxSize = 1024 * 1024 * 10;

    DefaultFileRenamePolicy defaultFileRenamePolicy = new DefaultFileRenamePolicy();
    MultipartRequest mr = new MultipartRequest(request, path, maxSize, "UTF-8", defaultFileRenamePolicy);

    String productName = mr.getParameter("productName");
    String type = mr.getParameter("type");
    String price = mr.getParameter("price");
    String delivery = mr.getParameter("delivery");
    String stock = mr.getParameter("stock");
    String thumb1 = mr.getOriginalFileName("thumb1");
    String thumb2 = mr.getOriginalFileName("thumb2");
    String thumb3 = mr.getOriginalFileName("thumb3");
    String etc = mr.getParameter("etc");
    String seller = mr.getParameter("seller");

    ProductDTO dto = new ProductDTO(path);

    dto.setpName(productName);
    dto.setType(type);
    dto.setPrice(price);
    dto.setDelivery(delivery);
    dto.setStock(stock);
    dto.setThumb1ForRename(thumb1);
    dto.setThumb2ForRename(thumb2);
    dto.setThumb3ForRename(thumb3);
    dto.setEtc(etc);
    dto.setSeller(seller);
    dao.insertProduct(dto);
    // 파일명 수정

    response.sendRedirect("../productRegister.jsp");

%>
