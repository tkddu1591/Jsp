package kr.co.jboard.dao;

import kr.co.jboard.db.DBHelper;
import kr.co.jboard.db.SQL;
import kr.co.jboard.vo.ArticleVO;

import java.sql.SQLException;
import java.util.List;

public class ArticleDAO extends DBHelper {

    private static ArticleDAO instance = new ArticleDAO();

    public static ArticleDAO getInstance() {
        return instance;
    }

    private ArticleDAO() {
    }

    public int insertAriticle(ArticleVO articleVO){
        int result=0;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);

            psmt.setString(1,articleVO.getTitle());
            psmt.setString(2,articleVO.getContent());
            psmt.setString(3,articleVO.getWriter());
            psmt.setString(4,articleVO.getRegIp());
            result=psmt.executeUpdate();

            cloes();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
    public ArticleVO selectArticle(int no){
        return null;
    }
    public List<ArticleVO> selectsArticle(){return null;}
    public void deleteArticle(ArticleVO articleVO){}
    public void updateArticle(int no){}
}
