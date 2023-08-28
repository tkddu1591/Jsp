package kr.co.Jboard2.controller.user;

import kr.co.Jboard2.dto.UserDTO;
import kr.co.Jboard2.service.UserService;
import org.apache.catalina.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/register.do")
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("/user/register.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*
pass1
pass2
name
nick
email
auth
hp
zip
addr1
addr2*/

        req.setCharacterEncoding("UTF-8");
        UserDTO userDTO = new UserDTO();
        userDTO.setUid(req.getParameter("uid"));
        userDTO.setPass(req.getParameter("pass1"));
        userDTO.setName(req.getParameter("name"));
        userDTO.setNick(req.getParameter("nick"));
        userDTO.setEmail(req.getParameter("email"));
        userDTO.setHp(req.getParameter("hp"));
        userDTO.setZip(req.getParameter("zip"));
        userDTO.setAddr1(req.getParameter("addr1"));
        userDTO.setAddr2(req.getParameter("addr2"));
        userDTO.setRegIp(req.getRemoteAddr());

        UserService userService = UserService.getInstance();
        userService.insertUser(userDTO);

        resp.sendRedirect("/Jboard2_war_exploded/user/login.do");

    }
}
