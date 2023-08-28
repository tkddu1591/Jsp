package kr.co.Jboard2.controller.user;

import kr.co.Jboard2.dto.TermsDTO;
import kr.co.Jboard2.service.TermsService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/terms.do")
public class TermsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/terms.jsp");

        TermsDTO termsDTO = new TermsDTO();
        termsDTO.setTerms(TermsService.getInstance().selectTerms().getTerms());
        termsDTO.setPrivacy(TermsService.getInstance().selectPrivacy().getPrivacy());
        req.setAttribute("termsDTO", termsDTO);

        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
