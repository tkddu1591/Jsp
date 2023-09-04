package kr.co.farmstory2.controller.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user/logout.do")
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = -559190195010520226L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        session.invalidate();

        resp.sendRedirect("/Farmstory2_war_exploded/user/login.do?success=200");
    }
}
