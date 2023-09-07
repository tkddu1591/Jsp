package kr.co.farmstory2.dao;

import kr.co.farmstory2.db.DBHelper;
import kr.co.farmstory2.db.SQL;
import kr.co.farmstory2.dto.OrderDTO;
import kr.co.farmstory2.dto.UserDTO;
import org.slf4j.Logger;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO extends DBHelper {

    private final Logger logger = org.slf4j.LoggerFactory.getLogger(OrderDAO.class);
    public void insertOrder(OrderDTO orderDTO) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.INSERT_ORDER);
            psmt.setString(1, orderDTO.getOrderProduct());
            psmt.setString(2, orderDTO.getOrderCount());
            psmt.setString(3, orderDTO.getOrderDelivery());
            psmt.setString(4, orderDTO.getOrderPrice());
            psmt.setString(5, orderDTO.getOrderTotal());
            psmt.setString(6, orderDTO.getReceiver());
            psmt.setString(7, orderDTO.getHp());
            psmt.setString(8, orderDTO.getZip());
            psmt.setString(9, orderDTO.getAddr1());
            psmt.setString(10, orderDTO.getAddr2());
            psmt.setString(11, orderDTO.getOrderEtc());
            psmt.setString(12, orderDTO.getOrderUser());
            psmt.executeUpdate();
            close();
        } catch (SQLException e) {
            logger.error("insertOrder - %s".formatted(e.getMessage()));
        }
    }
    public OrderDTO selectOrder(String orderNo) {
        return null;
    }
    public List<OrderDTO> selectOrders(String start) {
        List<OrderDTO> orderDTOS = new ArrayList<OrderDTO>();
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_ORDERS);
            psmt.setString(1, start);
            rs = psmt.executeQuery();
            while (rs.next()) {
                OrderDTO orderDTO = new OrderDTO();
                orderDTO = selectOrderData();
                orderDTO.setOrderProductName(rs.getString("pName"));
                orderDTOS.add(orderDTO);
            }
            close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orderDTOS;
    }
    public List<OrderDTO> selectOrders() {
        List<OrderDTO> orderDTOS = new ArrayList<OrderDTO>();
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_ORDERS_PREVIEW);
            rs = psmt.executeQuery();
            while (rs.next()) {
                OrderDTO orderDTO = new OrderDTO();
                orderDTO = selectOrderData();
                orderDTO.setOrderProductName(rs.getString("pName"));
                orderDTOS.add(orderDTO);
            }
            close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orderDTOS;
    }
    public List<OrderDTO> selectOrders(int start) {
        return null;
    }
    public void updateOrder(OrderDTO orderDTO) {}
    public void deleteOrder(OrderDTO orderDTO) {}
    private OrderDTO selectOrderData() throws SQLException {

        OrderDTO orderDTO = new OrderDTO();

        orderDTO.setOrderNo(rs.getString("orderNo"));
        orderDTO.setOrderProduct(rs.getString("orderProduct"));
        orderDTO.setOrderCount(rs.getString("orderCount"));
        orderDTO.setOrderDelivery(rs.getString("orderDelivery"));
        orderDTO.setOrderPrice(rs.getString("orderPrice"));
        orderDTO.setOrderTotal(rs.getString("orderTotal"));
        orderDTO.setReceiver(rs.getString("receiver"));
        orderDTO.setHp(rs.getString("hp"));
        orderDTO.setZip(rs.getString("zip"));
        orderDTO.setAddr1(rs.getString("addr1"));
        orderDTO.setAddr2(rs.getString("addr2"));
        orderDTO.setOrderEtc(rs.getString("orderEtc"));
        orderDTO.setOrderUser(rs.getString("orderUser"));
        orderDTO.setOrderDate(rs.getString("orderDate"));
        return orderDTO;
    }

}
