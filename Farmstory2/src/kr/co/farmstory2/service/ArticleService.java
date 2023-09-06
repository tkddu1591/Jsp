package kr.co.farmstory2.service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import kr.co.farmstory2.dao.ArticleDAO;
import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.dto.FileDTO;
import org.slf4j.Logger;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class ArticleService {
    private Logger logger = org.slf4j.LoggerFactory.getLogger(ArticleService.class);
    ArticleDAO articleDAO = new ArticleDAO();
    public int insertArticle(ArticleDTO articleDTO){
        return articleDAO.insertArticle(articleDTO);
    }
    public ArticleDTO selectArticle(String no){
        return articleDAO.selectArticle(no);
    }
    public List<ArticleDTO> selectArticles(){
        return articleDAO.selectArticles();
    }
    public List<ArticleDTO> selectArticlesCate(String cate, int start){
        return articleDAO.selectArticlesCate(cate, start);
    }
    public void deleteArticle(String no){
        articleDAO.deleteArticle(no);
    }
    public int updateArticle(ArticleDTO articleDTO){
        return articleDAO.updateArticle(articleDTO);
    }

    // 업로드 경로 구하기
    public String getFilePath(HttpServletRequest req) {
        // 파일 업로드 경로 구하기
        ServletContext ctx = req.getServletContext();
        String path = ctx.getRealPath("/upload");
        return path;
    }
    // 파일명 수정
    public String getPath(HttpServletRequest req, String dir) {
        // 파일 업로드 경로 구하기
        ServletContext ctx = req.getServletContext();
        String path = ctx.getRealPath(dir);
        return path;
    }
    public String renameToFile(HttpServletRequest req, String oName) {

        logger.info(oName);
        String path = getFilePath(req);

        int i = oName.lastIndexOf(".");
        String ext = oName.substring(i);

        String uuid  = UUID.randomUUID().toString();
        String sName = uuid + ext;

        logger.info(sName);
        File f1 = new File(path+"/"+oName);
        File f2 = new File(path+"/"+sName);

        f1.renameTo(f2);

        return sName;
    }


    // 파일 업로드
    public MultipartRequest uploadFile(HttpServletRequest req) {
        // 파일 경로 구하기
        String path = getFilePath(req);

        // 최대 업로드 파일 크기
        int maxSize = 1024 * 1024 * 10;

        // 파일 업로드 및 Multipart 객체 생성
        MultipartRequest mr = null;

        try {
            mr = new MultipartRequest(req,
                    path,
                    maxSize,
                    "UTF-8",
                    new DefaultFileRenamePolicy());
        } catch (IOException e) {
            logger.error("uploadFile : " + e.getMessage());
        }

        return mr;
    }
    public MultipartRequest uploadFile(HttpServletRequest req, String path) {
        // 최대 업로드 파일 크기
        int maxSize = 1024 * 1024 * 10;

        // 파일 업로드 및 Multipart 객체 생성
        MultipartRequest mr = null;

        try {
            mr = new MultipartRequest(req,
                    path,
                    maxSize,
                    "UTF-8",
                    new DefaultFileRenamePolicy());
        } catch (IOException e) {
            logger.error("uploadFile : " + e.getMessage());
        }

        return mr;
    }
    // 파일 다운로드
    public void downloadFile(HttpServletRequest req, HttpServletResponse resp, FileDTO dto) throws IOException {
        // response 파일 다운로드 헤더 수정
        resp.setContentType("application/octet-stream");
        resp.setHeader("Content-Disposition", "attachment; filename="+ URLEncoder.encode(dto.getOriName(), "utf-8"));
        resp.setHeader("Content-Transfer-Encoding", "binary");
        resp.setHeader("Pragma", "no-cache");
        resp.setHeader("Cache-Control", "private");

        // response 파일 스트림 작업
        String path = getFilePath(req);

        File file = new File(path+"/"+dto.getNewName());

        BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
        BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());

        while(true){

            int data = bis.read();
            if(data == -1){
                break;
            }

            bos.write(data);
        }

        bos.close();
        bis.close();
    }

    public void deleteFile(String newName, HttpServletRequest req){
        String fileName = newName; //지울 파일명
        String filePath =getFilePath(req); //파일이 존재하는 실제경로
        filePath += "\\"+fileName;

        logger.info(filePath);
        File f = new File(filePath); // 파일 객체생성
        if( f.exists()) f.delete(); // 파일이 존재하면 파일을 삭제한다.
    }
    // 페이지 마지막 번호
    public int getLastPageNum(int total) {

        int lastPageNum = 0;

        if(total % 10 == 0){
            lastPageNum = total / 10;
        }else{
            lastPageNum = total / 10 + 1;
        }

        return lastPageNum;
    }

    // 페이지 그룹
    public int[] getPageGroupNum(int currentPage, int lastPageNum) {
        int currentPageGroup = (int)Math.ceil(currentPage / 10.0);
        int pageGroupStart = (currentPageGroup - 1) * 10 + 1;
        int pageGroupEnd = currentPageGroup * 10;

        if(pageGroupEnd > lastPageNum){
            pageGroupEnd = lastPageNum;
        }

        int[] result = {pageGroupStart, pageGroupEnd};

        return result;
    }

    // 페이지 시작번호
    public int getPageStartNum(int total, int currentPage) {
        int start = (currentPage - 1) * 10;
        return total - start;
    }

    // 현재 페이지 번호
    public int getCurrentPage(String pg) {
        int currentPage = 1;

        if(pg != null){
            currentPage = Integer.parseInt(pg);
        }

        return currentPage;
    }

    // Limit 시작번호
    public int getStartNum(int currentPage) {
        return (currentPage - 1) * 10;
    }
    //CountTotal
    public int selectCountTotal(String cate) {
        return articleDAO.selectCountTotal(cate);
    }
    public ArticleDTO insertComment(ArticleDTO articleDTO){
        return articleDAO.insertComment(articleDTO);
    }

    public List<ArticleDTO> selectComments(String parent) {
        return  articleDAO.selectComments(parent);
    }

    public void updateCommentPlus(String parent) {
        articleDAO.updateCommentPlus(parent);
    }
    public void updateCommentMinus(String parent) {
        articleDAO.updateCommentMinus(parent);
    }
    public void updateArticleHitPlus(String no) {
        articleDAO.updateArticleHitPlus(no);
    }
    public int deleteComment(String no) {
        return articleDAO.deleteComment(no);
    }
    public int updateComment(String no, String content) {
        return articleDAO.updateComment(no, content);
    }
}
