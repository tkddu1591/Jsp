package kr.co.farmstory2.controller;

import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.dto.UserDTO;
import kr.co.farmstory2.service.ArticleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/index.do")
public class IndexController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 현재 세션 가져오기
        HttpSession session = req.getSession();
        UserDTO sessUser = (UserDTO) session.getAttribute("sessUser");


        List<ArticleDTO> growArticleDTOS = new ArrayList<ArticleDTO>();
        List<ArticleDTO> schoolArticleDTOS = new ArrayList<ArticleDTO>();
        List<ArticleDTO> storyArticleDTOS = new ArrayList<ArticleDTO>();

        ArticleService articleService = new ArticleService();

        growArticleDTOS = articleService.selectArticlesCatePreview("grow");
        schoolArticleDTOS = articleService.selectArticlesCatePreview("school");
        storyArticleDTOS = articleService.selectArticlesCatePreview("story");

        req.setAttribute("growArticleDTOS", growArticleDTOS);
        req.setAttribute("schoolArticleDTOS", schoolArticleDTOS);
        req.setAttribute("storyArticleDTOS", storyArticleDTOS);

        req.getRequestDispatcher("home.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }
}
