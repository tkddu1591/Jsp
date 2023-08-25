package farmstory1.dao;

import farmstory1.db.DBHelper;
import farmstory1.db.SQL;
import farmstory1.dto.OrderDTO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO extends DBHelper {
    public void insertOrder(OrderDTO dto) {

        try {
            conn= getConnection();
            psmt=conn.prepareStatement(SQL.INSERT_ORDER);
            psmt.setInt(1,dto.getOrderProduct());
            psmt.setInt(2,dto.getOrderCount());
            psmt.setInt(3,dto.getOrderDelivery());
            psmt.setInt(4,dto.getOrderPrice());
            psmt.setInt(5,dto.getOrderTotal());
            psmt.setString(6,dto.getReceiver());
            psmt.setString(7,dto.getHp());
            psmt.setString(8,dto.getZip());
            psmt.setString(9,dto.getAddr1());
            psmt.setString(10,dto.getAddr2());
            psmt.setString(11,dto.getOrderEtc());
            psmt.setString(12,dto.getOrderUser());
            psmt.executeUpdate();
            close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<OrderDTO> selectOrdersDesc(int num) {

        List<OrderDTO> list = new ArrayList<OrderDTO>();
        try {
            conn=getConnection();
            psmt=conn.prepareStatement(SQL.SELECT_ORDERS_DESC);
            psmt.setInt(1,num);
            rs=psmt.executeQuery();
            while(rs.next()) {
                OrderDTO dto = orderDateSet();
                dto.setProductName(rs.getString(17));
                list.add(dto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    private OrderDTO orderDateSet() throws SQLException {
        OrderDTO dto = new OrderDTO();
        dto.setOrderNo(rs.getInt(1));
        dto.setOrderProduct(rs.getString(2));
        dto.setOrderCount(rs.getString(3));
        dto.setOrderDelivery(rs.getString(4));
        dto.setOrderPrice(rs.getString(5));
        dto.setOrderTotal(rs.getString(6));
        dto.setReceiver(rs.getString(7));
        dto.setHp(rs.getString(8));
        dto.setZip(rs.getString(9));
        dto.setAddr1(rs.getString(10));
        dto.setAddr2(rs.getString(11));
        dto.setOrderEtc(rs.getString(12));
        dto.setOrderUser(rs.getString(13));
        dto.setOrderDate(rs.getString(14));

        return dto;
    }

}
