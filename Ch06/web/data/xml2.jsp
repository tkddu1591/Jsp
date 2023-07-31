<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="vo.User1VO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.jdom2.Document" %>
<%@ page import="org.jdom2.Element" %>
<%@ page import="org.jdom2.output.XMLOutputter" %>
<%@ page import="org.jdom2.output.Format" %><%--
  Created by IntelliJ IDEA.
  User: Java
  Date: 2023-07-31
  Time: 오전 10:10
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/xml;charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>

<%
    String host = "jdbc:mysql://127.0.0.1:3306/userdb";
    String user = "root";
    String pass = "1234";
    List<User1VO> user1VOS = new ArrayList<>();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(host, user, pass);

        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * from  `userdb`.user2");

        while (rs.next()) {
            User1VO user1 = new User1VO();

            user1.setUid(rs.getString(1));
            user1.setName(rs.getString(2));
            user1.setHp(rs.getString(3));
            user1.setAge(rs.getString(4));
            user1VOS.add(user1);
        }

        rs.close();
        stmt.close();
        conn.close();


    } catch (Exception e) {
        e.printStackTrace();
    }


    //XML 생성
    Document doc = new Document();
    Element elUsers = new Element("users");

    for (User1VO vo : user1VOS) {
        Element elUser = new Element("user");
        Element elUid = new Element("uid");
        Element elName = new Element("name");
        Element elHp = new Element("hp");
        Element elAge = new Element("age");

        elUid.setText(vo.getUid());
        elName.setText(vo.getName());
        elHp.setText(vo.getHp());
        elAge.setText(vo.getAge());

        elUser.addContent(elUid);
        elUser.addContent(elName);
        elUser.addContent(elHp);
        elUser.addContent(elAge);

        elUsers.addContent(elUser);
    }
    doc.setRootElement(elUsers);

    //xml 출력 서식
    XMLOutputter outputter = new XMLOutputter(Format.getPrettyFormat());
    String xml = outputter.outputString(doc);

    //xml 출력
    out.print(xml);

%>