package contoller;

import dto.MemberDTO;
import service.MemberService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/modify.do")
public class ModifyController extends HttpServlet {
    MemberService memberService = MemberService.INSTANCE;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String uid =request.getParameter("uid");

        MemberDTO memberDTO = memberService.selectMember(uid);

        request.setAttribute("memberDTO", memberDTO);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/modify.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");


        MemberDTO memberDTO = new MemberDTO();

        memberDTO.setUid(request.getParameter("uid"));
        memberDTO.setName(request.getParameter("name"));
        memberDTO.setHp(request.getParameter("hp"));
        memberDTO.setPos(request.getParameter("pos"));
        memberDTO.setDep(request.getParameter("dep"));

        memberService.updateMember(memberDTO);
        response.sendRedirect("list.do");
    }
}
