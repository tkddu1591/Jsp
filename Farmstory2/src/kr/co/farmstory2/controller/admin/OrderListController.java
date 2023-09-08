package kr.co.farmstory2.controller.admin;

import kr.co.farmstory2.dto.OrderDTO;
import kr.co.farmstory2.dto.UserDTO;
import kr.co.farmstory2.service.OrderService;
import kr.co.farmstory2.service.PageService;
import kr.co.farmstory2.service.UserService;
import org.slf4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin/orderList.do")
public class OrderListController extends HttpServlet {
    private final Logger logger = org.slf4j.LoggerFactory.getLogger(OrderListController.class);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        String cate = req.getParameter("cate");
        req.setAttribute("cate", cate);

        String pg = req.getParameter("pg");

        List<OrderDTO> orderDTOS = new ArrayList<>();
        OrderService orderService = new OrderService();
        PageService pageService = new PageService();

        // 현재 페이지 번호
        int currentPage = pageService.getCurrentPage(pg);

        // 전체 게시물 갯수
        int total = orderService.selectCountTotal();

        // 마지막 페이지 번호
        int lastPageNum = pageService.getLastPageNum(total);

        // 페이지 그룹 start, end 번호
        int[] result = pageService.getPageGroupNum(currentPage, lastPageNum);

        // 페이지 시작번호
        int pageStartNum = pageService.getPageStartNum(total, currentPage);

        // 시작 인덱스
        int start = pageService.getStartNum(currentPage);

        // 현재 페이지 게시물 조회
        orderDTOS = orderService.selectOrders(start);


        req.setAttribute("currentPage", currentPage);
        req.setAttribute("lastPageNum", lastPageNum);
        req.setAttribute("pageGroupStart", result[0]);
        req.setAttribute("pageGroupEnd", result[1]);
        req.setAttribute("pageStartNum", pageStartNum + 1);


        req.setAttribute("orderDTOS", orderDTOS);
        req.setAttribute("total", total);


        req.getRequestDispatcher("/admin/orderList.jsp").forward(req, resp);

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
