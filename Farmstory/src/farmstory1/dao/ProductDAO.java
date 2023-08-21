package farmstory1.dao;

import farmstory1.db.DBHelper;
import farmstory1.db.SQL;
import farmstory1.dto.ProductDTO;

import java.sql.SQLException;

public class ProductDAO extends DBHelper {
    public  void insertProduct(ProductDTO dto){
        try {
            conn = getConnection();
            psmt= conn.prepareStatement(SQL.INSERT_PRODUCT);
            psmt.setInt(1,dto.getType());
            psmt.setString(2,dto.getpName());
            psmt.setInt(3,dto.getPrice());
            psmt.setInt(4,dto.getDelivery());
            psmt.setInt(5,dto.getStock());
            psmt.setString(6,dto.getThumb1());
            psmt.setString(7,dto.getThumb2());
            psmt.setString(8,dto.getThumb3());
            psmt.setString(9,dto.getSeller());
            psmt.setString(10,dto.getEtc());

            psmt.executeUpdate();
            close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    public  void selectProduct(){}
    public  void selectProducts(){}
    public  void updateProduct(){}
    public  void deleteProduct(){}

}
