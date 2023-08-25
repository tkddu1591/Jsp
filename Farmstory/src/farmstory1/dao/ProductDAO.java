package farmstory1.dao;

import farmstory1.db.DBHelper;
import farmstory1.db.SQL;
import farmstory1.dto.ProductDTO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends DBHelper {
    public void insertProduct(ProductDTO dto) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.INSERT_PRODUCT);
            psmt.setInt(1, dto.getType());
            psmt.setString(2, dto.getpName());
            psmt.setInt(3, dto.getPrice());
            psmt.setInt(4, dto.getDelivery());
            psmt.setInt(5, dto.getStock());
            psmt.setString(6, dto.getThumb1());
            psmt.setString(7, dto.getThumb2());
            psmt.setString(8, dto.getThumb3());
            psmt.setString(9, dto.getSeller());
            psmt.setString(10, dto.getEtc());

            psmt.executeUpdate();
            close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public ProductDTO selectProduct(String pNo) {
        ProductDTO dto = new ProductDTO();
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_PRODUCT);
            psmt.setString(1, pNo);
            rs = psmt.executeQuery();
            if (rs.next()){
                dto = dtoDataInsertAll();
            }
            close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return dto;
    }

    public void updateProductMinus(int pNo, int count){
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.UPDATE_PRODUCT_MINUS);
            psmt.setInt(1,count);
            psmt.setInt(2,count);
            psmt.executeUpdate();
            close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public List<ProductDTO> selectProducts() {
        List<ProductDTO> dtos = new ArrayList<>();
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_PRODUCTS);
            rs = psmt.executeQuery();
            while (rs.next()) {
                ProductDTO dto = new ProductDTO();
                dto.setpNo(Integer.parseInt(rs.getString(1)));
                dto.setType(rs.getString(2));
                dto.setpName(rs.getString(3));
                dto.setPrice(rs.getString(4));
                dto.setDelivery(rs.getString(5));
                dto.setStock(rs.getString(6));
                dto.setThumb1(rs.getString(8));
                dto.setThumb2(rs.getString(9));
                dto.setThumb3(rs.getString(10));
                dto.setSeller(rs.getString(11));
                dto.setEtc(rs.getString(12));
                dto.setrDate(rs.getString(13));
                dtos.add(dto);
            }
            close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return dtos;
    }

    public void updateProduct() {
    }

    public void deleteProduct() {
    }

    public List<ProductDTO> selectProductsAll(int num) {
        List<ProductDTO> dtos = new ArrayList<>();
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_PRODUCTS_ALL);
            psmt.setInt(1, num);
            rs = psmt.executeQuery();
            while (rs.next()) {
                ProductDTO dto = new ProductDTO();
                dto = dtoDataInsertAll();
                dtos.add(dto);
            }
            close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return dtos;
    }

    public List<ProductDTO> selectProductsType(int type, int num) {
        List<ProductDTO> dtos = new ArrayList<>();
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_PRODUCTS_TYPE);
            psmt.setInt(1, type);
            psmt.setInt(2, num);
            rs = psmt.executeQuery();
            while (rs.next()) {
                ProductDTO dto = new ProductDTO();
                dto = dtoDataInsertAll();
                dtos.add(dto);
            }
            close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return dtos;
    }

    public int selectProductsTypeTotal(int type) {
        int total = 0;
        try {
            conn = getConnection();
            if (type!=0) {
                psmt = conn.prepareStatement(SQL.SELECT_PRODUCTS_TOTAL_TYPE);
                psmt.setInt(1, type);
            }else {
                psmt = conn.prepareStatement(SQL.SELECT_PRODUCTS_TOTAL_ALL);
            }
            rs = psmt.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
            close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return total;
    }


    private ProductDTO dtoDataInsertAll() throws SQLException {

        ProductDTO dto = new ProductDTO();
        dto.setpNo(Integer.parseInt(rs.getString(1)));
        dto.setType(rs.getString(2));
        dto.setpName(rs.getString(3));
        dto.setPrice(rs.getString(4));
        dto.setDelivery(rs.getString(5));
        dto.setStock(rs.getString(6));
        dto.setThumb1(rs.getString(8));
        dto.setThumb2(rs.getString(9));
        dto.setThumb3(rs.getString(10));
        dto.setSeller(rs.getString(11));
        dto.setEtc(rs.getString(12));
        dto.setrDate(rs.getString(13));
        return dto;
    }
}
