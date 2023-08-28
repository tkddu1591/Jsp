package kr.co.Jboard2.controller.user;

import com.google.gson.JsonObject;
import kr.co.Jboard2.dao.UserDAO;
import kr.co.Jboard2.service.UserService;
import org.apache.catalina.User;
import org.slf4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/user/authEmail.do")
public class AuthEmailController extends HttpServlet {
    private Logger logger = org.slf4j.LoggerFactory.getLogger(AuthEmailController.class);
    private static final long serialVersionUID = 1L;
    private UserService userService = UserService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");


        int status = userService.sendCodeByEmail(email);

        //json 생성
        JsonObject json = new JsonObject();
        json.addProperty("status",status );

        //json 출력
        PrintWriter writer = resp.getWriter();
        writer.print(json.toString());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String code = req.getParameter("code");
        int result = userService.ConfirmCodeByEmail(code);

        JsonObject json = new JsonObject();
        json.addProperty("result",result);

        //json 출력
        PrintWriter writer = resp.getWriter();
        writer.print(json.toString());
    }


}
