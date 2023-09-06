package kr.co.farmstory2.controller.board;

import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.service.ArticleService;
import org.slf4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/board/view.do")
public class ViewController extends HttpServlet {

    Logger logger = org.slf4j.LoggerFactory.getLogger(ViewController.class);
    private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String channel = req.getParameter("channel");
        String cate = req.getParameter("cate");
        String no = req.getParameter("no");
        String parent = no;
        ArticleService articleService = new ArticleService();

        ArticleDTO articleDTO = articleService.selectArticle(no);
        articleService.updateArticleHitPlus(no);
        List<ArticleDTO> comments = articleService.selectComments(parent);

        req.setAttribute("cate",cate);
        req.setAttribute("channel",channel);
        req.setAttribute("articleDTO",articleDTO);
        req.setAttribute("comments",comments);

       req.getRequestDispatcher("/board/view.jsp").forward(req, resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
