package contoller;

import dto.MemberDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import service.MemberService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/register.do")
public class RegisterController extends HttpServlet {
//enum을 이용한 싱글톤 객체
    protected MemberService service = MemberService.INSTANCE;

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String uid= request.getParameter("uid");
        String name= request.getParameter("name");
        String hp= request.getParameter("hp");
        String pos= request.getParameter("pos");
        String dep= request.getParameter("dep");
        String rDate= request.getParameter("rDate");

        MemberDTO dto = new MemberDTO();
        dto.setUid(uid);
        dto.setName(name);
        dto.setHp(hp);
        dto.setPos(pos);
        dto.setDep(dep);



        service.insertMember(dto);

        response.sendRedirect("/Ch11_war_exploded/list.do");
    }
}
