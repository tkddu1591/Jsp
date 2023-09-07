package kr.co.farmstory2.controller.admin;

import kr.co.farmstory2.dto.OrderDTO;
import kr.co.farmstory2.dto.ProductDTO;
import kr.co.farmstory2.dto.UserDTO;
import kr.co.farmstory2.service.OrderService;
import kr.co.farmstory2.service.ProductService;
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

@WebServlet("/admin/index.do")
public class IndexController extends HttpServlet {
    private final Logger logger = org.slf4j.LoggerFactory.getLogger(IndexController.class);
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        List<UserDTO> userDTOS = new ArrayList<>();
        List<OrderDTO> orderDTOS = new ArrayList<>();
        List<ProductDTO> productDTOS = new ArrayList<>();

        UserService userService = new UserService();
        OrderService orderService = new OrderService();
        ProductService productService = new ProductService();

        userDTOS = userService.selectUsers();
        orderDTOS = orderService.selectOrders();
        productDTOS = productService.selectProducts();

        req.setAttribute("userDTOS", userDTOS);
        req.setAttribute("orderDTOS", orderDTOS);
        req.setAttribute("productDTOS", productDTOS);


        logger.info(userDTOS.toString());

        req.getRequestDispatcher("/admin/index.jsp").forward(req, resp);

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
