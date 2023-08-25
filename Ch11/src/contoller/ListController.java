package contoller;

import dto.MemberDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import service.MemberService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/list.do")
public class ListController extends HttpServlet {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public void init() throws ServletException {
        logger.info("ListController init()...1");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        List<MemberDTO> memberDTOS = MemberService.INSTANCE.selectMembers();
        request.setAttribute("memberDTOS", memberDTOS);


        logger.info("ListController deGet()...1");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("ListController dePost()...1");

    }
}
