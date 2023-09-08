package kr.co.farmstory2.service;

import kr.co.farmstory2.dao.UserDAO;
import kr.co.farmstory2.dto.UserDTO;
import org.slf4j.Logger;

import java.util.List;

public class UserService {
    private Logger logger = org.slf4j.LoggerFactory.getLogger(UserService.class);
    private UserDAO userDAO = new UserDAO();

    public void insertUser(UserDTO userDTO) {
        userDAO.insertUser(userDTO);
    }

    public UserDTO selectUser(String uid, String pass) {
        return userDAO.selectUser(uid, pass);
    }

    public List<UserDTO> selectUsers(String start) {
        return userDAO.selectUsers(start);
    }

    public List<UserDTO> selectUsers() {
        return userDAO.selectUsers();
    }

    public void updateUserRole(List<UserDTO> userDTOS) {
        userDAO.updateUserRole(userDTOS);
    }

    public void deleteUser(String uid) {
        userDAO.deleteUser(uid);
    }

    public int selectCountUserValue(String value, int type) {
        return userDAO.selectCountUserValue(value, type);
    }

    public int selectCountTotal(){
        return userDAO.selectCountTotal();
    }

}
