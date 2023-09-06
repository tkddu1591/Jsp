package kr.co.farmstory2.controller.board;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.service.ArticleService;
import org.slf4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/board/comment.do")
public class CommentController extends HttpServlet {
    private static final long serialVersionUID = -1181156545396403793L;

    private final Logger logger = org.slf4j.LoggerFactory.getLogger(CommentController.class);
    private ArticleService articleService = new ArticleService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String type = req.getParameter("type");
        String no = req.getParameter("no");
        String content = req.getParameter("content");
        String parent = req.getParameter("parent");

        logger.info("type : " + type);
        logger.info("no : " + no);

        int result = 0;
        switch (type) {
            case "REMOVE":
                result = articleService.deleteComment(no);
                articleService.updateCommentMinus(parent);
                break;
            case "MODIFY":
                result = articleService.updateComment(no, content);
                break;
        }

        // JSON 출력
        JsonObject json = new JsonObject();
        json.addProperty("result", result);
        resp.getWriter().print(json);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String parent = req.getParameter("parent");
        String content = req.getParameter("content");
        String writer = req.getParameter("writer");
        String regip = req.getRemoteAddr();

        logger.debug("parent : " + parent);
        logger.debug("content : " + content);
        logger.debug("writer : " + writer);
        logger.debug("regip : " + regip);


        ArticleDTO dto = new ArticleDTO();
        dto.setParent(parent);
        dto.setContent(content);
        dto.setWriter(writer);
        dto.setRegIp(regip);

        // 댓글 입력 후 입력한 댓글 조회(왜 이렇게 처리 했는지 생각해봅시다.)
        ArticleDTO comment = articleService.insertComment(dto);
        articleService.updateCommentPlus(parent);
        logger.info(comment.getrDate());
        logger.info(comment.getNick());
        // Json 출력
        resp.setContentType("application/json;charset=UTF-8"); // <-- 이거해야 클라이언트로 전송되는 JSON 한글 안깨짐
        Gson gson = new Gson();
        String strJson = gson.toJson(comment);
        resp.getWriter().print(strJson);
    }
}
