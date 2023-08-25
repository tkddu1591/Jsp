package controller.user1;

import dto.User1DTO;
import service.UserService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.Serial;
import java.util.List;

@WebServlet("/user1/list.do")
public class ListController extends HttpServlet {
    UserService service = new UserService();
    @Serial
    private static final long serialVersionUID = 1L;

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<User1DTO> dtos = service.selectUser1s();

        req.setAttribute("users",dtos);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user1/list.jsp");
        dispatcher.forward(req, resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
