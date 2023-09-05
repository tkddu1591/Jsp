package kr.co.farmstory2.controller.board;


import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.service.ArticleService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/board/list.do")
public class ListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String channel = req.getParameter("channel");
        String cate = req.getParameter("cate");
        String pg = req.getParameter("pg");
        ArticleService articleService = new ArticleService();

        req.setAttribute("channel", channel);
        req.setAttribute("cate", cate);


        // 현재 페이지 번호
        int currentPage = articleService.getCurrentPage(pg);

        // 전체 게시물 갯수
        int total = articleService.selectCountTotal(cate);

        // 마지막 페이지 번호
        int lastPageNum = articleService.getLastPageNum(total);

        // 페이지 그룹 start, end 번호
        int[] result = articleService.getPageGroupNum(currentPage, lastPageNum);

        // 페이지 시작번호
        int pageStartNum = articleService.getPageStartNum(total, currentPage);

        // 시작 인덱스
        int start = articleService.getStartNum(currentPage);

        // 현재 페이지 게시물 조회
        List<ArticleDTO> articles = articleService.selectArticlesCate(cate, start);

        req.setAttribute("group", channel);
        req.setAttribute("cate", cate);
        req.setAttribute("articleDTOS", articles);
        req.setAttribute("currentPage", currentPage);
        req.setAttribute("lastPageNum", lastPageNum);
        req.setAttribute("pageGroupStart", result[0]);
        req.setAttribute("pageGroupEnd", result[1]);
        req.setAttribute("pageStartNum", pageStartNum+1);


        req.getRequestDispatcher("/board/list.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
