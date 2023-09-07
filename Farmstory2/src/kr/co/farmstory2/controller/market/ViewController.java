package kr.co.farmstory2.controller.market;

import kr.co.farmstory2.dto.ProductDTO;
import kr.co.farmstory2.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/market/view.do")
public class ViewController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String pNo = req.getParameter("pNo");

        ProductDTO productDTO = new ProductDTO();
        ProductService productService = new ProductService();

        productDTO = productService.selectProduct(pNo);

        req.setAttribute("productDTO", productDTO);
        req.getRequestDispatcher("/market/view.jsp").forward(req, resp);

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
