package controller.user1;

import dao.User1DAO;
import dto.User1DTO;
import service.UserService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.Serial;

@WebServlet("/user1/register.do")
public class RegisterController extends HttpServlet {

    @Serial
    private static final long serialVersionUID = 1L;

    private UserService service = new UserService();
    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user1/register.jsp");
        dispatcher.forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uid = req.getParameter("uid");
        String name = req.getParameter("name");
        String hp = req.getParameter("hp");
        String age = req.getParameter("age");

        User1DTO user1DTO = new User1DTO();

        user1DTO.setUid(uid);
        user1DTO.setName(name);
        user1DTO.setHp(hp);
        user1DTO.setAge(age);

        service.insertUser1(user1DTO);

        resp.sendRedirect("/Ch10_war_exploded/user1/list.do");
    }
}
