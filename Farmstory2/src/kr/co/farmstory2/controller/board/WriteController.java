package kr.co.farmstory2.controller.board;

import com.oreilly.servlet.MultipartRequest;
import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.dto.FileDTO;
import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.service.FileService;
import kr.co.farmstory2.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/board/write.do")
public class WriteController extends HttpServlet {
    private static final long serialVersionUID = -550554488397185817L;

    private Logger logger = org.slf4j.LoggerFactory.getLogger(UserService.class);
    private ArticleService aService = new ArticleService();
    private FileService fService = new FileService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String channel = req.getParameter("channel");
        String cate = req.getParameter("cate");
        String channelName = "";
        if (channel.equals("3")) {
            channelName = "croptalk";
        } else if (channel.equals("4")) {
            channelName = "event";
        } else {
            channelName = "community";
        }
        ArticleService articleService = new ArticleService();

        req.setAttribute("channel", channel);
        req.setAttribute("channelName", channelName);
        req.setAttribute("cate", cate);

        req.getRequestDispatcher("/board/write.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        // 파일 업로드
        MultipartRequest mr = aService.uploadFile(req);

        // 폼 데이터 수신
        String channel   = mr.getParameter("channel");
        String cate   = mr.getParameter("cate");
        String title   = mr.getParameter("title");
        String content = mr.getParameter("content");
        String writer  = mr.getParameter("writer");
        String oName   = mr.getOriginalFileName("file");
        String regip   = req.getRemoteAddr();

        logger.debug("title : " + title);
        logger.debug("content : " + content);
        logger.debug("writer : " + writer);
        logger.debug("oName : " + oName);
        logger.debug("regip : " + regip);

        // DTO 생성
        ArticleDTO dto = new ArticleDTO();
        dto.setCate(cate);
        dto.setTitle(title);
        dto.setContent(content);
        dto.setFile(oName);
        dto.setWriter(writer);
        dto.setRegIp(regip);
        // 글 Insert
        int no = aService.insertArticle(dto);

        // 파일명 수정 및 파일 Insert
        if(oName != null) {
            String sName = aService.renameToFile(req, oName);

            // 파일 Insert
            FileDTO fileDto = new FileDTO();
            fileDto.setaNo(no);
            fileDto.setOriName(oName);
            fileDto.setNewName(sName);

            fService.insertFile(fileDto);
        }

        // 리다이렉트
        resp.sendRedirect("/Farmstory2_war_exploded/board/list.do?channel="+channel+"&cate="+cate);
    }
}
