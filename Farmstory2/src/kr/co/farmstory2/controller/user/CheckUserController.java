package kr.co.farmstory2.controller.user;

import com.google.gson.JsonObject;
import kr.co.farmstory2.service.UserService;
import org.apache.catalina.User;
import org.slf4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/user/checkUser.do")
public class CheckUserController extends HttpServlet {
    private Logger logger = org.slf4j.LoggerFactory.getLogger(CheckUserController.class);
    UserService userService= new UserService();
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uid = req.getParameter("uid");
        String hp = req.getParameter("hp");
        String nick = req.getParameter("nick");

        int type = 0;
        String value = null;
        if (uid!= null) {
            type = 1;
            value = uid;
        }else if (nick!= null) {
            type = 2;
            value = nick;
        }else {
            type = 3;
            value = hp;
        }

        int result = userService.selectCountUserValue(value, type);

        logger.info("result : " + result);

        JsonObject json = new JsonObject();
        json.addProperty("result", result);

        PrintWriter writer = resp.getWriter();
        writer.print(json.toString());
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

}
