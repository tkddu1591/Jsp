package kr.co.farmstory2.controller.user;

import kr.co.farmstory2.dto.UserDTO;
import kr.co.farmstory2.service.UserService;
import org.slf4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user/login.do")
public class LoginController extends HttpServlet {
    private Logger logger = org.slf4j.LoggerFactory.getLogger(LoginController.class);
    private UserService service = new UserService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String success = req.getParameter("success");
        req.setAttribute("success", success);

        req.getRequestDispatcher("/user/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String uid  = req.getParameter("uid");
        String pass = req.getParameter("pass");

        UserDTO user = service.selectUser(uid, pass);

        logger.info(String.valueOf(user.toString()));
        if(user.getNick() != null) {
            // 현재 세션 구하기
            HttpSession session = req.getSession();

            // 사용자 세션 설정
            session.setAttribute("sessUser", user);

            // 리다이렉트
            resp.sendRedirect("/Farmstory2_war_exploded/index.do");
        }else {
            // 리다이렉트
            resp.sendRedirect("/Farmstory2_war_exploded/user/login.do?success=100");
        }
    }
}
