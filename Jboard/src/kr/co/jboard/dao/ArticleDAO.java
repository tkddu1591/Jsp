package kr.co.jboard.dao;

import kr.co.jboard.db.DBHelper;
import kr.co.jboard.db.SQL;
import kr.co.jboard.dto.ArticleDTO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ArticleDAO extends DBHelper {

    private static ArticleDAO instance = new ArticleDAO();

    public static ArticleDAO getInstance() {
        return instance;
    }

    private ArticleDAO() {
    }

    public int insertAriticle(ArticleDTO articleDTO) {
        int result = 0;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);

            psmt.setString(1, articleDTO.getTitle());
            psmt.setString(2, articleDTO.getContent());
            psmt.setString(3, articleDTO.getWriter());
            psmt.setString(4, articleDTO.getRegIp());
            result = psmt.executeUpdate();

            cloes();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public ArticleDTO selectArticle(int no) {
        ArticleDTO vo = new ArticleDTO();
        try {

            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_ARTICLE);
            psmt.setInt(1, no);
            rs = psmt.executeQuery();

            if (rs.next()) {
                vo.setNo(rs.getInt(1));
                vo.setParent(rs.getInt(2));
                vo.setComment(rs.getInt(3));
                vo.setCate(rs.getString(4));
                vo.setTitle(rs.getString(5));
                vo.setContent(rs.getString(6));
                vo.setFile(rs.getInt(7));
                vo.setHit(rs.getInt(8));
                vo.setWriter(rs.getString(9));
                vo.setRegIp(rs.getString(10));
                vo.setrDate(rs.getString(11));
                vo.setNick(rs.getString(15));

            }
            cloes();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return vo;
    }

    public int selectArticleNo() {
        int result = 0;
        try {
            conn = getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(SQL.SELECT_ARTICLE_COUNT);
            if (rs.next()) {
                result = rs.getInt(1);
            }
            cloes();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public List<ArticleDTO> selectsArticle(int start) {
        List<ArticleDTO> vos = new ArrayList<>();
        try {

            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECTS_ARTICLE);
            psmt.setInt(1, start);
            rs = psmt.executeQuery();


            while (rs.next()) {
                ArticleDTO vo = new ArticleDTO();
                vo.setNo(rs.getInt(1));
                vo.setParent(rs.getInt(2));
                vo.setComment(rs.getInt(3));
                vo.setCate(rs.getString(4));
                vo.setTitle(rs.getString(5));
                vo.setContent(rs.getString(6));
                vo.setFile(rs.getInt(7));
                vo.setHit(rs.getInt(8));
                vo.setWriter(rs.getString(9));
                vo.setRegIp(rs.getString(10));
                vo.setrDate(rs.getString(11));
                vo.setNick(rs.getString(15));
                vos.add(vo);
            }
            cloes();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return vos;

    }
    public List<ArticleDTO> selectArticleComments(int parent) {
        List<ArticleDTO> vos = new ArrayList<>();
        try {

            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECTS_ARTICLE_COMMENT);
            psmt.setInt(1, parent);
            rs = psmt.executeQuery();


            while (rs.next()) {
                ArticleDTO vo = new ArticleDTO();
                vo.setNo(rs.getInt(1));
                vo.setParent(rs.getInt(2));
                vo.setComment(rs.getInt(3));
                vo.setCate(rs.getString(4));
                vo.setTitle(rs.getString(5));
                vo.setContent(rs.getString(6));
                vo.setFile(rs.getInt(7));
                vo.setHit(rs.getInt(8));
                vo.setWriter(rs.getString(9));
                vo.setRegIp(rs.getString(10));
                vo.setrDate(rs.getString(11));
                vo.setNick(rs.getString(15));
                vos.add(vo);
            }
            cloes();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return vos;

    }


    public int updateArticleContent(ArticleDTO vo) {
        int result = 0;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.UPDATE_ARTICLE_CONTENT);
            psmt.setInt(3, vo.getNo());
            psmt.setString(1, vo.getTitle());
            psmt.setString(2, vo.getContent());
            result = psmt.executeUpdate();
            cloes();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return result;
    }

    public void updateArticleHit(int no) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.UPDATE_ARTICLE_HIT);
            psmt.setInt(1, no);
            psmt.executeUpdate();
            cloes();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void updateArticleComment(int no) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.UPDATE_ARTICLE_COMMENT);
            psmt.setInt(1, no);
            psmt.executeUpdate();
            cloes();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void updateArticleCommentMinus(int no) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.UPDATE_ARTICLE_COMMENT_MINUS);
            psmt.setInt(1, no);
            psmt.executeUpdate();
            cloes();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void deleteArticle(int no) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.DELETE_ARTICLE_COMMENT);
            psmt.setInt(1, no);
            psmt.executeUpdate();
            cloes();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void insertComment(ArticleDTO dto){
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.INSERT_COMMENT);
            psmt.setInt(1,dto.getParent());
            psmt.setString(2,dto.getContent());
            psmt.setString(3,dto.getWriter());
            psmt.setString(4,dto.getRegIp());

            psmt.executeUpdate();
            cloes();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
