package kr.co.Jboard2.dao;

import kr.co.Jboard2.db.DBHelper;
import kr.co.Jboard2.db.SQL;
import kr.co.Jboard2.dto.UserDTO;
import org.slf4j.Logger;

import java.sql.SQLException;
import java.util.List;

public class UserDAO extends DBHelper {
    private Logger logger = org.slf4j.LoggerFactory.getLogger(UserDAO.class);
    public void insertUser(UserDTO userDTO){
        logger.info("userInster start");
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.INSERT_USER);
            psmt.setString(1, userDTO.getUid());
            psmt.setString(2, userDTO.getPass());
            psmt.setString(3, userDTO.getName());
            psmt.setString(4, userDTO.getNick());
            psmt.setString(5, userDTO.getEmail());
            psmt.setString(6, userDTO.getHp());
            psmt.setString(7, userDTO.getZip());
            psmt.setString(8, userDTO.getAddr1());
            psmt.setString(9, userDTO.getAddr2());
            psmt.setString(10, userDTO.getRegIp());
            psmt.executeUpdate();
            close();
        } catch (SQLException e) {
            logger.error("userInster error: "+e.getMessage());
            throw new RuntimeException(e);
        }
    }
    public UserDTO selectUser(){
        return selectUser();
    }
    public List<UserDTO> selectUsers(){
        return selectUsers();
    }
    public void updateUser(UserDTO userDTO){}
    public void deleteUser(String uid){
    }

    public int selectCountUid(String uid){
        int result = 0;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_COUNT_UID);
            psmt.setString(1, uid);
            rs = psmt.executeQuery();
            if(rs.next()){
                result=rs.getInt(1);
            }
            close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
    public int selectCountNick(String nick){
        int result = 0;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_COUNT_NICK);
            psmt.setString(1, nick);
            rs = psmt.executeQuery();
            if(rs.next()){
                result=rs.getInt(1);
            }
            close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
    public int selectCounthp(String hp){
        int result = 0;
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_COUNT_HP);
            psmt.setString(1, hp);
            rs = psmt.executeQuery();
            if(rs.next()){
                result=rs.getInt(1);
            }
            close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
}
