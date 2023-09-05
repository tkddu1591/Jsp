package kr.co.farmstory2.service;

import kr.co.farmstory2.dao.FileDAO;
import kr.co.farmstory2.dto.FileDTO;

import java.util.List;

public class FileService {
    private FileDAO dao = new FileDAO();
    public void insertFile(FileDTO dto) {
        dao.insertFile(dto);
    }
    public FileDTO selectFile(String fno) {
        return dao.selectFile(fno);
    }

    public List<FileDTO> selectFiles() {
        return dao.selectFiles();
    }

    public void updateFile(FileDTO dto) {
        dao.updateFile(dto);
    }

    public int deleteFile(String ano) {
        return dao.deleteFile(ano);
    }
}
