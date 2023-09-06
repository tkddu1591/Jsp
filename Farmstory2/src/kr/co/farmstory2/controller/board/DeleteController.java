package kr.co.farmstory2.controller.board;

import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.dto.FileDTO;
import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.service.FileService;
import org.slf4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/board/delete.do")
public class DeleteController extends HttpServlet {
    private final Logger logger = org.slf4j.LoggerFactory.getLogger(DeleteController.class);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String no = req.getParameter("no");
        String cate = req.getParameter("cate");
        String channel = req.getParameter("channel");

        ArticleDTO  articleDTO = new ArticleDTO();
        FileDTO fileDTO = new FileDTO();
        ArticleService articleService = new ArticleService();
        FileService fileService = new FileService();

        articleDTO = articleService.selectArticle(no);
        if(articleDTO.getFile()!=null) {
            fileDTO = fileService.selectFile(articleDTO.getfNo());
            fileService.deleteFile(String.valueOf(fileDTO.getfNo()));
            articleService.deleteFile(fileDTO.getNewName(), req);
        }
        articleService.deleteComment(no);
        articleService.deleteArticle(no);

        resp.sendRedirect("/Farmstory2_war_exploded/board/list.do?channel="+channel+"&cate="+cate);

    }
}
