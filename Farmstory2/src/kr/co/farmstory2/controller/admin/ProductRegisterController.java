package kr.co.farmstory2.controller.admin;

import com.oreilly.servlet.MultipartRequest;
import kr.co.farmstory2.dto.ProductDTO;
import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/productRegister.do")
public class ProductRegisterController extends HttpServlet {
    private static final long serialVersionUID = -7282661194074999566L;

    private Logger logger = org.slf4j.LoggerFactory.getLogger(ProductRegisterController.class);
    private ArticleService aService = new ArticleService();
    private ProductService pService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/productRegister.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 썸네일 업로드
        String path = aService.getPath(req, "/thumb");
        logger.info(path);
        MultipartRequest mr = aService.uploadFile(req,path);

        // 데이터 수신
        String productName = mr.getParameter("productName");
        String type        = mr.getParameter("type");
        String price       = mr.getParameter("price");
        String delivery    = mr.getParameter("delivery");
        String stock       = mr.getParameter("stock");
        String thumb1      = mr.getOriginalFileName("thumb1");
        String thumb2      = mr.getOriginalFileName("thumb2");
        String thumb3      = mr.getOriginalFileName("thumb3");
        String seller      = mr.getParameter("seller");
        String etc         = mr.getParameter("etc");

        // DTO 생성
        ProductDTO dto = new ProductDTO(path);
        dto.setpName(productName);
        dto.setType(type);
        dto.setPrice(price);
        dto.setDelivery(delivery);
        dto.setStock(stock);
        dto.setThumb1ForRename(thumb1);
        dto.setThumb2ForRename(thumb2);
        dto.setThumb3ForRename(thumb3);
        dto.setSeller(seller);
        dto.setEtc(etc);

        logger.debug(dto.toString());

        // 상품등록
        pService.insertProduct(dto);

        // 리다이렉트
        resp.sendRedirect("/Farmstory2_war_exploded/admin/productRegister.do?success=200");
    }
}
