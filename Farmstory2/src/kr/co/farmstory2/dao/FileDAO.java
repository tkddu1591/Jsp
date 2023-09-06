package kr.co.farmstory2.dao;

import kr.co.farmstory2.db.DBHelper;
import kr.co.farmstory2.db.SQL;
import kr.co.farmstory2.dto.FileDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.SQLException;
import java.util.List;

public class FileDAO extends DBHelper {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    public void insertFile(FileDTO dto) {
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.INSERT_FILE);
            psmt.setInt(1, dto.getaNo());
            psmt.setString(2, dto.getOriName());
            psmt.setString(3, dto.getNewName());
            psmt.executeUpdate();
            close();
        }catch (Exception e) {
            logger.error("insertFile() : " + e.getMessage());
        }
    }

    public FileDTO selectFile(String fNo) {
        FileDTO dto = null;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_FILE);
            psmt.setString(1, fNo);
            rs = psmt.executeQuery();

            if(rs.next()) {
                dto = new FileDTO();

                dto.setfNo(rs.getInt(1));
                dto.setaNo(rs.getInt(2));
                dto.setOriName(rs.getString(3));
                dto.setNewName(rs.getString(4));
                dto.setDownload(rs.getInt(5));
                dto.setrDate(rs.getString(6));

                logger.info("selectFile() : " + dto.getOriName());
                logger.info("selectFile() : " + dto.getNewName());
                logger.info("selectFile() : " + dto.getDownload());
                logger.info("selectFile() : " + dto.getrDate());
                logger.info("selectFile() : " + dto.getfNo());
                logger.info("selectFile() : " + dto.getaNo());
            }
            close();
        }catch (Exception e) {
            logger.error("selectFile() : "+e.getMessage());
        }
        return dto;
    }

    public List<FileDTO> selectFiles() {
        return null;
    }

    public void updateFile(FileDTO dto) {

    }

    public int deleteFile(String ano) {
        int result = 0;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.DELETE_FILE);
            psmt.setString(1, ano);
            result = psmt.executeUpdate();
            close();
        }catch (Exception e) {
            logger.error("deleteFile - " + e.getMessage());
        }

        return result;
    }

    public void updateFileDownloadPLUS(String fNo) {
        try {
            conn= getConnection();
            psmt = conn.prepareStatement(SQL.UPDATE_FILE_DOWNLOAD_PLUS);
            psmt.setString(1, fNo);
            psmt.executeUpdate();
            close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
