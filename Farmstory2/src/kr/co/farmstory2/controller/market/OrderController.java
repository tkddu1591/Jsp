package kr.co.farmstory2.controller.market;

import kr.co.farmstory2.dto.OrderDTO;
import kr.co.farmstory2.dto.ProductDTO;
import kr.co.farmstory2.service.OrderService;
import kr.co.farmstory2.service.ProductService;
import org.slf4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/market/order.do")
public class OrderController extends HttpServlet {

    private final Logger logger = org.slf4j.LoggerFactory.getLogger(OrderController.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        /*
         <input type="hidden" name="thumb2" value="${prodcutDTO.thumb2}">
                        <input type="hidden" name="pName" value="${prodcutDTO.pName}">
                        <input type="hidden" name="pNo" value="${prodcutDTO.pNo}">
                        <input type="hidden" name="delivery" value="${prodcutDTO.delivery}">
                        <input type="hidden" name="price" value="${prodcutDTO.price}">
                        <input type="hidden" name="count" value="1">
                        <input type="hidden" name="total" value="${prodcutDTO.total}">
                        <input type="hidden" name="final" value="${prodcutDTO.price + productDTO.delivery}">

            */

        req.getRequestDispatcher("/market/order.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        ProductDTO productDTO = new ProductDTO();
        ProductService productService = new ProductService();

        String buy = req.getParameter("buy");
        if (buy == null) {
            buy = "confirmation";
        }


        if (buy.equals("confirmation")) {
            productDTO.setThumb2(req.getParameter("thumb2"));
            productDTO.setpName(req.getParameter("pName"));
            productDTO.setpNo(Integer.parseInt(req.getParameter("pNo")));
            productDTO.setCount((req.getParameter("count")));
            productDTO.setTotal(req.getParameter("total"));
            productDTO.setPrice(Integer.parseInt(req.getParameter("price")));
            if(productDTO.getTotal()>=30000) {
                productDTO.setDelivery("0");
                productDTO.setFinalPrice(req.getParameter("total"));
            }else {
                productDTO.setDelivery(Integer.parseInt(req.getParameter("delivery")));
                productDTO.setFinalPrice(req.getParameter("final"));
            }
            req.setAttribute("productDTO", productDTO);
            req.getRequestDispatcher("/market/order.jsp").forward(req, resp);
        } else if(buy.equals("real")){


            OrderDTO orderDTO = new OrderDTO();
            OrderService orderService = new OrderService();

            orderDTO.setReceiver(req.getParameter("receiver"));
            orderDTO.setHp(req.getParameter("hp"));
            orderDTO.setZip(req.getParameter("zip"));
            orderDTO.setAddr1(req.getParameter("addr1"));
            orderDTO.setAddr2(req.getParameter("addr2"));
            orderDTO.setOrderEtc(req.getParameter("etc"));
            orderDTO.setOrderProduct(req.getParameter("orderProduct"));
            orderDTO.setOrderDelivery(req.getParameter("orderDelivery"));
            orderDTO.setOrderCount(req.getParameter("orderCount"));
            orderDTO.setOrderPrice(req.getParameter("orderPrice"));
            orderDTO.setOrderTotal(req.getParameter("orderTotal"));
            orderDTO.setOrderUser(req.getParameter("orderUser"));

            productService.updateProductStockMinus(orderDTO.getOrderProduct());
            orderService.insertOrder(orderDTO);

            resp.sendRedirect("/Farmstory2_war_exploded/market/list.do");
        }
    }
}
