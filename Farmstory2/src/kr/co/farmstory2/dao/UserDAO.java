package kr.co.farmstory2.dao;

import kr.co.farmstory2.db.DBHelper;
import kr.co.farmstory2.db.SQL;
import kr.co.farmstory2.dto.UserDTO;
import org.slf4j.Logger;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends DBHelper {
    private Logger logger = org.slf4j.LoggerFactory.getLogger(UserDAO.class);

    public void insertUser(UserDTO userDTO) {
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
            logger.error("insertUser error : %s".formatted(e.getMessage()));
        }
    }


    public UserDTO selectUser(String uid, String pass) {
        UserDTO userDTO = new UserDTO();
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_USER);
            psmt.setString(1, uid);
            psmt.setString(2, pass);
            rs = psmt.executeQuery();
            if (rs.next()) {
                userDTO = selectUserData();
            }
            close();
        } catch (SQLException e) {
            logger.error("selectUser error : %s".formatted(e.getMessage()));
        }
        return userDTO;
    }

    public List<UserDTO> selectUsers(String start) {
        List<UserDTO> userDTOS = new ArrayList<UserDTO>();
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_USERS);
            logger.info(start);
            int i=0;
            psmt.setInt(1, Integer.parseInt(start));
            rs = psmt.executeQuery();
            while (rs.next()) {
                UserDTO userDTO = new UserDTO();

                userDTO.setUid(rs.getString(1));
                userDTO.setName(rs.getString(2));
                userDTO.setNick(rs.getString(3));
                userDTO.setEmail(rs.getString(4));
                userDTO.setHp(rs.getString(5));
                userDTO.setRegDate(rs.getString(6));
                userDTO.setTotal(rs.getInt(7));
                userDTO.setZip(rs.getString(8));
                userDTO.setAddr1(rs.getString(9));
                userDTO.setAddr2(rs.getString(10));
                userDTO.setRegIp(rs.getString(11));
                userDTO.setRole(rs.getString(12));
                userDTO.setTotal(i);
                userDTOS.add(userDTO);
                i++;
            }
            close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userDTOS;
    }
    public List<UserDTO> selectUsers() {
        List<UserDTO> userDTOS = new ArrayList<UserDTO>();
        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_USERS_PREVIEW);
            rs = psmt.executeQuery();
            while (rs.next()) {
                UserDTO userDTO = new UserDTO();
                userDTO = selectUserData();
                userDTOS.add(userDTO);
            }
            close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userDTOS;
    }

    public void updateUser(String uid) {
    }

    public void deleteUser(String uid) {
    }


    public int selectCountUserValue(String value, int type) {
        int result = 0;

        try {
            conn = getConnection();
            if (type == 1) {
                psmt = conn.prepareStatement(SQL.SELECT_COUNT_UID);
            } else if (type == 2) {
                psmt = conn.prepareStatement(SQL.SELECT_COUNT_NICK);
            } else if (type == 3) {
                psmt = conn.prepareStatement(SQL.SELECT_COUNT_HP);
            }
            psmt.setString(1, value);
            rs = psmt.executeQuery();
            rs.next();
            result = rs.getInt(1);
            close();

        } catch (SQLException e) {
            logger.error(e.getMessage());
        }
        return result;
    }
    public int selectCountTotal() {

        int total = 0;

        try {
            conn = getConnection();
            psmt = conn.prepareStatement(SQL.SELECT_COUNT_USERS);
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


    public UserDTO selectUserData() throws SQLException {
        UserDTO userDTO = new UserDTO();
        userDTO.setUid(rs.getString(1));
        userDTO.setPass(rs.getString(2));
        userDTO.setName(rs.getString(3));
        userDTO.setNick(rs.getString(4));
        userDTO.setEmail(rs.getString(5));
        userDTO.setHp(rs.getString(6));
        userDTO.setRole(rs.getString(7));
        userDTO.setZip(rs.getString(8));
        userDTO.setAddr1(rs.getString(9));
        userDTO.setAddr2(rs.getString(10));
        userDTO.setRegIp(rs.getString(11));
        userDTO.setRegDate(rs.getString(12));
        userDTO.setLeaveDate(rs.getString(13));
        return userDTO;
    }
}
