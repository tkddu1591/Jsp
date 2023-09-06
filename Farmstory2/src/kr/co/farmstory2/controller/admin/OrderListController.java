package kr.co.farmstory2.controller.admin;

import org.slf4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/orderList.do")
public class OrderListController extends HttpServlet {
    private final Logger logger = org.slf4j.LoggerFactory.getLogger(OrderListController.class);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String cate = req.getParameter("cate");
        req.setAttribute("cate",cate);
        logger.info("cate");

        req.getRequestDispatcher("/admin/orderList.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
