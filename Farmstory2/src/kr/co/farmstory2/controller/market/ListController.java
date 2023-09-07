package kr.co.farmstory2.controller.market;

import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.dto.ProductDTO;
import kr.co.farmstory2.service.PageService;
import kr.co.farmstory2.service.ProductService;
import org.slf4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/market/list.do")
public class ListController extends HttpServlet {
    private final Logger logger = org.slf4j.LoggerFactory.getLogger(ListController.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        String type = req.getParameter("type");
        String pg = req.getParameter("pg");

        if (type == null) {
            type = "0";
        }
        List<ProductDTO> productDTOS = new ArrayList<>();
        ProductService productService = new ProductService();
        PageService pageService = new PageService();

        // 현재 페이지 번호
        int currentPage = pageService.getCurrentPage(pg);

        // 전체 게시물 갯수
        int total = productService.selectCountProductsTotal(type);

        // 마지막 페이지 번호
        int lastPageNum = pageService.getLastPageNum(total);

        // 페이지 그룹 start, end 번호
        int[] result = pageService.getPageGroupNum(currentPage, lastPageNum);

        // 페이지 시작번호
        int pageStartNum = pageService.getPageStartNum(total, currentPage);

        // 시작 인덱스
        int start = pageService.getStartNum(currentPage);

        // 현재 페이지 게시물 조회
        productDTOS = productService.selectProducts(type, start);


        req.setAttribute("currentPage", currentPage);
        req.setAttribute("lastPageNum", lastPageNum);
        req.setAttribute("pageGroupStart", result[0]);
        req.setAttribute("pageGroupEnd", result[1]);
        req.setAttribute("pageStartNum", pageStartNum + 1);


        req.setAttribute("productDTOS", productDTOS);
        req.setAttribute("type", type);
        req.setAttribute("total", total);
        req.getRequestDispatcher("/market/list.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
