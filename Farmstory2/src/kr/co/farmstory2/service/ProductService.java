package kr.co.farmstory2.service;

import kr.co.farmstory2.dao.ProductDAO;
import kr.co.farmstory2.dto.ProductDTO;

import java.util.List;

public class ProductService {
    private ProductDAO dao = new ProductDAO();
    public ProductDTO selectProduct(String pNo) {
        return dao.selectProduct(pNo);
    }

    public List<ProductDTO> selectProducts(int start) {
        return dao.selectProducts(start);
    }

    public List<ProductDTO> selectProducts(String type, int start) {
        return dao.selectProducts(type, start);
    }

    public void updateProduct(ProductDTO dto) {
        dao.updateProduct(dto);
    }
    public void deleteProduct(int pNo) {
        dao.deleteProduct(pNo);
    }

    // 추가
    public int selectCountProductsTotal() {
        return dao.selectCountProductsTotal();
    }

    public int selectCountProductsTotal(String type) {
        return dao.selectCountProductsTotal(type);
    }

    public void insertProduct(ProductDTO dto) {
        dao.insertProduct(dto);
    }
}
