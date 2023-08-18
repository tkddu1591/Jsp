<%@ page import="farmstory1.dao.UserDAO" %>
<%@ page import="farmstory1.dto.UserDTO" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String uid = request.getParameter("uid");
    String pass = request.getParameter("pass");
    String target = request.getParameter("target");
    String group = request.getParameter("group");
    String cate = request.getParameter("cate");
    String no = request.getParameter("no");

    UserDAO dao = UserDAO.getInstance();
    UserDTO user = dao.selectUser(uid, pass);

    if (user != null) {
        session.setAttribute("sessUser", user);
        if (target.equals("write")) {
            response.sendRedirect("/Farmstory_war_exploded/board/write.jsp?group=" + group + "&cate=" + cate);
        } else if (target.equals("view")) {
            response.sendRedirect("/Farmstory_war_exploded/board/view.jsp?group=" + group + "&cate=" + cate + "&no=" + no);
        } else {
            response.sendRedirect("/Farmstory_war_exploded");
        }

    } else {
        response.sendRedirect("/Farmstory_war_exploded/user/login.jsp?success=100");
    }
%>