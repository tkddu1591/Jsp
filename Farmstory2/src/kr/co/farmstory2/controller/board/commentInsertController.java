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

@WebServlet("/board/commentInsert.do")
public class commentInsertController extends HttpServlet {

    private Logger logger = org.slf4j.LoggerFactory.getLogger(commentInsertController.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String channel = req.getParameter("channel");
        String cate = req.getParameter("cate");
        String parent = req.getParameter("parent");
        String writer = req.getParameter("writer");
        String content = req.getParameter("content");
        String regIp = req.getRemoteAddr();

        logger.info(channel);
        logger.info(cate);
        logger.info(parent);
        logger.info(writer);
        logger.info(content);

        ArticleDTO articleDTO = new ArticleDTO();
        articleDTO.setParent(parent);
        articleDTO.setWriter(writer);
        articleDTO.setContent(content);
        articleDTO.setRegIp(regIp);

        String no = req.getParameter("no");

        ArticleService articleService = new ArticleService();
        ArticleDTO articleDTO2 = articleService.selectArticle(no);
        articleService.updateCommentPlus(parent);



        articleService.insertComment(articleDTO);

        resp.sendRedirect("/Farmstory2_war_exploded/board/view.do?channel="+channel+"&cate="+cate+"&no="+parent);


    }

}
