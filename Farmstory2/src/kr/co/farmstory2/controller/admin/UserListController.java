package kr.co.farmstory2.controller.admin;

import kr.co.farmstory2.dto.UserDTO;
import kr.co.farmstory2.service.PageService;
import kr.co.farmstory2.service.UserService;
import org.slf4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin/userList.do")
public class UserListController extends HttpServlet {
    private final Logger logger = org.slf4j.LoggerFactory.getLogger(UserListController.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String cate = req.getParameter("cate");
        req.setAttribute("cate", cate);

        String pg = req.getParameter("pg");

        List<UserDTO> userDTOS = new ArrayList<>();
        UserService userService = new UserService();
        PageService pageService = new PageService();

        // 현재 페이지 번호
        int currentPage = pageService.getCurrentPage(pg);

        // 전체 게시물 갯수
        int total = userService.selectCountTotal();

        // 마지막 페이지 번호
        int lastPageNum = pageService.getLastPageNum(total);

        // 페이지 그룹 start, end 번호
        int[] result = pageService.getPageGroupNum(currentPage, lastPageNum);

        // 페이지 시작번호
        int pageStartNum = pageService.getPageStartNum(total, currentPage);

        // 시작 인덱스
        int start = pageService.getStartNum(currentPage);

        // 현재 페이지 게시물 조회
        userDTOS = userService.selectUsers(String.valueOf(start));


        req.setAttribute("currentPage", currentPage);
        req.setAttribute("lastPageNum", lastPageNum);
        req.setAttribute("pageGroupStart", result[0]);
        req.setAttribute("pageGroupEnd", result[1]);
        req.setAttribute("pageStartNum", pageStartNum + 1);


        req.setAttribute("userDTOS", userDTOS);
        req.setAttribute("total", total);


        req.getRequestDispatcher("/admin/userList.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        String[] roles = req.getParameterValues("role");
        String[] uids = req.getParameterValues("uids");
        String[] chks = req.getParameterValues("chks");

        logger.info(roles.length + " " + uids.length + " "+ chks.length);
        List<UserDTO> userDTOS = new ArrayList<>();

        for (int i = 0; i < uids.length; i++) {

            logger.info(chks[i]);
            if (chks[i].equals("1")) {
                UserDTO userDTO = new UserDTO();
                userDTO.setRole(roles[i]);
                userDTO.setUid(uids[i]);
                userDTOS.add(userDTO);
            }
        }
        UserService userService = new UserService();
        userService.updateUserRole(userDTOS);

        resp.sendRedirect("./userList.do");
    }
}
