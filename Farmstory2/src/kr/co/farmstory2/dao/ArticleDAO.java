package kr.co.farmstory2.dao;

import kr.co.farmstory2.db.DBHelper;
import kr.co.farmstory2.db.SQL;
import kr.co.farmstory2.dto.ArticleDTO;
import org.slf4j.Logger;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ArticleDAO extends DBHelper {

    private final Logger logger = org.slf4j.LoggerFactory.getLogger(ArticleDAO.class);
    public int insertArticle(ArticleDTO dto){

        int no = 0;

        try {
            conn = getConnection();
            conn.setAutoCommit(false); // Transaction 시작

            stmt = conn.createStatement();
            psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
            psmt.setString(1, dto.getCate());
            psmt.setString(2, dto.getTitle());
            psmt.setString(3, dto.getContent());
            psmt.setString(4, dto.getFile());
            psmt.setString(5, dto.getWriter());
            psmt.setString(6, dto.getRegIp());
            psmt.executeUpdate();
            rs = stmt.executeQuery(SQL.SELECT_MAX_NO);
            conn.commit(); // 작업확정

            if(rs.next()) {
                no = rs.getInt(1);
            }
            close();
        }catch(Exception e){
            logger.error(e.getMessage(), e);
        }

        return no;
    }
    public ArticleDTO selectArticle(String no){
        ArticleDTO articleDTO = new ArticleDTO();
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_ARTICLE);
            psmt.setString(1, no);
            rs = psmt.executeQuery();
            if(rs.next()) {

                articleDTO = articleDataInsert();
                articleDTO.setDownload(rs.getString("download"));
                articleDTO.setfNo(rs.getString("fNo"));
                articleDTO.setNick(rs.getString("nick"));
            }
            close();
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
        return articleDTO;
    }
    public List<ArticleDTO> selectArticles(){
        List<ArticleDTO> articles = new ArrayList<>();

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_ARTICLES);
            rs = psmt.executeQuery();
            while (rs.next()) {
                ArticleDTO article = new ArticleDTO();
                article = articleDataInsert();
                articles.add(article);
            }
            close();
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
        return articles;
    }
    public List<ArticleDTO> selectArticlesCate(String cate, int start){
        List<ArticleDTO> articles = new ArrayList<>();

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_ARTICLES_CATE);
            psmt.setString(1, cate);
            psmt.setInt(2, start);
            rs = psmt.executeQuery();
            while (rs.next()) {
                ArticleDTO article = new ArticleDTO();
                article= articleDataInsert();
                article.setNick(rs.getString("nick"));
                articles.add(article);
            }
            close();
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
        return articles;
    }
    public void deleteArticle(String no){
        try {
            conn =getConnection();
            psmt = conn.prepareStatement(SQL.DELETE_ARTICLE);
            psmt.setString(1, no);
            psmt.executeUpdate();
            close();
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
    }
    public int updateArticle(ArticleDTO dto){
        int no = 0;
        try {
            conn = getConnection();
            conn.setAutoCommit(false); // Transaction 시작

            stmt = conn.createStatement();
            psmt = conn.prepareStatement(SQL.UPDATE_ARTICLE);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getFile());
            psmt.setInt(4, dto.getNo());
            psmt.executeUpdate();
            rs = stmt.executeQuery(SQL.SELECT_MAX_NO);
            conn.commit(); // 작업확정

            if(rs.next()) {
                no = rs.getInt(1);
            }
            close();
        }catch(Exception e){
            logger.error(e.getMessage(), e);
        }

        return no;
    }
    public int selectCountTotal(String cate) {

        int total = 0;

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_COUNT_TOTAL);
            psmt.setString(1, cate);
            rs = psmt.executeQuery();
            if(rs.next()) {
                total = rs.getInt(1);
            }
            close();
        }catch (Exception e) {
            logger.error(e.getMessage(), e);
        }

        return total;
    }

    public ArticleDTO insertComment(ArticleDTO dto){

        try {
            conn = getConnection();
            conn.setAutoCommit(false);

            stmt = conn.createStatement();
            psmt = conn.prepareStatement(SQL.INSERT_COMMENT);
            psmt.setInt(1, dto.getParent());
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getWriter());
            psmt.setString(4, dto.getRegIp());
            psmt.executeUpdate();
            rs = stmt.executeQuery(SQL.SELECT_COMMENT_LATEST);
            conn.commit();

            if(rs.next()) {
                dto.setNo(rs.getInt(1));
                dto.setParent(rs.getInt(2));
                dto.setComment(rs.getInt(3));
                dto.setCate(rs.getString(4));
                dto.setTitle(rs.getString(5));
                dto.setContent(rs.getString(6));
                dto.setFile(rs.getString(7));
                dto.setHit(rs.getInt(8));
                dto.setWriter(rs.getString(9));
                dto.setRegIp(rs.getString(10));
                dto.setrDate(rs.getString(11));
                dto.setNick(rs.getString("nick"));
            }

            close();

        }catch (Exception e) {
            e.printStackTrace();
        }

        logger.debug("dto : " + dto);


        return dto;
    }
    public void updateCommentPlus(String parent){
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.UPDATE_COMMENT_PLUS);
            psmt.setString(1, parent);
            psmt.executeUpdate();
            close();
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
    }
    public void updateCommentMinus(String parent){
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.UPDATE_COMMENT_MINUS);
            psmt.setString(1, parent);
            psmt.executeUpdate();
            close();
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
    }

    public List<ArticleDTO> selectComments(String parent){
        List<ArticleDTO> articles = new ArrayList<>();
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_COMMENTS);
            psmt.setString(1, parent);
            rs = psmt.executeQuery();
            while (rs.next()) {
                ArticleDTO articleDTO = new ArticleDTO();
                articleDTO.setTitle(rs.getString("title"));
                articleDTO.setNo(Integer.parseInt(rs.getString("no")));
                articleDTO.setContent(rs.getString("content"));
                articleDTO.setWriter(rs.getString("writer"));
                articleDTO.setRegIp(rs.getString("regIp"));
                articleDTO.setrDate(rs.getString("rDate"));
                articleDTO.setNick(rs.getString("nick"));
                articles.add(articleDTO);
            }
            close();
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
        return  articles;
    }

    public void updateArticleHitPlus(String no){
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.UPDATE_ARTICLE_HIT_PLUS);
            psmt.setString(1, no);
            psmt.executeUpdate();
            close();
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
    }
    public int deleteComment(String no){
        int result = 0;
        try {
            conn = getConnection();
            psmt =conn.prepareStatement(SQL.DELETE_COMMENT);
            psmt.setString(1, no);
            result = psmt.executeUpdate();
            close();
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
        return result;
    }

    public ArticleDTO articleDataInsert(){
        ArticleDTO article = new ArticleDTO();
        try {
            article.setNo(rs.getInt("no"));
            article.setParent(rs.getInt("parent"));
            article.setComment(rs.getInt("comment"));
            article.setCate(rs.getString("cate"));
            article.setTitle(rs.getString("title"));
            article.setContent(rs.getString("content"));
            article.setFile(rs.getString("file"));
            article.setHit(rs.getInt("hit"));
            article.setWriter(rs.getString("writer"));
            article.setRegIp(rs.getString("regIp"));
            article.setrDate(rs.getString("rDate"));
        } catch (SQLException e) {
            logger.error(e.getMessage(), e);
        }
        return article;
    }

    public int updateComment(String no, String content) {
        int result = 0;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.UPDATE_COMMENT);
            psmt.setString(1, content);
            psmt.setString(2, no);
            result = psmt.executeUpdate();
            close();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
