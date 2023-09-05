package kr.co.farmstory2.controller.board;

import com.oreilly.servlet.MultipartRequest;
import kr.co.farmstory2.dao.ArticleDAO;
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

@WebServlet("/board/modify.do")
public class ModifyController extends HttpServlet {

    private Logger logger = org.slf4j.LoggerFactory.getLogger(ModifyController.class);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cate= req.getParameter("cate");
        String channel =req.getParameter("channel");
        String no =req.getParameter("no");

        ArticleService articleService = new ArticleService();
        ArticleDTO articleDTO = articleService.selectArticle(no);

        req.setAttribute("cate",cate);
        req.setAttribute("channel",channel);
        req.setAttribute("articleDTO",articleDTO);

        req.getRequestDispatcher("/board/modify.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        ArticleService aService = new ArticleService();
        FileService fService = new FileService();

        // 파일 업로드
        MultipartRequest mr = aService.uploadFile(req);

        // 폼 데이터 수신
        String channel   = mr.getParameter("channel");
        String articleNo   = mr.getParameter("no");
        String cate   = mr.getParameter("cate");
        String title   = mr.getParameter("title");
        String content = mr.getParameter("content");
        String writer  = mr.getParameter("writer");
        String oName   = mr.getOriginalFileName("file");
        String regip   = req.getRemoteAddr();


        // DTO 생성
        ArticleDTO dto = new ArticleDTO();
        dto.setCate(cate);
        dto.setNo(Integer.parseInt(articleNo));
        dto.setTitle(title);
        dto.setContent(content);
        dto.setFile(oName);
        dto.setWriter(writer);
        dto.setRegIp(regip);
        // 글 Insert
        aService.updateArticle(dto);
        // 파일명 수정 및 파일 Insert
        if(oName != null) {
            String sName = aService.renameToFile(req, oName);

            // 파일 Insert
            FileDTO fileDto = new FileDTO();
            fileDto.setaNo(Integer.parseInt(articleNo));
            fileDto.setOriName(oName);
            fileDto.setNewName(sName);

            fService.insertFile(fileDto);
        }

        // 리다이렉트
        resp.sendRedirect("/Farmstory2_war_exploded/board/view.do?channel="+channel+"&cate="+cate+"&no="+articleNo);
    }
}
