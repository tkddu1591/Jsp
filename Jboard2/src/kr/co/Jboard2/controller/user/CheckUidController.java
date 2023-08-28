package kr.co.Jboard2.controller.user;

import com.google.gson.JsonObject;
import kr.co.Jboard2.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/user/checkUid.do")
public class CheckUidController extends HttpServlet {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String uid = req.getParameter("uid");
        int result = UserService.getInstance().selectCountUid(uid);

        logger.info("result : " + result);

        JsonObject json = new JsonObject();
        json.addProperty("result", result);

        PrintWriter writer = resp.getWriter();
        writer.print(json.toString());

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
