package kr.co.farmstory2.service;

import kr.co.farmstory2.dao.OrderDAO;
import kr.co.farmstory2.dto.OrderDTO;
import org.slf4j.Logger;

import java.util.List;

public class OrderService {
    private OrderDAO orderDAO = new OrderDAO();
    private final Logger logger = org.slf4j.LoggerFactory.getLogger(OrderService.class);

    public void insertOrder(OrderDTO orderDTO) {
        orderDAO.insertOrder(orderDTO);
    }
    public OrderDTO selectOrder(String orderNo) {
        return orderDAO.selectOrder(orderNo);
    }
    public List<OrderDTO> selectOrders(String start) {
        return orderDAO.selectOrders(start);
    }
    public List<OrderDTO> selectOrders() {
        return orderDAO.selectOrders();
    }
    public void updateOrder(OrderDTO orderDTO) {}
    public void deleteOrder(OrderDTO orderDTO) {}

}
