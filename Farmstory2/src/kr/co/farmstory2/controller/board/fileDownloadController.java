package kr.co.farmstory2.controller.board;

import kr.co.farmstory2.dto.FileDTO;
import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.service.FileService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/board/fileDownload.do")
public class fileDownloadController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String fNo = req.getParameter("fNo");

        ArticleService aService = new ArticleService();
        FileService fService = new FileService();
        FileDTO dto = fService.selectFile(fNo);
        fService.deleteFile(fNo);


        aService.downloadFile(req,resp,dto);
    }

}
